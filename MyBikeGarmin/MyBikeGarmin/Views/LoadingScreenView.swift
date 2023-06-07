//
//  LoadingScreenView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct LoadingScreenView: View {
    @ObservedObject var manager: BikeManager
    
    @State var isActive : Bool = false
    
    var body: some View {
        if isActive {
            ContentView(manager: manager)
        } else {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    ZStack(alignment: .center) {
                        Image("image_source_unsplash")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .frame(width: geometry.size.width * 0.2)
                        
                        HStack {
                            Spacer()
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)
                            Spacer()
                        }
                            
                    }
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
