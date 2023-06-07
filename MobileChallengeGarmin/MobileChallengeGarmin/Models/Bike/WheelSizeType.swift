//
//  WheelSizeType.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

enum WheelSizeType: Double, CaseIterable, CustomStringConvertible, DropdownSelectable {
    typealias T = Self
    
    case twentySixPointFive = 26.5
    case twentySeven = 27
    case twentyEight = 28
    case twentyNine = 29
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .twentySixPointFive: return "26.5\""
        case .twentySeven: return "27\""
        case .twentyEight: return "28\""
        case .twentyNine: return "29\""
        }
      }
}

extension WheelSizeType {
    static func getAllWheelSizes() -> [String] {
        return WheelSizeType.allCases.map { String(describing: $0.rawValue) }
    }
}
