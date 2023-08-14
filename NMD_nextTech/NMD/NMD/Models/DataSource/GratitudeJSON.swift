//
//  GratitudeJSON.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import Foundation

struct GratitudeJSON : Codable {
    let summary: String
    let date: Date
    let images: [String]?
    let tags: [String]?
}
