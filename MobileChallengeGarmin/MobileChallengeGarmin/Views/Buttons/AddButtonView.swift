//
//  AddButtonView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct AddButtonView: View {
    let title: String
    let callback: () -> Void
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text(title)
                .font(.system(size: 15, weight: .regular))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(UIColor.brightBlue))
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding()
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(title: "Add stuff") {
            
        }
    }
}
