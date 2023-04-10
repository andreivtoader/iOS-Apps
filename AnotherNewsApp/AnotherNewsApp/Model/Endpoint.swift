//
//  Endpoint.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var key: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var url: URL? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
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
