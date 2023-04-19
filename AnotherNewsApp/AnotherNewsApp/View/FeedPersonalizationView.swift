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
                    
                    InterestsSelectionView(manager: manager)
                    
                    Text(manager.numberOfSelectedTopics() < K.minimumTopicsSelected  ? K.noItemsSelectedText : K.EMPTY_STRING)
                        .padding()
                }
            }
            
            NavigationLink {
                NewsFeedView(manager: manager)
            } label: {
                FooterButtonView(title: K.continueButton)
            }
            .disabled(manager.numberOfSelectedTopics() < K.minimumTopicsSelected)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(K.appTitle)
    }
}

struct FeedPersonalizationView_Previews: PreviewProvider {
    static var apiManager = NewsManager()
    static var previews: some View {
        WelcomeView(manager: apiManager)
    }
}
