//
//  ButtonPillView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct ButtonPillView: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text)
                    .foregroundColor(.black)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 1))
        }
    }
}

struct ButtonPillView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPillView(text: "Fantasy", action: {
            print("Something")
        })
    }
}
