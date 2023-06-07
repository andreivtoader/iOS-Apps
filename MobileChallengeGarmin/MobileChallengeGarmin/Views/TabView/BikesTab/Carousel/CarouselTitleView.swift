//
//  CarouselTitleView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct CarouselTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(.white)
    }
}

struct CarouselTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTitleView(title: "Cool carousel title")
    }
}
