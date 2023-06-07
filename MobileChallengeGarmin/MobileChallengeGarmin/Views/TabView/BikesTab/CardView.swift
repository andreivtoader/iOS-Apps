//
//  CardView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI

struct CardView: View {
    let bike: Bike
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Spacer()
                    
                    Menu {
                        
                        Button() {
                            // edit
                        } label: {
                            HStack {
                                Image("icon_edit")
                                Text("Edit bike")
                            }
                        }
                        
                        
                        Button(role: .destructive) {
                            // delete
                        } label: {
                            Text("Delete bike")
                        }


                    } label: {
                        Image("icon_overflow")
                    }
                }
            
                
                Spacer()
                BikeView(displayBike: BikeUI(bikeType: BikeUI.fromBikeTypeToBikeTypeUI(type: bike.type), type: bike.type), selectedColor: UIColor(bike.color)) {

                }
                Spacer()

                HStack {
                    VStack(alignment: .leading) {
                        Text(bike.name)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                        .padding(.bottom, 4)
                        Text(String(bike.wheelSize.rawValue))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Service in \(bike.serviceDue)km")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        // service due progress bar
                        ProgressBarView(percentage: 0.25)
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(UIColor.waikawaGrey))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(bike: Bike(name: "FirstBike", type: .mtb, wheelSize: .twentyEight, color: .red, serviceDue: 275, isDefault: true, rides: [Ride]()))
    }
}
