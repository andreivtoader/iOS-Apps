//
//  Ride.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

struct Ride : Identifiable, Hashable {
    var id: String {
        title
    }
    
    var title: String
    var bike: Bike
    var distance: String
    var duration: Duration
    var date: Date
    
    init(title: String, bike: Bike, distance: String, duration: Duration, date: Date) {
        self.title = title
        self.bike = bike
        self.distance = distance
        self.duration = duration
        self.date = date
    }
    
    // "Copy constructor"
    init(_ rhs: Ride) {
        self.init(title: rhs.title, bike: rhs.bike, distance: rhs.distance, duration: rhs.duration, date: rhs.date)
    }
    
    static func == (lhs: Ride, rhs: Ride) -> Bool {
        return lhs.title == rhs.title && lhs.bike == rhs.bike && lhs.distance == rhs.distance && lhs.duration == rhs.duration && lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
