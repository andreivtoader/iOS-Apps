//
//  BikeDetailsView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI

struct BikeDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    let title: String
    @Binding var bike: Bike?
    
    var body: some View {
        ZStack {
            Color(UIColor.tealishBlue).ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Back")
                    }
                    Spacer()
                    
                    Text(title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("icon_overflow")

                }
                .padding(.horizontal)
                Spacer()
                
                VStack {
                    BikeView(displayBike: .init(bikeType: .mtb, type: .mtb), selectedColor: .red) {
                        
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Rides: \(self.manager.getTotalRides(for: bike?.name ?? ""))")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            Text("Total rides distance: \(self.manager.getTotalDistanceRidden(for: bike?.name ?? ""))")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            Text("Service percentage: \(self.manager.getDistancePercentage(for: bike?.name ?? ""))")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            
                            ProgressBarView(percentage: self.manager.getDistancePercentage(for: bike?.name ?? ""))
                        }
                        Spacer()
                    }
                }
                .padding()
                
                List {
                    ForEach(self.manager.getAllRides(for: bike?.name ?? "")) { bikeRide in
                        RideCardView(ride: bikeRide)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .background(Color(UIColor.tealishBlue))
                .scrollContentBackground(.hidden)
//                .listStyle(.inset)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct BikeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BikeDetailsView(manager: BikeManager(), title: "Edit bike", bike: .constant(Bike(name: "asd", type: .road, wheelSize: .twentyEight, color: .blue, serviceDue: 200, isDefault: false, rides: [Ride]())))
    }
}
