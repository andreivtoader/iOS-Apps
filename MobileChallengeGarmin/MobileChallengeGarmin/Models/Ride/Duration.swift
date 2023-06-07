//
//  Duration.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import Foundation

struct Duration: Identifiable, Hashable {
    let id = UUID()
    var hours: Int
    var minutes: Int
    
    static func == (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.hours == rhs.hours && lhs.minutes == rhs.minutes
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
