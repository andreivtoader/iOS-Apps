//
//  Endpoint.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 12.02.2023.
//

import Foundation


protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var key: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.openweathermap.org"
    }

    var key: String {
        return "65d1a094019093a87b527872f7725aa7"
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        components.queryItems = self.queryItems
        
        return components.url
    }
}
