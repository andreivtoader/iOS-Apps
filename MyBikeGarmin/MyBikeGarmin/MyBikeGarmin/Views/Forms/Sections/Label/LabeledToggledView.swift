//
//  LabeledToggle.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct LabeledToggledView: View {
    let text: String
    @Binding var selection: Bool
    
    var body: some View {
        HStack {
            BikeUIText(text: text, size: 14, weight: .regular, color: .white)
            
            Spacer()
            
            Toggle("", isOn: $selection)
                .tint(Color.brightBlue)
                .foregroundColor(.white)
                .toggleStyle(.switch)
                .frame(width: 30)
                .padding(.horizontal)
        }
    }
}

struct LabeledToggledView_Previews: PreviewProvider {
    static var previews: some View {
        LabeledToggledView(text: "Default Bike", selection: .constant(true))
            .background(Color.tealishBlue)
    }
}
