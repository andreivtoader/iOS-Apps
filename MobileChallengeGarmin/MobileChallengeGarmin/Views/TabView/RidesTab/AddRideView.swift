//
//  AddRideView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI
import UserNotifications

struct AddRideView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    @State private var rideTitleStr = ""
    @State private var bikeNameStr = ""
    @State private var distanceCoveredStr = ""
    @State private var hours = 0
    @State private var minutes = 0
    @State private var date = Date.now
    
    init(_ manager: BikeManager) {
        self.manager = manager
    }
    
    var body: some View {
        ZStack {
            Color(.tealishBlue).ignoresSafeArea()
            
            VStack {
                HStack(spacing: 0) {
                    Spacer()
                    Text(K.Ride.addRideTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading)
                    Spacer()
                    Button(K.Menu.CANCEL) {
                        dismiss()
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 0) {
                    TextfieldWithSuffix(title: "Ride Title", requiredIcon: false, suffix: false, suffixText: "", currentText: $rideTitleStr)

                    DropdownMenu(title: "Bike", options: self.manager.getAllBikeNames(), selection: $bikeNameStr)

                    TextfieldWithSuffix(title: "Distance", requiredIcon: true, suffix: true, suffixText: "KM", currentText: $distanceCoveredStr)
                    
                    DateDurationPicker(type: .duration, hours: $hours, minutes: $minutes, date: $date)
                    
                    DateDurationPicker(type: .date, hours: $hours, minutes: $minutes, date: $date)
                    
                    // pop to rides list view when ride is added
                    AddButtonView(title: K.Ride.addRideTitle) {
                        print("Ride title: \(rideTitleStr)")
                        print("Bike type: \(bikeNameStr)")
                        print("Distance: \(distanceCoveredStr)")
                        print("Duration: \(hours) and \(minutes)")
                        print("Date: \(date.description)")
                        
                        if rideTitleStr.isEmpty || bikeNameStr.isEmpty || distanceCoveredStr.isEmpty {
                            
                        } else {
                            // make a new ride
                            let bike = self.manager.getBike(by: bikeNameStr)
                            // append it to all bikes
                            
                            let ride = Ride(title: rideTitleStr, bike: bike, distance: Double(distanceCoveredStr) ?? 0, duration: Duration(hours: hours, minutes: minutes), date: date)
                            
                            self.manager.allRides.append(ride)
                            print("All rides size: \(self.manager.allRides.count)")
                            self.manager.addRide(to: bike.name, ride: ride)
                            
                            let content = UNMutableNotificationContent()
                            content.title = bikeNameStr
                            content.subtitle = "Service in: \(self.manager.settings.serviceReminder ?? 0)"
                            content.sound = UNNotificationSound.default

                            // show this notification five seconds from now
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

                            // choose a random identifier
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                            // add our notification request
                            UNUserNotificationCenter.current().add(request)
                            
                            
                            
                            dismiss()
                        }
                    }

                    Spacer()
                }
            }
        }
    }
}

struct AddRideView_Previews: PreviewProvider {
    static var previews: some View {
        AddRideView(BikeManager())
    }
}
