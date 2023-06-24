//
//  AppTabView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject var manager: BikeManager
    @State private var selectedTab = 0
    
    init(manager: BikeManager) {
        self.manager = manager
        
        // setting the TabView tab bar background color
        UITabBar.appearance().backgroundColor = UIColor(Color.cloudBurst)
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                BikesTabView(manager: manager)
                    .tabItem {
                        TabMenuItemView(itemType: .bikes, isSelected: (selectedTab == 0))
                    }
                    .tag(0)
                    
                RidesTabView(manager: manager)
                    .tabItem {
                        TabMenuItemView(itemType: .rides, isSelected: (selectedTab == 1))
                    }
                    .tag(1)
                
                SettingsTabView(manager: manager)
                    .tabItem {
                        TabMenuItemView(itemType: .settings, isSelected: (selectedTab == 2))
                    }
                    .tag(2)
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(manager: BikeManager())
    }
}
