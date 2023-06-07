//
//  MissingElementsTextDescription.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct MissingElementsTextDescription: View {
    let text: String
    
    var body: some View {
        BikeUIText(text: text, size: 15, weight: .regular, color: .white)
    }
}

struct MissingElementsTextDescription_Previews: PreviewProvider {
    static var previews: some View {
        MissingElementsTextDescription(text: "Bikes/Rides are missing, huehuehue")
    }
}
