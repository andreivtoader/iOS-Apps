//
//  NumericTextField.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI
import Combine

struct NumericTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(.white)
            .keyboardType(.numberPad)
            .onReceive(Just(self.text), perform: self.numericValidator)
            .frame(height: 10)
            .textFieldStyle(.plain)
    }
    
    func numericValidator(newValue: String) {
        if newValue.range(of: "^\\d+$", options: .regularExpression) != nil {
            self.text = newValue
        } else if !self.text.isEmpty {
            self.text = String(text.prefix(self.text.count - 1))
        }
    }
}

struct NumericTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumericTextField(text: .constant("Cool constant"))
    }
}
