//
//  DeleteRideView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct DeleteRideView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    var ride: Ride
    
    var body: some View {
        VStack(alignment: .center) {
            BikeUIText(text: ride.title, size: 20, weight: .semibold, color: .white)
            BikeUIText(text: "will be deleted.", size: 17, weight: .semibold, color: .white)
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    BikeUIText(text: "Cancel", size: 15, weight: .regular, color: .white)
                        .frame(maxWidth: .infinity)
                }

                
                AddButtonView(title: "Delete") {
                    self.manager.delete(ride: ride)
                    dismiss()
                }
            }
        }
        .background(Color.waikawaGrey)
        .padding()
    }
}

struct DeleteRideView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteRideView(manager: BikeManager(), ride: Ride(title: "Faget MTB ride", bike: Bike(name: "Roadie", type: .road, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: []), distance: "100", duration: Duration(hours: 3, minutes: 34), date: Date.now))
    }
}
