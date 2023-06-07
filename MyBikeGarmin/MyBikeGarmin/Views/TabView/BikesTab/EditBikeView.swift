//
//  EditBikeView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct EditBikeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    @State var currentBike = Bike(name: "", type: .mtb, wheelSize: .twentySixPointFive, color: .blueLagoon, serviceDue: "", isDefault: true, rides: [])
    
    private let carouselHeightFactor = 2.5
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            Image("wave")
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                VStack {
                    ModalTitleView(title: "Edit Bike")
                }
                
                Spacer()
                
                VStack {
                    BikeCarouselView(bike: $currentBike)
                    BikesForm(manager: manager, bike: $currentBike)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    AddButtonView(title: "Save") {
                        self.manager.update(bikeName: bike.name, withValues: currentBike)
                        dismiss()
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            // make a copy of the bike and work on a temporary in case we want to cancel
            currentBike = bike
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct EditBikeView_Previews: PreviewProvider {
    static var previews: some View {
        EditBikeView(manager: BikeManager(), bike: .constant(Bike(name: "mmm", type: .mtb, wheelSize: .twentyEight, color: .burntYellow, serviceDue: "1200", isDefault: false, rides: [])))
    }
}
