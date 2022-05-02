//
//  WizelineApp.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/27/22.
//

import SwiftUI

@main
struct WizelineApp: App {
    let bookService: MockBookService = MockBookService()
    var body: some Scene {
        WindowGroup {
            BookListView(service: bookService)
        }
    }
}
