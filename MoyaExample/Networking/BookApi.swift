//
//  BookApi.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import Foundation
import Moya

enum BookApi {
    case allBooks(page: Int)
    case byCategory(category: String, page: Int)
}
extension BookApi: TargetType {
    
    var enviromentBaseURL: String {
        switch NetworkManager.enviroment {
        case .production:
            return "https://book.snnafi.com/APP/books/books.php"
        case .testing:
            return "https://book.snnafi.com/APP/books/books.php"
        case .dafault:
            return "https://book.snnafi.com/APP/books/books.php"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: enviromentBaseURL) else {
            fatalError("Invalid URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allBooks:
            return .post
        case .byCategory:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .allBooks:
            return Helper.getTestResponse("books")
        default:
            return Helper.getTestResponse("books")
        }
    }
    
    var task: Task {
        switch  self {
        case .allBooks(let page):
            return .requestParameters(parameters: ["api_key": NetworkManager.BookApiKey, "page": page], encoding: URLEncoding.queryString)
        case .byCategory(let category, let page):
            return .requestParameters(parameters: ["api_key": NetworkManager.BookApiKey, "page": page, "category": category], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
}
