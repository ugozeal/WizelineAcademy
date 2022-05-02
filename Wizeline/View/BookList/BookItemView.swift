//
//  BookItemView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct BookItemView: View {
    var book: BookModel
    var body: some View {
        HStack() {
            BookImageView(image: Image(book.imageName))
            VStack(alignment: .leading) {
                Text(book.bookName)
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("by \(book.author)")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Spacer().frame(height: 15)
                Text("$\(book.priceToDouble())")
                    .foregroundColor(.green)
                    .font(.title)
            }
        }
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        let bookService: MockBookService = MockBookService()
        let book = ViewModel(mockBookService: bookService).mockBookService.books[0]
        BookItemView(book: book)
    }
}
