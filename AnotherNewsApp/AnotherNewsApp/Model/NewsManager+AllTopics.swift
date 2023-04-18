//
//  NewsManager+AllTopics.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 18.04.2023.
//

import Foundation

extension NewsManager {
    static let allTopics: [SelectableTopic] = [
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
