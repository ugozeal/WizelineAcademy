//
//  CartModel.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/29/22.
//

import Foundation

struct CartItems {
    var id: Int
    var item: BookModel
    var unit: Int
}

struct Cart {
    var items: [CartItems]
    var numberOfItems: Int
    var total: Int
}
