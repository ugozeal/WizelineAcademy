//
//  CartView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/29/22.
//

import SwiftUI

struct CartView: View {
    @Binding var showModal: Bool
    @State private var showingAlert = false
    @State private var jiggling = false
    @State private var jiggling_counter = 0
    var scale_effect = 1.2
    let rotation_angle_base = 15
    @State private var rotation_angle = 0
    @ObservedObject var viewModel: ViewModel
    
    init(showModal: Binding<Bool>, service: MockBookService) {
        self.viewModel = ViewModel(mockBookService: service)
        self._showModal = showModal
        rotation_angle = -rotation_angle_base
    }
    
    func jiggle_shipping_icon(apply_delay: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + (apply_delay ? 5 : 0)) {
            withAnimation() {
                jiggling.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation() {
                    jiggling.toggle()
                }
                jiggling_counter += 1
                if(jiggling_counter == 4) {
                    jiggling_counter = 0
                    rotation_angle = -rotation_angle_base
                    jiggle_shipping_icon(apply_delay: true)
                } else {
                    if(rotation_angle < 0) {
                        rotation_angle = rotation_angle_base
                    } else {
                        rotation_angle = -rotation_angle_base
                    }
                    jiggle_shipping_icon(apply_delay: false)
                }
            }
        }
    }
    
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // Dismiss button
                HStack() {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(20)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                // Title
                VStack {
                    Text("Your bag")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Text(String(viewModel.mockBookService.numberOfCartItems()) + " items")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                
                // Item list
                VStack(alignment: .leading) {
                    ForEach(viewModel.mockBookService.cart.items) { item in
                        CartItemView(item: item)
                    }
                }
                Spacer().frame(height: 20)
                
                // Summary
                HStack {
                    VStack {
                        Image("delivery")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.bottom, -8)
                        Text("FREE")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                    }
                    .frame(width: 64, height: 64)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                    .scaleEffect(jiggling ? scale_effect : 1)
                    .animation(.linear(duration: 0.15), value: jiggling)
                    .onAppear {
                        if viewModel.mockBookService.numberOfCartItems() > 0 {
                            jiggle_shipping_icon(apply_delay: false)
                        }
                    }
                    Spacer().frame(width: 40)
                    
                    VStack(alignment: .leading) {
                        Text("Total:")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Text("$" + String((viewModel.mockBookService.cart.totalToDouble())))
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                    }
                    Spacer().frame(width: 80)
                }
                
                // Checkout button
                Divider().padding()
                Button(action: {
                    self.showingAlert = true
                }) {
                    HStack {
                        Text("Checkout")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(40)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Order confirmed"),
                          message: Text("Thank you for your purchase."),
                          dismissButton: .default(Text("Done")) {
                        self.showModal.toggle()
                        self.viewModel.mockBookService.checkout()
                    })
                }
                .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                .scaleEffect(jiggling ? scale_effect : 1)
                .animation(.linear(duration: 0.15), value: jiggling)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let bookService: MockBookService = MockBookService()
        CartView(showModal: .constant(true), service: bookService)
    }
}
