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
            List(books) { book in
                NavigationLink(destination: LazyNavigationView(BookDetailsView(book: book))) {
                    BookItemView(book: book)
                }
            }
//            List {
//                ForEach(books) { book in
//                    NavigationLink(destination: LazyNavigationView(BookDetailsView(book: book))) {
//                        BookItemView(book: book)
//                    }
//                }
//            }
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
