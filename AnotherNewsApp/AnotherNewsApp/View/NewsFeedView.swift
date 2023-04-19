//
//  NewsPulseFeedView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var manager: NewsManager
    @State private var currentSelection = 0
    
    var body: some View {
        VStack {
            TabBarView(manager: manager, currentTabSelection: $currentSelection)

            NavigationStack {
                List {
                    ForEach(manager.filteredArticles) { article in
                        NavigationLink {
                            ArticleDetailsView(article: article)
                        } label: {
                            ArticleListView(filteredArticle: article)
                                .padding()
                        }
                        .tint(.accentColor)
                        
                    }
                }
                .listStyle(.sidebar)
            }
                
        }
        .task {
            let topic = Topic(rawValue: manager.selectedTopics()[currentSelection].topic.rawValue)!
            let selectableTopic = SelectableTopic(topic: topic, isSelected: false)

            await manager.getHeadlines(for: selectableTopic)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(K.appTitle)
    }
}

//struct NewsPulseFeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(selectedTopics: .constant(K.sampleData))
//    }
//}
