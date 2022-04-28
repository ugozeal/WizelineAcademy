//
//  ContentView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    var book: BookModel
    var body: some View {
        VStack {
            BookDetailImageView(image: Image(book.imageName))
            Text(book.author)
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding(.top)
            
            Text(book.bookName)
                .foregroundColor(.black)
                .font(.title2)
                .fontWeight(.semibold)
            Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.")
                .foregroundColor(.gray)
                .font(.body)
                .fontWeight(.regular)
                .lineLimit(4)
                .padding(.top, 2)
                .padding(.bottom, 8)
            HStack(spacing: 20) {
                ButtonPillView(text: "Fantasy", action: {
                    print("Why na")
                })
                
                ButtonPillView(text: "Action", action: {
                    print("Why na")
                })
                
                ButtonPillView(text: "Novel", action: {
                    print("Why na")
                })
            }
            Divider()
                .padding(.vertical)
            
            HStack {
                FilledButtonView(text: "Buy for $\(book.priceToDouble())", textColor: Color.white, backgroundColor: Color.black) {
                    print("Buy now")
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: bookList[0])
    }
}
