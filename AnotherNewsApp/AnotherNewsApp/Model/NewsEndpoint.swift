//
//  NewsEndpoint.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

struct NewsEndpoint: Endpoint {
    let selectableTopic: SelectableTopic
    
    var host: String {
        return "newsapi.org"
    }
    
    var key: String {
        return "be327ab440234619acfe46dab6c30400"
    }
    
    var path: String {
        return "/v2/everything"
    }
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "q", value: self.selectableTopic.topic.rawValue),
            URLQueryItem(name: "apiKey", value: self.key)
        ]
    }
    
    
}
