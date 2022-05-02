//
//  BookModel.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import Foundation

struct BookModel: Hashable, Identifiable {
    var id: Int
    var bookName: String
    var author: String
    var price: Double
    var imageName: String
    
    func priceToDouble() -> String {
        return String(format: "%.2f", price)
    }
}

enum Genre: String {
    case fantasy = "Fantasy"
    case action = "Action"
    case history = "History"
    case present = "Present"
    case drama = "Drama"
    case scienceFiction = "Sci-Fi"
    case economics = "Economics"
    case business = "Business"
}

struct BookDetail: Identifiable {
    var id: String
    var bookId: Int
    var author, title: String
    var price: Double
    var genre: [Genre]
    var kind, description, imageName : String
    var isAvailable: Bool
    
    func priceToDouble() -> String {
        return String(format: "%.2f", price)
    }
}
