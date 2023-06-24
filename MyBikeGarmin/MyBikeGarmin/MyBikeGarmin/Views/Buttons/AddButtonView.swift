//
//  AddButtonView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct AddButtonView: View {
    let title: String
    let callback: () -> Void
    
    var body: some View {
        
        Button {            
            callback()
        } label: {
            BikeUIText(text: title, size: 15, weight: .regular, color: .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.brightBlue)
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
        .background(.black)
    }
}
