//
//  Networkable.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import Foundation
import Moya

protocol BookNetworkable {
    var bookProvider: MoyaProvider<BookApi> { get }
    func getAllBooks(page: Int, completion: @escaping ([Book]) -> ())
    func getBooksByCategory(page: Int, category: String, completion: @escaping ([Book]) -> ())
}
