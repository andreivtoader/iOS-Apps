//
//  BikeManager+Persistency.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 08.06.2023.
//

import Foundation

// MARK: - BikeManager persistency methods
extension BikeManager {
    
    static func bikesFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "bikes.data")
    }
    
    static func ridesFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "rides.data")
    }
    
    static func settingsFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "settings.data")
    }
    
    func save<T: Codable>(resource: T, url: URL) async throws where T: Codable {
        let task = Task {
            let data = try JSONEncoder().encode(resource)
            try data.write(to: url, options: .atomic)
        }
        
        try await task.value
    }
    
    func load() async throws {
        let rides = try await fetchResources(url: Self.ridesFileURL()) as [Ride]
        let bikes = try await fetchResources(url: Self.bikesFileURL()) as [Bike]
        let settings = try await fetchResources(url: Self.settingsFileURL()) as [Settings]
        
        DispatchQueue.main.async {
            self.allBikes = bikes
            self.allRides = rides
            
            if let settings = settings.first {
                self.settings = settings
            }
        }
    }
    
    private func fetchResources<T: Codable>(url: URL) async throws -> [T] where T : Codable {
        let task = Task<[T], Error> {
            guard let data = try? Data(contentsOf: url) else {
                return [T]()
            }
            
            return try JSONDecoder().decode([T].self, from: data)
        }
        
        return try await task.value
    }
}
