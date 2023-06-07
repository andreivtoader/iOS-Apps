//
//  ColorCarouselView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI
import CarouselStack

struct ColorCarouselView: View {
    @Binding var selectedColor: UIColor
    
    var body: some View {
        CarouselStack(BikeColor.assetBikeColorsUI, initialIndex: 0) { color in
                color
                    .frame(width: 30, height: 30)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(.white, lineWidth: 4)
                    })
                    .cornerRadius(16)
                    .padding()
                    
            }
            .carouselStyle(.infiniteScroll)
            .onCarousel { context in
                selectedColor = BikeColor.getColor(index: context.index)
            }
    }
}

struct ColorCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCarouselView(selectedColor: .constant(.brightBlue))
            .background(.blue)
    }
}
