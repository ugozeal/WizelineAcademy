//
//  BookListView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct BookListView: View {
    var books: [BookModel] = bookList
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: LazyNavigationView(ContentView(book: book))) {
                        BookItemView(book: book)
                    }
                }
            }
            .navigationBarTitle("Book list")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView(books: bookList)
    }
}
