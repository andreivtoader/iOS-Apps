//
//  ArticleListView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 14.04.2023.
//

import SwiftUI

struct ArticleListView: View {
    let filteredArticle: ArticleUI
    
    var body: some View {
        VStack {
            Text(filteredArticle.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            HStack {
                Text(filteredArticle.author)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text(filteredArticle.date)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

//struct ArticleListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(selectedTopics: .constant(K.sampleData))
//    }
//}
