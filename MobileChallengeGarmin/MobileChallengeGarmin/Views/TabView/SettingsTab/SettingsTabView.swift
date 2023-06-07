//
//  SettingsTabView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject var manager: BikeManager
    @Binding var activeTab: Int
    
    @State private var distanceUnitStr = ""
    @State private var defaultBikeStr = ""
    @State private var serviceReminderStr = ""
    
    var body: some View {
//        NavigationStack {
            ZStack {
                Color(UIColor.tealishBlue).ignoresSafeArea()
                
                SettingsFormView(manager: manager)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    SettingsPageTitleText(title: K.Menu.SETTINGS_MENU_TITLE)
                })
            }
//        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(manager: BikeManager(), activeTab: .constant(1))
    }
}
