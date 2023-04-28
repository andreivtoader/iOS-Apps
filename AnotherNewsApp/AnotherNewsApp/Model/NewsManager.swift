//
//  NewsAPI.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import Foundation

class NewsManager: ObservableObject {
    
    private let apiClient = ApiClient()
    
    @Published var filteredArticles = [ArticleUI]()
    @Published var allTopics: [SelectableTopic] = K.initialData
    
    func getHeadlines(for topic: SelectableTopic) async {
        let newsEndpoint = NewsEndpoint(selectableTopic: topic)
        let result = await apiClient.fetchResourcesSync(endpoint: newsEndpoint) as Result<ResponseJSON, ApiError>
        
        headlinesReceived(result)
    }
    
    func numberOfSelectedTopics() -> Int {
        return allTopics.filter { $0.isSelected }.count
    }
    
    func selectedTopics() -> [SelectableTopic] {
        return allTopics.filter {$0.isSelected}
    }
    
    private func headlinesReceived(_ result: Result<ResponseJSON, ApiError>) {
        switch result {
            case .success(let newsJSON):
                publishNews(json: newsJSON)
            case .failure(let error):
                print("Error: \(error)")
        }
    }
    
    private func publishNews(json: ResponseJSON) {
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
