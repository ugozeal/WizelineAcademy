//
//  ContentView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/27/22.
//

import SwiftUI

struct BookDetailsView: View {
    var book: BookModel
    @State var animate = false
    
    var randomMinRange = 5.0
    var randomMaxRange = 8.0
    
    var body: some View {
        VStack {
            BookDetailImageView(image: Image(book.imageName))
                .scaleEffect(animate ? 1: 0)
                .rotationEffect(.degrees(animate ? 0 : 180))
                .opacity(animate ? 1: 0)
                .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                            .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                           value: animate)
            
            Spacer()
                .frame(height: 30)
            
            Text(book.author)
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text(book.bookName)
                .foregroundColor(.black)
                .font(.system(size: 24, weight: .semibold))
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.")
                .foregroundColor(.gray)
                .font(.body)
                .fontWeight(.regular)
                .lineLimit(4)
                .lineSpacing(6)
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 20) {
                ButtonPillView(text: "Fantasy", action: {
                    print("Do something")
                })
                    .scaleEffect(animate ? 1: 0)
                    .rotationEffect(.degrees(animate ? 0 : 180))
                    .opacity(animate ? 1: 0)
                    .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                                .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                               value: animate)
                
                ButtonPillView(text: "Action", action: {
                    print("Do something")
                })
                    .scaleEffect(animate ? 1: 0)
                    .rotationEffect(.degrees(animate ? 0 : 180))
                    .opacity(animate ? 1: 0)
                    .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                                .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                               value: animate)
                
                ButtonPillView(text: "Novel", action: {
                    print("Do something")
                })
                    .scaleEffect(animate ? 1: 0)
                    .rotationEffect(.degrees(animate ? 0 : 180))
                    .opacity(animate ? 1: 0)
                    .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                                .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                               value: animate)
            }
            .padding(.bottom, 10)
            
            Divider()
                .padding(.bottom, 30)
                .padding([.leading, .trailing], 20)
            
            HStack {
                FilledButtonView(text: "Buy for $\(book.priceToDouble())", textColor: Color.white, backgroundColor: Color.black) {
                    print("Buy now")
                }
                .scaleEffect(animate ? 1: 0)
                .rotationEffect(.degrees(animate ? 0 : 180))
                .opacity(animate ? 1: 0)
                .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                            .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                           value: animate)
            }
        }
        .onAppear {
            withAnimation {
                animate.toggle()
            }
        }
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: bookList[0])
    }
}
