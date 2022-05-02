//
//  BookListView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct BookListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    init(service: MockBookService) {
        self.viewModel = ViewModel(mockBookService: service)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.mockBookService.bookList()) { book in
                NavigationLink(destination: LazyNavigationView(
                    BookDetailsView(
                        service: viewModel.mockBookService,
                        bookId: book.id))) {
                    BookItemView(book: book)
                }
            }
            .navigationBarTitle("Book list")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        let bookService: MockBookService = MockBookService()
        BookListView(service: bookService)
    }
}
