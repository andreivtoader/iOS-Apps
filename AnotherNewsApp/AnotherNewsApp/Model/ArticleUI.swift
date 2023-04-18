//
//  ArticleUI.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 14.04.2023.
//

import Foundation

struct ArticleUI: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let date: String
    let description: String
    let url: String
    let urlToImage: String
}
