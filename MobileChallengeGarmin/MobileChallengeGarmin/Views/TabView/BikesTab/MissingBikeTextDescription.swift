//
//  MissingBikeTextDescription.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct MissingBikeTextDescription: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(.white)
    }
}

struct MissingBikeTextDescription_Previews: PreviewProvider {
    static var previews: some View {
        MissingBikeTextDescription(text: "Cool text")
    }
}
