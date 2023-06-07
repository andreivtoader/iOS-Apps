//
//  BikeView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 01.06.2023.
//

import SwiftUI

struct BikeView: View {
    var displayBike: BikeUI
    var selectedColor: UIColor
    let callback: () -> Void
    
    var body: some View {
        ZStack {
            ForEach(displayBike.bikeIcons, id: \.self) { icon in
                
                if icon.description.contains("middle") {
                    Image(icon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(selectedColor))
                        .onAppear {
                            callback()
                        }
                } else {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct BikeView_Previews: PreviewProvider {
    static var previews: some View {
        BikeView(displayBike: BikeUI(bikeType: .road, type: .road), selectedColor: UIColor.red ) {
            
        }
            .background(.blue)
    }
}
