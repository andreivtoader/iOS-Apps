//
//  FeedPersonalizationView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct FeedPersonalizationView: View {
    @EnvironmentObject var manager: NewsManager
    @State private var selectedItems: [Topic] = []
    
    var body: some View {
        VStack {
            Color.clear.overlay {
                VStack {
                    Text(K.interestsDescription)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(Topic.allCases, id: \.rawValue) { topic in
                            InterestsSelectionView(topic: topic, items: $selectedItems)
                        }
                    }
                    .padding()
                    
                    Text(selectedItems.count < K.minimumTopicsSelected  ? K.noItemsSelectedText : "")
                        .padding()
                }
            }
            
            NavigationLink {
                NewsFeedView(currentTopics: $selectedItems)
                    .environmentObject(manager)
            } label: {
                FooterButtonView(title: K.continueButton)
            }
            .disabled(selectedItems.count < K.minimumTopicsSelected)
                 
        }
    }
}

struct FeedPersonalizationView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPersonalizationView()
    }
}
