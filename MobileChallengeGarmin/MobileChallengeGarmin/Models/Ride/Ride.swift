//
//  Ride.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import Foundation

struct Ride : Identifiable, Hashable {
    var id: String {
        title
    }
    var title: String
    var bike: Bike
    var distance: Double
    var duration: Duration
    var date: Date
    
    static func == (lhs: Ride, rhs: Ride) -> Bool {
        return lhs.title == rhs.title && lhs.bike == rhs.bike && lhs.distance == rhs.distance && lhs.duration == rhs.duration && lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//extension Ride {
//    static var defaultRide = Ride(title: "First Ride!", bike: Bike.defaultBike, distance: 112.5, duration: Duration(hours: 3, minutes: 12), date: Date())
//}
