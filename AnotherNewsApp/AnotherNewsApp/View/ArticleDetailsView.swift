//
//  ArticleDetailsView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 14.04.2023.
//

import SwiftUI

struct ArticleDetailsView: View {
    let article: ArticleUI
    
    var body: some View {
        VStack {
            Text(article.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding()
            
            HStack {
                Text(article.author)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Text(article.date)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            AsyncImage(url: URL(string: article.urlToImage), scale: 3)
                .padding()
            
            Text(article.description)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
        }
    }
}

//struct ArticleDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(selectedTopics: .constant(K.sampleData))
//    }
//}
