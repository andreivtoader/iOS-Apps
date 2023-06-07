//
//  DistanceUnit.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
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
