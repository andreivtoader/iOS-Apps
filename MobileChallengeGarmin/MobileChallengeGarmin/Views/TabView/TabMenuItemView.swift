//
//  TabMenuItemView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
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
                    Image(K.Menu.BIKES_MENU_ICON_ACTIVE)
                    TabMenuItemText(text: K.Menu.BIKES_MENU_TITLE)
                }
            } else {
                VStack {
                    Image(K.Menu.BIKES_MENU_ICON_INACTIVE)
                    TabMenuItemText(text: K.Menu.BIKES_MENU_TITLE)
                }
            }
            
        case .rides:
            if isSelected {
                VStack {
                    Image(K.Menu.RIDES_MENU_ICON_ACTIVE)
                    TabMenuItemText(text: K.Menu.RIDES_MENU_TITLE)
                }
            } else {
                VStack {
                    Image(K.Menu.RIDES_MENU_ICON_INACTIVE)
                    TabMenuItemText(text: K.Menu.RIDES_MENU_TITLE)
                }
            }
            
        case .settings:
            if isSelected {
                VStack {
                    Image(K.Menu.SETTINGS_MENU_ICON_ACTIVE)
                    TabMenuItemText(text: K.Menu.SETTINGS_MENU_TITLE)
                }
            } else {
                VStack {
                    Image(K.Menu.SETTINGS_MENU_ICON_INACTIVE)
                    TabMenuItemText(text: K.Menu.SETTINGS_MENU_TITLE)
                }
            }
        }
    }
}

struct TabMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuItemView(itemType: .bikes, isSelected: true)
    }
}
