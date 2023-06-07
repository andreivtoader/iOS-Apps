//
//  K.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

struct K {
    // these are the menu title names and icons for active/inactive
    struct Menu {
        static let BIKES_MENU_TITLE = "Bikes"
        static let BIKES_MENU_ICON_ACTIVE = "icon_bikes_active"
        static let BIKES_MENU_ICON_INACTIVE = "icon_bikes_inactive"
        
        static let RIDES_MENU_TITLE = "Rides"
        static let RIDES_MENU_ICON_ACTIVE = "rides_active"
        static let RIDES_MENU_ICON_INACTIVE = "rides_inactive"
        
        static let SETTINGS_MENU_TITLE = "Settings"
        static let SETTINGS_MENU_ICON_ACTIVE = "settings_active"
        static let SETTINGS_MENU_ICON_INACTIVE = "settings_inactive"
        
        static let CANCEL = "Cancel"
    }
    
    // these are the app icon names from Assets
    struct UIIcons {
        static let DROPDOWN = "icon_dropdown"
        static let REQUIRED = "icon_required"
    }
    
    // these are the bike tab view titles/icons/descriptions
    struct Bike {
        static let addBikeTitle = "Add Bike"
        static let missingBikeIcon = "missing_bike_card"
        static let dottedLine = "dotted_line"
        static let missingBikeText = "You don't have any bike added yet. Add your first bike and start registering your rides in order to keep your bike service cycles up to date."
        static let bikeNameTitle = "Bike name"
        static let defaultBikeTitle = "Default Bike"
        static let wheelSizeTitle = "Wheel Size"
        static let serviceTitle = "Service In"
    }
    
    // these are the ride tab view titles/icons/descriptions
    struct Ride {
        static let addRideTitle = "Add Ride"
        static let missingRideIcon = "missing_bike_card"
        static let missingRideText = "You don't have any ride added yet. Add your first ride and keep track of all your activities."
    }
    
    // these are the settings tab view descriptions
    struct Settings {
        static let distanceUnitTitle = "Distance Units"
        static let defaultBikeTitle = "Default Bike"
        static let serviceReminderTitle = "Service Reminder"
    }
}
