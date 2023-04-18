//
//  FooterButtonView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct FooterButtonView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .font(.callout)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            .background(Color(uiColor: .black))
            .cornerRadius(30)
            .padding()
    }
}

struct FooterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FooterButtonView(title: K.continueButton)
    }
}
