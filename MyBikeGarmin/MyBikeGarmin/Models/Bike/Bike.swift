//
//  Bike.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct Bike: Identifiable, Hashable, DropdownSelectable {
    typealias T = Self
    
    var id: String {
        name
    }
    var name: String
    var type: BikeType
    var wheelSize: WheelSize
    var color: Color
    var serviceDue: String
    var isDefault: Bool
    var rides: [Ride]
    
    init(name: String, type: BikeType, wheelSize: WheelSize, color: Color, serviceDue: String, isDefault: Bool, rides: [Ride]) {
        self.name = name
        self.type = type
        self.wheelSize = wheelSize
        self.color = color
        self.serviceDue = serviceDue
        self.isDefault = isDefault
        self.rides = rides
    }
    
    // "Copy constructor"
    init(_ rhs: Bike) {
        self.init(name: rhs.name, type: rhs.type, wheelSize: rhs.wheelSize, color: rhs.color, serviceDue: rhs.serviceDue, isDefault: rhs.isDefault, rides: rhs.rides)
    }
    
    static func == (lhs: Bike, rhs: Bike) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.wheelSize == rhs.wheelSize && lhs.color == rhs.color && lhs.serviceDue == rhs.serviceDue && lhs.isDefault == rhs.isDefault
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
