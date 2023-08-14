//
//  TagView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct TagView: View {
    let description: String
    
    var body: some View {
        Text("#\(description)")
            .padding(10)
            .foregroundColor(.gray)
            .font(.system(size: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(description: "life")
    }
}
