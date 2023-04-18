//
//  NewsAPI.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

class NewsManager: ObservableObject {
    
    private var newsResponse = ResponseJSON()
    
    @Published var filteredArticles = [ArticleUI]()
    @Published var selectedTopics = [SelectableTopic]()
    @Published var selectedTopicIndex = 0
    
    func getHeadlines(for topic: SelectableTopic) async {
        let endpoint = NewsEndpoint(selectableTopic: topic)
        
        guard let url = endpoint.url else {
            print("URL cannot be built.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newsJSON = try JSONDecoder().decode(ResponseJSON.self, from: data)
            
            publishNews(json: newsJSON)
        } catch {
            print("Error getting results from URLSession: \(error)")
        }
    }
    
    func isTopicSelected(_ selectedTopic: SelectableTopic) -> Bool {
        return (selectedTopics.first { ($0.topic.rawValue == selectedTopic.topic.rawValue) && $0.isSelected } != nil)
    }
    
    func publishNews(json: ResponseJSON) {
        DispatchQueue.main.async {
            self.filteredArticles = json.articles.filter { $0.title != nil && $0.author != nil && $0.publishedAt != nil && $0.description != nil && $0.url != nil && $0.urlToImage != nil}.map { (article) -> ArticleUI in
                
                let date = self.getDate(from: article.publishedAt!)
                return ArticleUI(title: article.title!, author: article.author!, date: date, description: article.description!, url: article.url!, urlToImage: article.urlToImage!)
            }
        }
    }
    
    private func getDate(from str: String) -> String {
        if let index = str.firstIndex(of: "T") {
            let substring = str[..<index]
            let dateStr = String(substring)
            
            return dateStr
        }
        else {
            return ""
        }
    }
    
    
}
