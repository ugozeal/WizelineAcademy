//
//  BookImageView.swift
//  Wizeline
//
//  Created by David U. Okonkwo on 4/28/22.
//

import SwiftUI

struct BookImageView: View {
    let image: Image
    var body: some View {
        
        image
            .resizable()
            .frame(width: 70, height: 110)
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
            .padding()
    }
}

struct BookImageView_Previews: PreviewProvider {
    static var previews: some View {
        BookImageView(image: Image("book1"))
    }
}
