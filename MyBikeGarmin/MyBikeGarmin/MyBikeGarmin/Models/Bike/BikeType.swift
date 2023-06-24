//
//  BikeType.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

enum BikeComponents: String {
    case mtbBike = "bike_mtb_"
    case roadBike = "bike_roadbike_"
    case hybridBike = "bike_hybrid_"
    case electricBike = "bike_electric_"
    case smallWheels = "small_wheels"
    case bigWheels = "big_wheels"
    case middle = "middle"
    case over = "over"
}

enum BikeType: String, CaseIterable, CustomStringConvertible, Identifiable, Codable {
    var id: String {
        description
    }
    
    case mtb = "Mountain Bike"
    case road = "Road Bike"
    case hybrid = "Hybrid Bike"
    case electric = "Electric Bike"
    
    var description: String {
        switch self {
        case .mtb:
            return "Mountain Bike"
        case .road:
            return "Road Bike"
        case .hybrid:
            return "Hybrid Bike"
        case .electric:
            return "Electric Bike"
        }
    }
    
    var mtbBikeCarouselComponents: [String] {
        return [
            BikeComponents.mtbBike.rawValue + BikeComponents.smallWheels.rawValue,
            BikeComponents.mtbBike.rawValue + BikeComponents.bigWheels.rawValue,
            BikeComponents.mtbBike.rawValue + BikeComponents.middle.rawValue,
            BikeComponents.mtbBike.rawValue + BikeComponents.over.rawValue
        ]
    }
    
    var roadBikeCarouselComponents: [String] {
        return [
            BikeComponents.roadBike.rawValue + BikeComponents.smallWheels.rawValue,
            BikeComponents.roadBike.rawValue + BikeComponents.bigWheels.rawValue,
            BikeComponents.roadBike.rawValue + BikeComponents.middle.rawValue,
            BikeComponents.roadBike.rawValue + BikeComponents.over.rawValue
        ]
    }
    
    var hybridBikeCarouselComponents: [String] {
        return [
            BikeComponents.hybridBike.rawValue + BikeComponents.smallWheels.rawValue,
            BikeComponents.hybridBike.rawValue + BikeComponents.bigWheels.rawValue,
            BikeComponents.hybridBike.rawValue + BikeComponents.middle.rawValue,
            BikeComponents.hybridBike.rawValue + BikeComponents.over.rawValue
        ]
    }
    
    var electricBikeCarouselComponents: [String] {
        return [
            BikeComponents.electricBike.rawValue + BikeComponents.smallWheels.rawValue,
            BikeComponents.electricBike.rawValue + BikeComponents.bigWheels.rawValue,
            BikeComponents.electricBike.rawValue + BikeComponents.middle.rawValue,
            BikeComponents.electricBike.rawValue + BikeComponents.over.rawValue
        ]
    }
    
    var chartColor: String {
        switch self {
        case .mtb:
            return "Watermelon"
        case .road:
            return "BurntYellow"
        case .hybrid:
            return "Pear"
        case .electric:
            return "White"
        }
    }
    
    static func getType(from index: Int) -> BikeType {
        switch index {
        case 0:
            return .mtb
        case 1:
            return .road
        case 2:
            return .hybrid
        case 3:
            return .electric
        default:
            return .mtb
        }
    }
}
