//
//  WheelSize.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

enum WheelSize: String, CaseIterable, CustomStringConvertible, Codable, DropdownSelectable {
    typealias T = Self
    
    case twentySix = "26"
    case twentySeven = "27"
    case twentyEight = "28"
    case twentyNine = "29"
    
    var description : String {
        switch self {
        case .twentySix: return "26\""
        case .twentySeven: return "27\""
        case .twentyEight: return "28\""
        case .twentyNine: return "29\""
        }
      }
}
