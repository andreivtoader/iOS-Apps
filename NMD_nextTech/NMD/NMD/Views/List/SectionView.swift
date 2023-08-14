//
//  SectionView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct SectionView: View {
    let title: String
    @ObservedObject var viewModel: GratitudeVM
    @Binding var items: [DailyGratitude]
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach($items) { $item in
                
                ZStack {
                    NavigationLink(destination: EntryDetailsView(viewModel: viewModel, gratitude: $item)) {
                        EmptyView()
                    }.opacity(0.0)
                    
                    ListEntryView(viewModel: viewModel, gratitude: item)
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .background(.clear)
                    .foregroundColor(.white)
                    .padding(
                        EdgeInsets(
                            top: 5,
                            leading: 0,
                            bottom: 5,
                            trailing: 0
                        )
                    )
            )
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "This week", viewModel: GratitudeVM(), items: .constant([DailyGratitude(summary: "I'm not feeling well today", date: Date.now)]))
    }
}
