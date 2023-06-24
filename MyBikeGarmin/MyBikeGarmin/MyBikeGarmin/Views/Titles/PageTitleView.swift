//
//  PageTitleView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct PageTitleView: View {
    
    let configuration: PageTitleUIConfiguration
    @ObservedObject var manager: BikeManager
    @State private var isPresented = false
    
    var body: some View {
        HStack {
            //placeholder view to center title
            HStack {
                Image(configuration.buttonIconTitle)
                    .renderingMode(.template)
                    .foregroundColor(.tealishBlue)
                BikeUIText(text: configuration.buttonTitle, size: 17, weight: .regular, color: .tealishBlue)
            }
            Spacer()
            
            BikeUIText(text: configuration.title, size: 20, weight: .semibold, color: .white)
            
            Spacer()
            
            Button {
                isPresented.toggle()
            } label: {
                HStack {
                    Image(configuration.buttonIconTitle)
                    BikeUIText(text: configuration.buttonTitle, size: 17, weight: .regular, color: .brightBlue)
                }
                .fullScreenCover(isPresented: $isPresented) {
                    switch configuration.pageType {
                    case .bikes:
                        AddBikeView(manager: manager)
                    case .rides:
                        AddRideView(manager: manager)
                    }
                }
            }
        }
        .padding()
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(configuration: PageTitleUIConfiguration(title: "Bikes", buttonTitle: "Add bike", buttonIconTitle: "icon_add", pageType: .bikes), manager: BikeManager())
            .background(Color.tealishBlue)
    }
}
