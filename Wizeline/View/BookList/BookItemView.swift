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
        HStack(alignment: .top) {
            BookImageView(image: Image(book.imageName))
            VStack(alignment: .leading) {
                Spacer()
                Text(book.bookName)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(book.author)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Spacer()
                Text("$\(book.priceToDouble())")
                    .foregroundColor(.green)
                    .font(.title)
                Spacer()
            }
        }
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(book: bookList[0])
    }
}
