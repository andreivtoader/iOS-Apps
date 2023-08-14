//
//  DailyGratitude.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import SwiftUI

struct DailyGratitude: Identifiable, Equatable {
    var id = UUID()
    
    var summary: String
    var date: Date
    var imageURL: URL?
    var image: Image?
    var tags: [String]?
    
    var dateDescription: String {
        dateFormatter.string(from: date)
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}
