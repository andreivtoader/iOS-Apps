//
//  DropdownInputText.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct DropdownInputText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.white)
            .padding(.horizontal)
    }
}

struct DropdownInputText_Previews: PreviewProvider {
    static var previews: some View {
        DropdownInputText(text: "Some cool input text")
    }
}
