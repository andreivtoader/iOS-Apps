//
//  BikesListView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct BikesListView: View {
    @ObservedObject var manager: BikeManager
    
    private let titleConfiguration = PageTitleUIConfiguration(title: "Bikes", buttonTitle: "Add Bike", buttonIconTitle: "icon_add", pageType: .bikes)
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack {
                PageTitleView(configuration: titleConfiguration, manager: manager)
                
                Spacer()
                
                List {
                    ForEach($manager.allBikes, id: \.id) { bike in
                        
                        NavigationLink {
                            BikeDetailsView(manager: manager, bike: bike)
                        } label: {
                            BikeCardView(bike: bike, manager: manager)
                                .listRowBackground(Color.tealishBlue)
                                .listRowInsets(EdgeInsets())
                                .padding(.leading)
                        }
                        .buttonStyle(.plain)
                        .listRowBackground(Color.tealishBlue)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(.inset)
                .background(Color.tealishBlue)
                .scrollContentBackground(.hidden)
            }
        }
        .popup(isPresented: $manager.notificationHandler.notification.isActive) {
            NotificationView(bikeName: manager.notificationHandler.notification.bikeName, serviceIn: manager.notificationHandler.notification.distance, units: manager.notificationHandler.notification.unit, isShowing: $manager.notificationHandler.notification.isActive)
        } customize: {
            $0
                .type(.toast)
                .position(.top)
                .animation(.spring())
                .closeOnTap(false)
        }
        
    }
}

struct BikesListView_Previews: PreviewProvider {
    static var previews: some View {
        BikesListView(manager: BikeManager())
    }
}
