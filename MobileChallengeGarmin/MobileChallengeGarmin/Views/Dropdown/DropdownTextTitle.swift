//
//  DropdownTextTitle.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct DropdownTextTitle: View {
    let text: String
    let requiredIcon: Bool
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color(UIColor.greyCloud)) 
            
            if requiredIcon {
                Image(K.UIIcons.REQUIRED)
            }
            
            Spacer()
        }
    }
}

struct DropdownTextTitle_Previews: PreviewProvider {
    static var previews: some View {
        DropdownTextTitle(text: "Cool title", requiredIcon: true)
            .background(.black)
    }
}
