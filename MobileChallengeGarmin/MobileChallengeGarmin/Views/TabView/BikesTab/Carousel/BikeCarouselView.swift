//
//  BikeCarouselView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI
import ACarousel

struct BikeCarouselView: View {
    @Binding var selectedColor: UIColor
    @Binding var type: BikeType
    
    @State var currentIndex = 0
    
    let bikes: [BikeUI] = [
        BikeUI(bikeType: .road, type: .road),
        BikeUI(bikeType: .electric, type: .electric),
        BikeUI(bikeType: .hybrid, type: .hybrid),
        BikeUI(bikeType: .mtb, type: .mtb)
    ]
    
    var body: some View {
        ACarousel(bikes, index: $currentIndex) { bike in
                VStack {
                    BikeView(displayBike: bike, selectedColor: selectedColor) {
                        type = bikes[currentIndex].type
                        print("Type is now: \(type.rawValue)")
                    }

                    CarouselTitleView(title: bikes[currentIndex].type.rawValue)
                }
        }
        .frame(height: 150)
        
        CarouselPaginationView(pagesCount: bikes.count, currentPage: $currentIndex)
            .background(Color(UIColor.tealishBlue))
    }
}

struct BikeCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        BikeCarouselView(selectedColor: .constant(.brightBlue), type: .constant(.road))
            .background(.blue)
    }
}
