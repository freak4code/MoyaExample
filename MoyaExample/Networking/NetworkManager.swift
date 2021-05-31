//
//  NetworkManager.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import Foundation
import Moya

enum APIEnviroment {
    case testing
    case production
    case dafault
}

struct NetworkManager {
    let bookProvider = MoyaProvider<BookApi>(plugins:[NetworkLoggerPlugin()])
    static let enviroment = APIEnviroment.testing
    static let BookApiKey = "987654321"
}

extension NetworkManager: BookNetworkable {
    func getAllBooks(page: Int, completion: @escaping ([Book]) -> ()) {
        bookProvider.request(.allBooks(page: page)) { result in
            switch result {
            case let .success(response):
                let result = try? JSONDecoder().decode(BookRequest.self, from: response.data)
                completion(result!.books)
           
            case let .failure(error):
            print(error)
            }
        }
    }
    
    func getBooksByCategory(page: Int, category: String, completion: @escaping ([Book]) -> ()) {
        bookProvider.request(.byCategory(category: category, page: page)) { result in
            switch result{
            case let .success(response):
                let result = try? JSONDecoder().decode(BookRequest.self, from: response.data)
                completion(result!.books)
           
            case let .failure(error):
            print(error)
            }
        }
    }
}
