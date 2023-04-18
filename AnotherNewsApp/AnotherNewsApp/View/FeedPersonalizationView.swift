//
//  FeedPersonalizationView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct FeedPersonalizationView: View {
    @ObservedObject var manager: NewsManager
    
    var body: some View {
        VStack {
            Color.clear.overlay {
                VStack {
                    Text(K.interestsDescription)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(NewsManager.allTopics) { topic in
                            InterestsSelectionView(selectableTopic: topic, manager: manager)
                        }
                    }
                    .padding()
                    
                    Text(manager.selectedTopics.count < K.minimumTopicsSelected  ? K.noItemsSelectedText : "")
                        .padding()
                }
            }
            
            NavigationLink {
                NewsFeedView(manager: manager)
            } label: {
                FooterButtonView(title: K.continueButton)
            }
            .disabled(manager.selectedTopics.count < K.minimumTopicsSelected)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(K.appTitle)
    }
}

//struct FeedPersonalizationView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(selectedTopics: .constant(K.sampleData))
//    }
//}
