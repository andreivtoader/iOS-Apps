//
//  BikeDetailsView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct BikeDetailsView: View {
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                switch bike.type {
                case .mtb:
                    BikeComponentsView(bike: $bike, components: bike.type.mtbBikeCarouselComponents, title: "")
                        .padding()
                case .road:
                    BikeComponentsView(bike: $bike, components: bike.type.roadBikeCarouselComponents, title: "")
                        .padding()
                case .hybrid:
                    BikeComponentsView(bike: $bike, components: bike.type.hybridBikeCarouselComponents, title: "")
                        .padding()
                case .electric:
                    BikeComponentsView(bike: $bike, components: bike.type.electricBikeCarouselComponents, title: "")
                        .padding()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        BikeUIText(text: "Wheels: \(bike.wheelSize.description)", size: 20, weight: .regular, color: .white)
                        
                        HStack {
                            BikeUIText(text: "Service in", size: 20, weight: .regular, color: .white)
                            BikeUIText(text: "\(bike.serviceDue)\(manager.settings.unit.description.lowercased())", size: 20, weight: .semibold, color: .white)
                        }
                        
                        // we need to get the percentage as values from 0...1
                        ProgressBarView(percentage: (manager.getDistancePercentage(for: bike) / 100))
                            .padding(.vertical)
                    
                        BikeUIText(text: "Rides: \(manager.getTotalRides(for: bike))", size: 17, weight: .regular, color: .white)
                        
                        HStack {
                            BikeUIText(text: "Total Rides Distance", size: 20, weight: .regular, color: .white)
                            BikeUIText(text: "\(manager.getDistanceRidden(for: bike))\(manager.settings.unit.description.lowercased())", size: 20, weight: .semibold, color: .white)
                        }
                        
                        
                        List {
                            ForEach(manager.getAllRides(for: bike), id: \.self) { ride in
                                RideCardView(manager: manager, ride: .constant(ride))
                                    .listRowBackground(Color.tealishBlue)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(.inset)
                        .background(Color.tealishBlue)
                        .scrollContentBackground(.hidden)
                        .overlay {
                            // workaround in case the list is empty to change the background color
                            Group {
                                if manager.getAllRides(for: bike).isEmpty {
                                    ZStack {
                                        Color.tealishBlue.ignoresSafeArea()
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(bike.name)
        .navigationBarTitleTextColor(.white)
        .toolbar {
            ToolbarItem {
                BikeCardTitleView(manager: manager, bike: $bike)
            }
            
        }
    }
}

struct BikeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BikeDetailsView(manager: BikeManager(), bike: .constant(Bike(name: "firsty", type: .mtb, wheelSize: .twentyNine, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: [])))
    }
}
