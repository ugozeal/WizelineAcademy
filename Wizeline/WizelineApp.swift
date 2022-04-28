//
//  WizelineApp.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/27/22.
//

import SwiftUI

@main
struct WizelineApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView(books: bookList)
        }
    }
}
