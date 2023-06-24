//
//  ColorCarouselView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import CarouselStack

struct ColorCarouselView: View {
    @Binding var bike: Bike
    
    var body: some View {
        CarouselStack(Color.bikeColors, initialIndex: 0) { color in
                color
                .frame(width: 20, height: 20)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.white, lineWidth: 2)
                })
                .cornerRadius(16)
                .padding()
                    
            }
            .carouselStyle(.infiniteScroll)
            .onCarousel { context in
                bike.color = Color.bikeColors[context.index]
            }
    }
}

struct ColorCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCarouselView(bike: .constant(Bike(name: "Firsty", type: .electric, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])))
    }
}
