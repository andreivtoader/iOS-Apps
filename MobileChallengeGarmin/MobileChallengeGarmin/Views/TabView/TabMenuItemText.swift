//
//  TabMenuItemText.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct TabMenuItemText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 11, weight: .regular))
            .foregroundColor(Color(UIColor.brightBlue))
    }
}

//struct TabMenuItemText_Previews: PreviewProvider {
//    static var previews: some View {
//        TabMenuItemText(text: "Cool text")
//            .background(Color.accentColor)
//    }
//}
