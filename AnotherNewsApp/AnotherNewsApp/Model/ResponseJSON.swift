//
//  ResponseJSON.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

struct ResponseJSON: Codable {
    var articles: [Article] = []
}

struct Article: Codable, Identifiable {
    var id: String {
        if let title = title {
            return title
        }
        else {
            return ""
        }
    }
    var source: Source
    var author: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var description: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}
