//
//  NewsPulseFeedView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct NewsFeedView: View {
    @EnvironmentObject var manager: NewsManager
    @Binding var currentTopics: [Topic]
    
    var body: some View {
        VStack {
            TabBarView(menuTopicItems: $currentTopics)
                .environmentObject(manager)
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color(uiColor: .systemGray6))
                .task {
                    let topic = Topic(rawValue: currentTopics.first!.rawValue)!
                    await manager.getHeadlines(for: topic)
                }
        }
    }
}

struct NewsPulseFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
