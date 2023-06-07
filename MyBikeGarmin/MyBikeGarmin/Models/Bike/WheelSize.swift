//
//  WheelSize.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

enum WheelSize: Double, CaseIterable, CustomStringConvertible, DropdownSelectable {
    typealias T = Self
    
    case twentySixPointFive = 26.5
    case twentySeven = 27
    case twentyEight = 28
    case twentyNine = 29
    
    var description : String {
        switch self {
        case .twentySixPointFive: return "26.5\""
        case .twentySeven: return "27\""
        case .twentyEight: return "28\""
        case .twentyNine: return "29\""
        }
      }
}
