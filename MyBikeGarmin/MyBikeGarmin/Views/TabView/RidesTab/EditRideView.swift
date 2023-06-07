//
//  EditRideView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct EditRideView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    var ride: Ride
    
    @State var currentRide = Ride(title: "", bike: Bike(name: "", type: .electric, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "", isDefault: false, rides: []), distance: "", duration: Duration(hours: 0, minutes: 0), date: Date.now)
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack {
                ModalTitleView(title: "Edit Ride")
                
                RidesForm(manager: manager, ride: $currentRide)
                
                AddButtonView(title: "Save") {
                    self.manager.update(rideName: ride.title, withValues: currentRide)
                    dismiss()
                }
                Spacer()
            }
        }
        .onAppear {
            currentRide = ride
            print("Current ride: \(currentRide)")
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct EditRideView_Previews: PreviewProvider {
    static var previews: some View {
        EditRideView(manager: BikeManager(), ride: Ride(title: "Faget Road ride", bike: Bike(name: "Roadie", type: .road, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: []), distance: "100", duration: Duration(hours: 3, minutes: 34), date: Date.now))
    }
}
