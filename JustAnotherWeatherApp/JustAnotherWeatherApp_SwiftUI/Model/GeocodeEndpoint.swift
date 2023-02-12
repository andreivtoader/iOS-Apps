//
//  GeocodeEndpoint.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 12.02.2023.
//

import Foundation

struct GeocodeEndpoint: Endpoint {
    let cityName: String
    let limit: Int = 1
    
    var path: String {
        return "/geo/1.0/direct"
    }
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "limit", value: String(describing: limit)),
            URLQueryItem(name: "appId", value: self.key)
        ]
    }
    
}
