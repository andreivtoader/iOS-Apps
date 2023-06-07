//
//  EmptyElementsView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct EmptyElementsView: View {
    let description: String
    let icon: String
    let buttonAddTitle: String
    let pageNavigation: PageTypeNavigation
    
    @ObservedObject var manager: BikeManager
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(icon)
                .resizable()
                .scaledToFit()
            
            ZStack {
                HStack {
                    Image("dotted_line")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 15)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    MissingElementsTextDescription(text: description)
                        .background(Color.tealishBlue)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    
                    Spacer()
                    
                    AddButtonView(title: buttonAddTitle) {
                        isPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        switch pageNavigation {
                        case .bikes:
                            AddBikeView(manager: manager)
                        case .rides:
                            AddRideView(manager: manager)
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct EmptyElementsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyElementsView(description: "Bikes/Rides are missing, huehuehue", icon: "missing_bike_card", buttonAddTitle: "Add Bike", pageNavigation: .bikes, manager: BikeManager())
    }
}
