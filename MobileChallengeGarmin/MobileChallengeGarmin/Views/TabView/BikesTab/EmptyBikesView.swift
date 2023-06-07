//
//  EmptyBikesView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI
import PopupView

struct EmptyBikesView: View {
    @ObservedObject var manager: BikeManager
    
    @State private var isPresented = false
    @State private var showingPopup = false
    
    var body: some View {
        VStack {
            Image(K.Bike.missingBikeIcon)
                .resizable()
                .scaledToFit()
            
            ZStack {
                HStack {
                    Image(K.Bike.dottedLine)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 15)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    MissingBikeTextDescription(text: K.Bike.missingBikeText)
                        .background(Color(UIColor.tealishBlue))
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    
                    Spacer()
                    
                    AddButtonView(title: K.Bike.addBikeTitle) {
                        isPresented.toggle()
                        showingPopup.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        AddBikeView(manager: manager)
                    }

                    
                }
            }
        }
    }
}

struct EmptyBikesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBikesView(manager: BikeManager())
    }
}
