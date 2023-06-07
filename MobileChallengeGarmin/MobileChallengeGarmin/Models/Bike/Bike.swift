//
//  Bike.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct Bike: Identifiable, Hashable, DropdownSelectable {
    typealias T = Self
    
    var id: String {
        name
    }
    var name: String
    var type: BikeType
    var wheelSize: WheelSizeType
    var color: Color
    var serviceDue: Int
    var isDefault: Bool
    var rides: [Ride]
    
    var currentTotalDistanceRidden: Double {
        rides.map { $0.distance }.reduce(0, +)
    }
    
    static func == (lhs: Bike, rhs: Bike) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.wheelSize == rhs.wheelSize && lhs.color == rhs.color && lhs.serviceDue == rhs.serviceDue && lhs.isDefault == rhs.isDefault
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Bike {
    static var defaultBike = Bike(name: "Cannondale EvoSix", type: .road, wheelSize: .twentyNine, color: .red, serviceDue: 900, isDefault: true, rides: [Ride]())
}
