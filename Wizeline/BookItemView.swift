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
                Text(book.bookName)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 18)
                
                Text(book.author)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Text("$\(book.priceToDouble())")
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.top, 10)
                
            }
        }
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(book: bookList[0])
    }
}
