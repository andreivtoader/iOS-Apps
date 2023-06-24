//
//  Settings.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

struct Settings: Identifiable, Codable {
    typealias T = Self
    
    var id = UUID()
    
    var unit: DistanceUnit {
        didSet {
            serviceReminder = convertUnits(selectedUnit: unit, fromValue: serviceReminder)
        }
    }
    
    var serviceReminder: String
    var serviceReminderOn: Bool
    var defaultBikeName: String
    
    init(unit: DistanceUnit, serviceReminder: String, serviceReminderOn: Bool, defaultBikeName: String) {
        self.unit = unit
        self.serviceReminder = serviceReminder
        self.serviceReminderOn = serviceReminderOn
        self.defaultBikeName = defaultBikeName
    }
    
    // "Copy constructor"
    init(_ rhs: Settings) {
        self.init(unit: rhs.unit, serviceReminder: rhs.serviceReminder, serviceReminderOn: rhs.serviceReminderOn, defaultBikeName: rhs.defaultBikeName)
    }
    
    /*
     This will most likely need to be refactored into using Measurements in order to make use of the specific locale.
     I realized this a bit too late, sorry!
     */
    
    func convertUnits(selectedUnit: DistanceUnit, fromValue: String) -> String {
        switch selectedUnit {
        case .km:
            let milesMeasurement = Measurement(value: Double(fromValue) ?? 0.0, unit: UnitLength.miles)
            let converted = milesMeasurement.converted(to: .kilometers)
            return String(format: "%.0f", converted.value)
        case .miles:
            let kmMeasurement = Measurement(value: Double(fromValue) ?? 0.0, unit: UnitLength.kilometers)
            let converted = kmMeasurement.converted(to: .miles)
            return String(format: "%.0f", converted.value)
        }
    }
}
