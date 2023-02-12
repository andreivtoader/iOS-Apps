//
//  WeatherEndpoint.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 12.02.2023.
//

import Foundation

struct WeatherEndpoint : Endpoint {
    let latitude: Double
    let longitude: Double
    let units: Units = .metric
    
    var path: String {
        return "/data/2.5/weather"
    }
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "lat", value: String(describing: self.latitude)),
            URLQueryItem(name: "lon", value: String(describing: self.longitude)),
            URLQueryItem(name: "units", value: String(describing: self.units)),
            URLQueryItem(name: "appId", value: String(describing: self.key))
        ]
    }
}
