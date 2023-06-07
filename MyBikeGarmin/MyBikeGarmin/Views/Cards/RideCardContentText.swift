//
//  RideCardContentText.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct RideCardContentText: View {
    let title: String
    let content: String
    
    var body: some View {
        HStack {            
            BikeUIText(text: title, size: 17, weight: .regular, color: .white)
            BikeUIText(text: content, size: 17, weight: .semibold, color: .white)
        }
        .padding(.vertical, 0.5)
    }
}

struct RideCardContentText_Previews: PreviewProvider {
    static var previews: some View {
        RideCardContentText(title: "Bike", content: "Nukeproof Scout 290")
            .background(.blue)
    }
}
