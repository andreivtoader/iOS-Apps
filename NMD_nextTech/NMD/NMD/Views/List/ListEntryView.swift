//
//  ListEntry.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct ListEntryView: View {
    @ObservedObject var viewModel: GratitudeVM
    var gratitude: DailyGratitude
    
    var body: some View {
        VStack {

            DateView(description: gratitude.dateDescription)
            SummaryView(description: gratitude.summary, truncated: true)
            
            if let image = gratitude.image {
                image
                    .resizable()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding()
            }
            else if let url = gratitude.imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                }
            }
            
            HStack {
                ForEach(gratitude.tags ?? [String](), id: \.self) { tag in
                    TagView(description: tag)
                }
            }
        }
        
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListEntryView(viewModel: GratitudeVM(), gratitude: DailyGratitude(summary: "Felt right about everything!", date: Date.now))
    }
}
