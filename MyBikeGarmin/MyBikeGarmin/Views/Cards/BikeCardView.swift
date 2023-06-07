//
//  BikeCardView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct BikeCardView: View {
    @Binding var bike: Bike
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        ZStack {
            Color.cloudBurst.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                BikeCardTitleView(manager: manager, bike: $bike)
                
                Spacer()
                
                switch bike.type {
                case .mtb:
                    BikeComponentsView(bike: $bike, components: bike.type.mtbBikeCarouselComponents, title: "")
                case .road:
                    BikeComponentsView(bike: $bike, components: bike.type.roadBikeCarouselComponents, title: "")
                case .hybrid:
                    BikeComponentsView(bike: $bike, components: bike.type.hybridBikeCarouselComponents, title: "")
                case .electric:
                    BikeComponentsView(bike: $bike, components: bike.type.electricBikeCarouselComponents, title: "")
                }
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        BikeUIText(text: bike.name, size: 20, weight: .semibold, color: .white)
                        BikeUIText(text: bike.wheelSize.description, size: 20, weight: .regular, color: .white)
                        
                        HStack {
                            BikeUIText(text: "Service in", size: 17, weight: .regular, color: .white)
                            BikeUIText(text: "\(bike.serviceDue)\(manager.settings.unit.description.lowercased())", size: 17, weight: .semibold, color: .white)
                        }
                        
                        // we need to get the percentage as values from 0...1
                        ProgressBarView(percentage: (manager.getDistancePercentage(for: bike) / 100))
                    }
                    Spacer()
                }
            }
            .padding()
            .background(
                VStack {
                    Spacer()
                    Image("wave")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.waikawaGrey)
                }
            )
            .cornerRadius(10)
        }
    }
}

struct BikeCardView_Previews: PreviewProvider {
    static var previews: some View {
        BikeCardView(bike: .constant(Bike(name: "Firsty", type: .mtb, wheelSize: .twentyNine, color: .charcoalGrey, serviceDue: "500", isDefault: false, rides: [])), manager: BikeManager())
//            .background(Color.waikawaGrey)
    }
}
