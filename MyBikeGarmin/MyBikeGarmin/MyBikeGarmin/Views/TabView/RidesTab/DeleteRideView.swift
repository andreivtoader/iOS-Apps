//
//  DeleteRideView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct DeleteRideView: View {
    @ObservedObject var manager: BikeManager
    @Binding var ride: Ride
    
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            BikeUIText(text: "\(ride.date.formatted(.dateTime.weekday(.wide))) \(ride.date.formatted(.dateTime.day())) Ride", size: 20, weight: .semibold, color: .white)
            BikeUIText(text: "will be deleted.", size: 17, weight: .semibold, color: .white)
            
            HStack {
                Button {
                    isShowing = false
                } label: {
                    BikeUIText(text: "Cancel", size: 15, weight: .regular, color: .white)
                        .frame(maxWidth: .infinity)
                }

                
                AddButtonView(title: "Delete") {
                    self.manager.delete(ride: ride)
                    isShowing = false
                    self.manager.checkServiceNotifications()
                }
            }
        }
        .background(Color.waikawaGrey)
        .padding()
    }
}

struct DeleteRideView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteRideView(manager: BikeManager(), ride: .constant(Ride(title: "Faget MTB ride", bike: Bike(name: "Roadie", type: .road, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: []), distance: "100", duration: Duration(hours: 3, minutes: 34), date: Date.now)), isShowing: .constant(false))
    }
}
