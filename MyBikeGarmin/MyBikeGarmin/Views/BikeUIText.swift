//
//  BikeUIText.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct BikeUIText: View {
    let text: String
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight))
            .foregroundColor(color)
    }
}

struct BikeUIText_Previews: PreviewProvider {
    static var previews: some View {
        BikeUIText(text: "Title", size: 17, weight: .regular, color: .blue)
    }
}
