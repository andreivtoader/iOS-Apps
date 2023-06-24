//
//  BikeCarouselView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import ACarousel
import CarouselStack

struct BikeCarouselView: View {
    @Binding var bike: Bike
    @State private var currentCarouselIndex = 0
    
    var body: some View {
            VStack(spacing: 0) {
                ColorCarouselView(bike: $bike)
                            
                ACarousel(BikeType.allCases, index: $currentCarouselIndex) { type in
                    VStack {
                        switch type {
                        case .mtb:
                            BikeComponentsView(bike: $bike, components: type.mtbBikeCarouselComponents, title: type.rawValue)
                        case .road:
                            BikeComponentsView(bike: $bike, components: type.roadBikeCarouselComponents, title: type.rawValue)
                        case .hybrid:
                            BikeComponentsView(bike: $bike, components: type.hybridBikeCarouselComponents, title: type.rawValue)
                        case .electric:
                            BikeComponentsView(bike: $bike, components: type.electricBikeCarouselComponents, title: type.rawValue)
                        }
                    }
                }
                .onChange(of: currentCarouselIndex) { newValue in
                    bike.type = BikeType.getType(from: newValue)
                }
                
                PaginationCarouselView(index: $currentCarouselIndex)
                    .padding()
        }
    }
}

struct BikeCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        BikeCarouselView(bike: .constant(Bike(name: "Firsty", type: .electric, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])))
            .background(Color.tealishBlue)
    }
}
