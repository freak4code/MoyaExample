//
//  BookRequest.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import Foundation

struct BookRequest: Codable {
    let page, perPage, totalBooks, totalPages: Int
    let books: [Book]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalBooks = "total_books"
        case totalPages = "total_pages"
        case books
    }
}
