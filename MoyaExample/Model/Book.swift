//
//  Book.swift
//  MoyaExample
//
//  Created by Shahriar Nasim Nafi on 6/11/20.
//

import Foundation

struct Book: Codable {
    let id: String
    let bookImage: String
    let bookCoverImage, bookName, bookWriter, bookStatus: String
    let bookAvailable, bookNotavailable, bookReview, bookType: String
    let bookPublisher, totalread, bookAverageReview, isbookreviewed: String
    let bookCatagory, bookState: String

    enum CodingKeys: String, CodingKey {
        case id
        case bookImage = "book_image"
        case bookCoverImage = "book_cover_image"
        case bookName = "book_name"
        case bookWriter = "book_writer"
        case bookStatus = "book_status"
        case bookAvailable = "book_available"
        case bookNotavailable = "book_notavailable"
        case bookReview = "book_review"
        case bookType = "book_type"
        case bookPublisher = "book_publisher"
        case totalread
        case bookAverageReview = "book_average_review"
        case isbookreviewed
        case bookCatagory = "book_catagory"
        case bookState = "book_state"
    }
}

extension Book: CustomStringConvertible {
    var description: String {
        """
Book ->
       Name: \(bookName)
       Author: \(bookWriter)
       Publisher: \(bookPublisher)
       Genre: \((bookType))
       Category: \(bookCatagory)
      
"""
    }
}
