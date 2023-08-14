//
//  ContentView.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: GratitudeVM
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                
                VStack {
                    GratitudeToolbar(viewModel: viewModel, title: "Daily Gratitudes")
                    
                    List {
                        SectionView(title: "This week", viewModel: viewModel, items: $viewModel.thisWeekGratitudes)
                        
                        SectionView(title: "Last month", viewModel: viewModel, items: $viewModel.lastMonthGratitudes)
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: GratitudeVM())
    }
}
