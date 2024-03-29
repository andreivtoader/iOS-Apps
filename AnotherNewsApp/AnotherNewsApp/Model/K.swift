//
//  K.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

struct K {
    static let newsPulseWelcomeImage = "Welcome_NewsPulse"
    static let appTitle = "NewsPulse"
    static let appDescription = "Welcome to NewsPulse. Select your interests and stay informed wherever you are."
    static let continueButton = "Continue"
    static let interestsDescription = "Select your interests:"
    static let noItemsSelectedText = "Please select at least four topics..."
    static let minimumTopicsSelected = 4
    static let selectedTopicsStorageFile = "selectedTopics.data"
    static let EMPTY_STRING = ""
    
    static let initialData = [
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
