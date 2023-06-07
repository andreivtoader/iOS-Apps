//
//  Settings.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

struct Settings {
    var unit: DistanceUnit = .km {
        didSet {
            print("Unit set: \(unit.rawValue)")
        }
    }
    var serviceReminder: Int = 100 {
        didSet {
            print("Service reminder set: \(serviceReminder)")
        }
    }
    var serviceReminderOn: Bool = true  {
        didSet {
            print("Service reminder toggled: \(serviceReminderOn)")
        }
    }
    
    // TODO check bug in settings tab where you need to first add a bike in order to have everything published
    var defaultBikeName: String = "" {
        didSet {
            print("Default bike name set: \(defaultBikeName)")
        }
    }
    
    // TODO check bug in settings tab where you need to first add a bike in order to have everything published
//    var defaultBike: Bike? {
//        didSet {
//            print("Default  object bike set: \(defaultBike?.name ?? "")")
//        }
//    }
}
