//
//  LabeledToggleButton.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI

struct LabeledToggleButton: View {
    let text: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            DropdownInputText(text: text)
        }
        .tint(Color(UIColor.brightBlue))
        .padding()
        
    }
}

struct LabeledToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        LabeledToggleButton(text: "Cool text", isOn: .constant(true))
    }
}
