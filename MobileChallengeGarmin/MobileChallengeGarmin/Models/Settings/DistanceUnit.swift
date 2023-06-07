//
//  DistanceUnit.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

enum DistanceUnit: String, CaseIterable, CustomStringConvertible, DropdownSelectable {
    typealias T = Self
    
    case km = "KM"
    case miles = "MILES"
    
    var description: String {
        switch self {
        case .km:
            return "KM"
        case .miles:
            return "MILES"
        }
    }
}

extension DistanceUnit {
    static func getDistanceUnitTypes() -> [String] {
        return DistanceUnit.allCases.map { $0.rawValue }
    }
}
