//
//  Duration.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

struct Duration: Identifiable, Hashable, Codable {
    var id = UUID()
    var hours: Int
    var minutes: Int
    
    static func == (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.hours == rhs.hours && lhs.minutes == rhs.minutes
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
