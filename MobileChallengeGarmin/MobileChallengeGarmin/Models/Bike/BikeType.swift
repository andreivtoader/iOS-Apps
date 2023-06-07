//
//  BikeType.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

enum BikeType: String, CaseIterable {
    case mtb = "Mountain Bike"
    case road = "Road Bike"
    case hybrid = "Hybrid Bike"
    case electric = "Electric Bike"
}

enum BikeComponentsUI: String, CaseIterable {
    case smallWheels = "small_wheels"
    case bigWheels = "big_wheels"
    case middle = "middle"
    case over = "over"
}

enum BikeTypeUI: String, CaseIterable {
    case road = "bike_roadbike_"
    case mtb = "bike_mtb_"
    case hybrid = "bike_hybrid_"
    case electric = "bike_electric_"
}

struct BikeUI: Identifiable {
    let id = UUID()
    let bikeType: BikeTypeUI
    let type: BikeType
    
    var bikeIcons: [String] {[
        String(bikeType.rawValue + BikeComponentsUI.smallWheels.rawValue),
        String(bikeType.rawValue + BikeComponentsUI.bigWheels.rawValue),
        String(bikeType.rawValue + BikeComponentsUI.middle.rawValue),
        String(bikeType.rawValue + BikeComponentsUI.over.rawValue)
    ]}
    
    static func fromBikeTypeToBikeTypeUI(type: BikeType) -> BikeTypeUI {
        switch type {
        case .mtb:
            return BikeTypeUI.mtb
        case .road:
            return BikeTypeUI.road
        case .hybrid:
            return BikeTypeUI.hybrid
        case .electric:
            return BikeTypeUI.electric
        }
    }
}
