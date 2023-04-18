//
//  WelcomeView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var manager: NewsManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.clear.overlay {
                    VStack(alignment: .center) {
                        Image(K.newsPulseWelcomeImage)
                        Text(K.appTitle)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(K.appDescription)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
                
                NavigationLink(destination: {
                    FeedPersonalizationView(manager: manager)
                }, label: {
                    FooterButtonView(title: K.continueButton)
                })
                
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var apiManager = NewsManager()
    static var previews: some View {
        WelcomeView(manager: apiManager)
    }
}
