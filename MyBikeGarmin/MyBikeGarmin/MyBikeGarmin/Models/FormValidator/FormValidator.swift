//
//  FormValidator.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 08.06.2023.
//

import Foundation

class FormValidator {
    var bikeName = ""
    var wheelSize = ""
    var serviceIn = ""
    
    var rideBike = ""
    var distance = ""
    var duration = Duration(hours: 0, minutes: 0)
    
    var bikeNamePrompt: String {
        return isBikeNameValid() ? "" : "Required field. Only alphanumeric values allowed."
    }
    
    var wheelSizePrompt: String {
        return isWheelSizeValid() ? "" : "Required field. Please select a wheel size."
    }
    
    var serviceInPrompt: String {
        return isServiceInValid() ? "" : "Required field. Please enter a valid positive number."
    }
    
    var rideBikePrompt: String {
        return isRideBikeValid() ? "" : "Required field. Please select a bike."
    }
    
    var distancePrompt: String {
        return isDistanceValid() ? "" : "Required field. Please enter a valid positive number."
    }
    
    var durationPrompt: String {
        return isDurationValid() ? "" : "Required field. Duration cannot be 0h, 0m."
    }
    
    var isBikeRegistrationValid: Bool {
        return isBikeNameValid() && isServiceInValid() && isWheelSizeValid()
    }
    
    var isRideRegistrationValid: Bool {
        return isRideBikeValid() && isDistanceValid() && isDurationValid()
    }
    
    func clearBikeFormEntries() {
        bikeName = ""
        wheelSize = ""
        serviceIn = ""
    }
    
    func clearRideFormEntries() {
        rideBike = ""
        distance = ""
        duration = Duration(hours: 0, minutes: 0)
    }
    
    func updateBikeFormEntriesForEditing(bike: Bike) {
        bikeName = bike.name
        wheelSize = bike.wheelSize.description
        serviceIn = bike.serviceDue
    }
    
    func updateRideFormEntriesForEditing(ride: Ride) {
        rideBike = ride.bike.name
        distance = ride.distance
        duration = ride.duration
    }
    
    
    // MARK: - internal validation
    
    private let alphaNumericPredicate = NSPredicate(format: "SELF MATCHES %@",
                                                    "^[a-zA-Z0-9 ]+$")
    
    private let positiveIntegerPredicate = NSPredicate(format: "SELF MATCHES %@",
                                                       "^[1-9]+[0-9]*$")
    
    // it contains the extra \" for inches
    private let wheelSizePredicate = NSPredicate(format: "SELF MATCHES %@",
                                                "^[a-zA-Z0-9 \"]+$")
    
    // match any alpha numeric values
    private func isBikeNameValid() -> Bool {
        return alphaNumericPredicate.evaluate(with: bikeName)
    }
    
    // match any alpha numeric values
    private func isWheelSizeValid() -> Bool {
        wheelSizePredicate.evaluate(with: wheelSize)
    }
    
    // match any positive integer numbers
    private func isServiceInValid() -> Bool {
        return positiveIntegerPredicate.evaluate(with: serviceIn)
    }
    
    // match any alpha numeric values
    private func isRideBikeValid() -> Bool {
        return alphaNumericPredicate.evaluate(with: rideBike)
    }
    
    // match any positive integer numbers
    private func isDistanceValid() -> Bool {
        return positiveIntegerPredicate.evaluate(with: distance)
    }
    
    // duration cannot be 0 hours and 0 minutes
    private func isDurationValid() -> Bool {
        return (duration.hours > 0 || duration.minutes > 0) ? true : false
    }
}
