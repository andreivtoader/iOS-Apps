//
//  SettingsPageTitleText.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct SettingsPageTitleText: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.white)
    }
}

struct SettingsPageTitleText_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageTitleText(title: "Cool title")
            .background(.black)
    }
}
