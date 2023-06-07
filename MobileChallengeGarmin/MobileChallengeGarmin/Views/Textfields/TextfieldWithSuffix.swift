//
//  TextfieldWithSuffix.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI

struct TextfieldWithSuffix: View {
    let title: String
    let requiredIcon: Bool
    
    let suffix: Bool
    let suffixText: String
    
    @Binding var currentText: String
    
    var body: some View {
        VStack(spacing: 0) {
            DropdownTextTitle(text: title, requiredIcon: requiredIcon)
            
            LabeledContent {
                if suffix {
                    DropdownInputText(text: suffixText)
                        .foregroundColor(Color(UIColor.waikawaGrey))
                }
                
            } label: {
                TextField("", text: $currentText)
                    .frame(height: 10)
                    .textFieldStyle(.plain)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color(UIColor.waikawaGrey))
            .border(labelShouldBeRed() ? .red : .clear, width: 2)

        }
        .padding()
    }
    
    func labelShouldBeRed() -> Bool {
        if requiredIcon, currentText.isEmpty {
            return true
        }
        return false
    }
}

struct TextfieldWithSuffix_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldWithSuffix(title: "Cool title", requiredIcon: true, suffix: true, suffixText: "MILES", currentText: .constant(""))
            .background(.blue)
    }
}
