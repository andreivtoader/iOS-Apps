//
//  NewsAPI.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

class NewsManager: ObservableObject {
    
    func getHeadlines(for topic: Topic) async {
        let endpoint = NewsEndpoint(topic: topic)
        print("Now getting the endpoint")
        guard let url = endpoint.url else {
            print("URL cannot be built.")
            return
        }
        print("Url is: \(url)")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(ResponseJSON.self, from: data)
            print(decodedResponse)
        } catch {
            print("Error getting results from URLSession: \(error)")
        }
    }
}
