//
//  EmptyRidesView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI
import UserNotifications

struct EmptyRidesView: View {
    @ObservedObject var manager: BikeManager
    @State private var isPresented = false
    
    init(_ manager: BikeManager) {
        self.manager = manager
    }
    
    var body: some View {
        VStack {
            Image(K.Ride.missingRideIcon)
                .resizable()
                .scaledToFit()
            
            ZStack {
                HStack {
                    Image(K.Bike.dottedLine)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 15)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    MissingBikeTextDescription(text: K.Ride.missingRideText)
                        .background(Color(UIColor.tealishBlue))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    AddButtonView(title: K.Ride.addRideTitle) {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                        
                        isPresented.toggle()
                        
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        AddRideView(manager)
                    }

                    
                }
            }
        }
    }
}

struct EmptyRidesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRidesView(BikeManager())
    }
}
