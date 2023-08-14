//
//  ToolbarView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct GratitudeToolbar: View {
    @ObservedObject var viewModel: GratitudeVM
    let title: String
    
    @State private var isPresented = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus")
            }
            .fullScreenCover(isPresented: $isPresented) {
                AddGratitudeView(viewModel: viewModel)
            }

        }
        .padding()
        .background(Color.backgroundColor.ignoresSafeArea())
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeToolbar(viewModel: GratitudeVM(), title: "Daily Gratitudes")
    }
}
