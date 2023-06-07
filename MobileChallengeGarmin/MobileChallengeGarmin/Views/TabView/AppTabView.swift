//
//  AppTabView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct AppTabView: View {
    @ObservedObject var manager: BikeManager
    @State private var selection = 0
    @State private var exSelection = 0
    
    init(_ manager: BikeManager) {
        self.manager = manager
        
//        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        
        // setting the tab menu background color
        UITabBar.appearance().backgroundColor = UIColor( Color(UIColor.waikawaGrey))
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
        
    }
    
    var body: some View {
        NavigationStack {
            TabView (selection: $selection) {
                BikesTabView(manager)
                    .tabItem {
                        TabMenuItemView(itemType: .bikes, isSelected: (selection == 0))
                    }
                    .tag(0)
                    .onTapGesture {
                        hideKeyboard()
                    }
                
                RidesTabView(manager)
                    .tabItem {
                        TabMenuItemView(itemType: .rides, isSelected: (selection == 1))
                    }
                    .tag(1)
                    .onTapGesture {
                        hideKeyboard()
                    }
                
                SettingsTabView(manager: manager, activeTab: $selection)
                    .tabItem {
                        TabMenuItemView(itemType: .settings, isSelected: (selection == 2))
                    }
                    .tag(2)
                    .onTapGesture {
                        hideKeyboard()
                        
                    }
            }
            .tint(Color(UIColor.brightBlue))
//            .onChange(of: selection) { newValue in
//                if manager.allBikes.isEmpty {
//                    selection = 0
//                } else {
//                    selection = newValue
//                }
//            }
        }
        
    }
    
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(BikeManager())
    }
}
