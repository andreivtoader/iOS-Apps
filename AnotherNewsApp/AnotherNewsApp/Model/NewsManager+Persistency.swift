//
//  NewsManager+Persistency.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 18.04.2023.
//

import Foundation

extension NewsManager {
    
    func load() async throws {
        let task = Task<[SelectableTopic], Error> {
            let url = try Self.fileURL()
            guard let data = try? Data(contentsOf: url) else {
                return []
            }
            print("URL: \(url)")
            let topics = try JSONDecoder().decode([SelectableTopic].self, from: data)
            return topics
        }
        
        let topics = try await task.value
        publishSelectedTopics(topics: topics)
    }
    
    func save(topics: [SelectableTopic]) async throws {
        let task = Task {
            let url = try Self.fileURL()
            let data = try JSONEncoder().encode(topics)
            
            try data.write(to: url, options: .atomic)
        }
        
        try await task.value
    }
    
    func publishSelectedTopics (topics: [SelectableTopic]) {
        DispatchQueue.main.async {
            self.selectedTopics = topics
        }
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: K.selectedTopicsStorageFile)
    }
    
}
