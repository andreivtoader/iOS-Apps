//
//  AddRideView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct AddRideView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    @State var ride = Ride(title: "", bike: Bike(name: "", type: .mtb, wheelSize: .twentySix, color: .white, serviceDue: "", isDefault: false, rides: []), distance: "", duration: Duration(hours: 0, minutes: 0), date: Date.now)
    
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack {
                ModalTitleView(title: "Add Ride")
                
                RidesForm(manager: manager, ride: $ride)
                
                AddButtonView(title: "Add Ride") {
                    //update with validated values from FormValidator
                    ride.distance = manager.formValidator.distance
                    ride.duration = manager.formValidator.duration
                    
                    manager.formValidator.clearRideFormEntries()
                    manager.allRides.append(ride)
                    manager.add(ride: ride, to: ride.bike)
                    
                    self.manager.checkServiceNotifications()
                    
                    dismiss()
                }
                .opacity(manager.formValidator.isRideRegistrationValid ? 1 : 0.6)
                .disabled(manager.formValidator.isRideRegistrationValid == false)
                
                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct AddRideView_Previews: PreviewProvider {
    static var previews: some View {
        AddRideView(manager: BikeManager())
    }
}
