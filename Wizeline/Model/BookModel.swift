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
