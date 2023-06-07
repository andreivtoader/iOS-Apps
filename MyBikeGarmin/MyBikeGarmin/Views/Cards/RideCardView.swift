//
//  RideCardView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI
import PopupView

struct RideCardView: View {
    @ObservedObject var manager: BikeManager
    var ride: Ride
    
    @State var editRideSheet = false
    @State var deleteRidePopup = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                BikeUIText(text: ride.title, size: 20, weight: .semibold, color: .white)
                RideCardContentText(title: "Bike:", content: ride.bike.name)
                RideCardContentText(title: "Distance:", content: "\(ride.distance)\(manager.settings.unit.description.lowercased())")
                RideCardContentText(title: "Duration:", content: "\(ride.duration.hours)h, \(ride.duration.minutes)min")
                RideCardContentText(title: "Date:", content: ride.date.formatted(.dateTime))
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Menu {
                    Button() {
                        editRideSheet.toggle()
                    } label: {
                        HStack {
                            BikeUIText(text: "Edit Ride", size: 15, weight: .regular, color: .white)
                            Image("icon_edit")
                        }
                    }
                    
                    Button(role: .destructive) {
                        deleteRidePopup.toggle()
                    } label: {
                        HStack {
                            BikeUIText(text: "Delete Ride", size: 15, weight: .regular, color: .white)
                            Image("icon_delete")
                        }
                    }
                } label: {
                    Image("icon_overflow")
                }
                .fullScreenCover(isPresented: $editRideSheet) {
                    EditRideView(manager: manager, ride: ride)
                }
                .popup(isPresented: $deleteRidePopup) {
                    // delete ride popup view
                    DeleteRideView(manager: manager, ride: ride)
                } customize: {
                    $0
                        .isOpaque(true)
                        .closeOnTapOutside(false)
                        .backgroundColor(.black.opacity(0.4))
                }
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cloudBurst)
        .cornerRadius(10)
        .padding(.vertical, 5)
        .onAppear {
            self.manager.checkServiceNotifications()
        }
    }
}

struct RideCardView_Previews: PreviewProvider {
    static var previews: some View {
        RideCardView(manager: BikeManager(), ride: Ride(title: "Faget Road ride", bike: Bike(name: "Roadie", type: .road, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: []), distance: "100", duration: Duration(hours: 3, minutes: 34), date: Date.now))
    }
}
