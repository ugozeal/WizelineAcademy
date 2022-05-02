//
//  ContentView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/27/22.
//

import SwiftUI

struct BookDetailsView: View {
    var bookId: Int
    @State var showModal = false
    @State var animate = false
    @State var showAlert = false
    
    var randomMinRange = 5.0
    var randomMaxRange = 8.0
    
    @ObservedObject var viewModel: ViewModel
    
    init(service: MockBookService, bookId: Int) {
        self.viewModel = ViewModel(mockBookService: service)
        self.bookId = bookId
    }
    
    func getBook() -> BookDetail {
        return viewModel.mockBookService.bookDetails(bookId: bookId)
    }
    
    func addToCart() {
        viewModel.mockBookService.addToCart(bookId: bookId)
    }
    
    var body: some View {
        VStack {
            BookDetailImageView(image: Image(getBook().imageName))
                .scaleEffect(animate ? 1: 0)
                .rotationEffect(.degrees(animate ? 0 : 180))
                .opacity(animate ? 1: 0)
                .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                            .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                           value: animate)
            
            Spacer()
                .frame(height: 30)
            
            Text(getBook().author)
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text(getBook().title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .font(.system(size: 24, weight: .semibold))
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            Text(getBook().description)
                .foregroundColor(.gray)
                .font(.body)
                .fontWeight(.regular)
                .lineLimit(4)
                .lineSpacing(6)
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 20) {
                ForEach(getBook().genre, id: \.self){ genre in
                    ButtonPillView(text: genre.rawValue)
                        .scaleEffect(animate ? 1: 0)
                        .rotationEffect(.degrees(animate ? 0 : 180))
                        .opacity(animate ? 1: 0)
                        .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                                    .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                                   value: animate)
                }
            }
            .padding(.bottom, 10)
            
            Divider()
                .padding(.bottom, 30)
                .padding([.leading, .trailing], 20)
            
            HStack {
                if getBook().isAvailable {
                    FilledButtonView(text: "Read", textColor: Color.white, backgroundColor: Color.green) {
                        print("Buy now")
                    }
                } else {
                    FilledButtonView(text: "Buy for $\(getBook().priceToDouble())", textColor: Color.white, backgroundColor: Color.black) {
                        addToCart()
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Book has been added to cart"), message: Text("You are ready to proceed to checkout to complete your order"), dismissButton: .default(Text("OK")))
                    })
                    .scaleEffect(animate ? 1: 0)
                    .rotationEffect(.degrees(animate ? 0 : 180))
                    .opacity(animate ? 1: 0)
                    .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 1)
                                .delay(Double.random(in: randomMinRange..<randomMaxRange) * 0.1),
                               value: animate)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                if viewModel.mockBookService.numberOfCartItems() > 0 {
                    self.showModal = true
                }
            }) {
                CartButtonView(numberOfItems: self.viewModel.mockBookService.cart.numberOfItems)
            }.sheet(isPresented: $showModal, onDismiss: {
                
            }) {
                CartView(showModal: self.$showModal, service: self.viewModel.mockBookService)
            })
            .navigationBarTitle(Text(""), displayMode: .inline)
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
        }
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let bookService: MockBookService = MockBookService()
        BookDetailsView(service: bookService, bookId: 1)
    }
}
