//
//  ToggleTextField.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct ToggleTextField: View {
    @State private var isToggled = true

    let title: String
    @Binding var textFieldText: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            DropdownTextTitle(text: title, requiredIcon: false)
            
            HStack {
                NumericTextField(text: $textFieldText)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.waikawaGrey))
                
                Toggle("", isOn: $isToggled)
                    .tint(Color(UIColor.brightBlue))
                    .frame(width: 80)
            }
        }
        .padding()
    }
}

struct ToggleTextField_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTextField(title: "Cool textfield", textFieldText: .constant(""))
    }
}
