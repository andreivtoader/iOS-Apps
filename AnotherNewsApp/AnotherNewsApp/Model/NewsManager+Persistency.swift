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
                return [
                    SelectableTopic(topic: Topic.news, isSelected: false),
                    SelectableTopic(topic: Topic.sport, isSelected: false),
                    SelectableTopic(topic: Topic.tech, isSelected: false),
                    SelectableTopic(topic: Topic.finance, isSelected: false),
                    SelectableTopic(topic: Topic.entertainment, isSelected: false),
                    SelectableTopic(topic: Topic.politics, isSelected: false),
                    SelectableTopic(topic: Topic.business, isSelected: false),
                    SelectableTopic(topic: Topic.economics, isSelected: false),
                    SelectableTopic(topic: Topic.world, isSelected: false),
                    SelectableTopic(topic: Topic.beauty, isSelected: false),
                    SelectableTopic(topic: Topic.travel, isSelected: false),
                    SelectableTopic(topic: Topic.music, isSelected: false),
                    SelectableTopic(topic: Topic.food, isSelected: false),
                    SelectableTopic(topic: Topic.science, isSelected: false),
                    SelectableTopic(topic: Topic.gaming, isSelected: false),
                    SelectableTopic(topic: Topic.energy, isSelected: false)
                ]
            }
            print("URL: \(url)")
            let topics = try JSONDecoder().decode([SelectableTopic].self, from: data)
            return topics
        }
        
        let topics = try await task.value
        publishAllTopics(topics: topics)
    }
    
    func save(topics: [SelectableTopic]) async throws {
        let task = Task {
            let url = try Self.fileURL()
            let data = try JSONEncoder().encode(topics)
            
            try data.write(to: url, options: .atomic)
        }
        
        try await task.value
    }
    
    func publishAllTopics (topics: [SelectableTopic]) {
        DispatchQueue.main.async {
            self.allTopics = topics
        }
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: K.selectedTopicsStorageFile)
    }
    
}
