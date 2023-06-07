//
//  BikeComponentsView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct BikeComponentsView: View {
//    let title: String
//    let components: [String]
//
//    @Binding var currentColor: Color
    
    @Binding var bike: Bike
    let components: [String]
    let title: String
    
    var body: some View {
        ZStack {
            ForEach(components, id: \.self) { bikeIcons in
                VStack {
                    if bikeIcons.contains("middle") {
                        Image(bikeIcons)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(bike.color)
                    } else {
                        Image(bikeIcons)
                            .resizable()
                            .scaledToFit()
                    }
                    
                    BikeUIText(text: title, size: 15, weight: .regular, color: .white)
                }
            }
        }
    }
}

//struct BikeComponentsView_Previews: PreviewProvider {
//    static let type = BikeType.road
//    static var previews: some View {
//        BikeComponentsView(bike: .constant(Bike(name: "Firsty", type: .mtb, wheelSize: .twentyEight, color: .darkSkyBlue, serviceDue: "1200", isDefault: true, rides: [])), components: type.mtbBikeCarouselComponents, title: type.rawValue)
//    }
//}
