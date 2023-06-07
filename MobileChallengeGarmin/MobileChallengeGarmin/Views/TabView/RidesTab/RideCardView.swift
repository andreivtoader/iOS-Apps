//
//  RideCardView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI

struct RideCardView: View {
    let ride: Ride
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Friday 29 Ride")
                    .foregroundColor(.white)
                Text("Bike: \(ride.bike.name)")
                    .foregroundColor(.white)
                Text("Distance: \(ride.distance)")
                    .foregroundColor(.white)
                Text("Duration: \(ride.duration.hours) and \(ride.duration.minutes)")
                    .foregroundColor(.white)
                Text("Date: \(ride.date)")
                    .foregroundColor(.white)
            }
            .padding()
            
            Spacer()
            
            VStack {
                Menu {
                    Button(role: .none) {
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
            .padding()
        }
        .background(Color(UIColor.waikawaGrey))
    }
}

//struct RideCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RideCardView()
//            .background(Color(UIColor.waikawaGrey))
//    }
//}
