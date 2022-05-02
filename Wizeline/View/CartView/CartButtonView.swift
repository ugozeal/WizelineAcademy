//
//  CartButtonView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/30/22.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfItems: Int
    var body: some View {
        VStack {
            Image("shopping-bag")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
                .overlay(CartImageOverlay(numberOfItems: numberOfItems)
                            .padding(.top, 4),
                         alignment: .center)
            Spacer()
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfItems: 2)
    }
}
