//
//  LoadingScreenView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct LoadingScreenView: View {
    @ObservedObject var manager: BikeManager
    
    @State var isActive : Bool = false
    
    private let scaleSizeEffect = 1.3
    private let offSet = -0.6
    
    var body: some View {
        if isActive {
            ContentView(manager: manager)
        } else {
            GeometryReader { geometry in
                VStack {
                    ZStack(alignment: .center) {
                        Image("image_source_unsplash")
                            .resizable()
                            .scaledToFill()
                        
                        //add logo
                    }
                    .scaleEffect(scaleSizeEffect)
                    .offset(x: geometry.size.width / offSet)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {}
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView(manager: BikeManager())
    }
}
