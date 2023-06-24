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
    
    // work on a copy in case we want to cancel
    @State var currentBike = Bike(name: "", type: .mtb, wheelSize: .twentySix, color: .blueLagoon, serviceDue: "", isDefault: true, rides: [])
    
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
                        //update with validated values from FormValidator
                        currentBike.name = manager.formValidator.bikeName
                        currentBike.serviceDue = manager.formValidator.serviceIn
                        currentBike.wheelSize = WheelSize(rawValue: manager.formValidator.wheelSize) ?? .twentySix

                        manager.formValidator.clearBikeFormEntries()
                        manager.update(bike: bike, withValues: currentBike)

                        dismiss()
                    }
                    .opacity(manager.formValidator.isBikeRegistrationValid ? 1 : 0.6)
                    .disabled(manager.formValidator.isBikeRegistrationValid == false)
                }
                
                Spacer()
            }
        }
        .onAppear {
            // make a copy of the bike and work on a temporary in case we want to cancel
            currentBike = bike

            // update form entries for editing
            manager.formValidator.updateBikeFormEntriesForEditing(bike: currentBike)
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
