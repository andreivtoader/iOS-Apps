//
//  BikeManager.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation
import FormValidator

class BikeManager: ObservableObject {
    @Published var settings = Settings()
    @Published var allBikes = [Bike]()
    @Published var allRides = [Ride]()
    
    @Published var formManager = FormManager(validationType: .immediate)
    
    @FormField(validator: NonEmptyValidator(message: "Required field"))
    var firstName: String = ""
    lazy var firstNameValidation = _firstName.validation(manager: formManager)
    
    @FormField(inlineValidator: { value in
        guard value.hours > 0 || value.minutes > 0 else {
                return "Duration needs to be > 0"
            }
            return nil
        })
    var duration: Duration = Duration(hours: 0, minutes: 0)
    lazy var durationValidation = _duration.validation(manager: formManager)
    
    @DateFormField(message: "Date cannot be in the future")
    var date: Date = Date()
    lazy var dateValidation = _date.validation(manager: formManager, before: Date.now)
    
//    var isOn: Bool = true
    
    func getAllBikeNames() -> [String] {
        return allBikes.map { $0.name }
    }
    
    func getBike(by bikeName: String) -> Bike {
        if let bike = allBikes.filter({$0.name == bikeName}).first {
            return bike
        }
        return Bike.defaultBike
    }
    
    func getAllRides(for bikeName: String) -> [Ride] {
        return allRides.filter {$0.bike.name == bikeName}
    }
    
    func getTotalRides(for bikeName: String) -> Int {
        return allRides.filter { $0.bike.name == bikeName}.count
    }
    
    func getTotalDistanceRidden(for bikeName: String) -> Double {
        let rides = allRides.filter { $0.bike.name == bikeName }
        return rides.compactMap { $0.distance }.reduce(0, +)
    }
    
    func addRide(to bikeName: String, ride: Ride) {
        var bike = getBike(by: bikeName)
        bike.rides.append(ride)
    }
    
    func getDistancePercentage(for bikeName: String) -> Double {
        let bike = getBike(by: bikeName)
        let distance = getTotalDistanceRidden(for: bikeName)
        let percentage = (distance * 100.0) / Double(bike.serviceDue)
        
        print("Percentage: \(percentage)")
        print("Percentage as 0...1: \(percentage / 100)")
        
        return percentage / 100
    }
    
    func updateSettingsDefaultBikeName() {
        if let bike = allBikes.filter({ $0.isDefault }).first {
            settings.defaultBikeName = bike.name
        }
    }
    
    func updateDefaultBike(by name: String) {
        if var bike = allBikes.filter({ $0.isDefault }).first {
            bike.isDefault = true
        }
    }
    
    
}
