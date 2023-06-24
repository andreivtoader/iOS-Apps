//
//  TabMenuItemView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct TabMenuItemView: View {
    let itemType: TabMenuItem
    let isSelected: Bool
    
    var body: some View {
        switch itemType {
        case .bikes:
            if isSelected {
                VStack {
                    Image("icon_bikes_active")
                    BikeUIText(text: "Bikes", size: 11, weight: .semibold, color: .brightBlue)
                }
            } else {
                VStack {
                    Image("icon_bikes_inactive")
                    BikeUIText(text: "Bikes", size: 11, weight: .semibold, color: .white)
                }
            }
            
        case .rides:
            if isSelected {
                VStack {
                    Image("rides_active")
                    BikeUIText(text: "Rides", size: 11, weight: .semibold, color: .brightBlue)
                }
            } else {
                VStack {
                    Image("rides_inactive")
                    BikeUIText(text: "Rides", size: 11, weight: .semibold, color: .white)
                }
            }
            
        case .settings:
            if isSelected {
                VStack {
                    Image("settings_active")
                    BikeUIText(text: "Settings", size: 11, weight: .semibold, color: .brightBlue)
                }
            } else {
                VStack {
                    Image("settings_inactive")
                    BikeUIText(text: "Settings", size: 11, weight: .semibold, color: .white)
                }
            }
        }
    }
}

struct TabMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuItemView(itemType: .bikes, isSelected: true)
            .background(.teal)
    }
}
