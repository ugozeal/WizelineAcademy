//
//  FilledButtonView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct FilledButtonView: View {
    var text: String
    var textColor: Color
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {
                HStack {
                    Text(text)
                        .foregroundColor(textColor)
                        .padding(.horizontal, 20)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(backgroundColor)
                .cornerRadius(.infinity)
                .compositingGroup()
        }
        Spacer()
        }
    }
}

struct FilledButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilledButtonView(text: "Buy something", textColor: Color.white, backgroundColor: Color.black, action: {
            print("Something")
        })
    }
}
