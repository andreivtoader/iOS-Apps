//
//  Geocode.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import Foundation

struct CityJSON: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}
