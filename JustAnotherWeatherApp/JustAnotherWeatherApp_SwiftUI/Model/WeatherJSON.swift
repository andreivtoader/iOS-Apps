//
//  Weather.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import Foundation

struct WeatherJSON: Codable {
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
}

struct Main: Codable {
    var temp: Double
    var humidity: Int
}

struct Wind: Codable {
    var speed: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
