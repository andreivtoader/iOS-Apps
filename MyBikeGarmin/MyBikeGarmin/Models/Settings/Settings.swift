//
//  Settings.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

struct Settings {
    var unit: DistanceUnit = .km
    var serviceReminder: String = "100"
    var serviceReminderOn: Bool = true
    var defaultBikeName: String = ""
}
