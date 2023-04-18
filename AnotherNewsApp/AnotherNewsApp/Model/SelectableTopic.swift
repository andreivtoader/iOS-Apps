//
//  SelectableTopic.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 18.04.2023.
//

import Foundation

struct SelectableTopic: Codable, Equatable, Identifiable {
    var id = UUID()
    var topic: Topic
    var isSelected: Bool
}
