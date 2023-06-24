//
//  ModalTitleView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct ModalTitleView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    
    var body: some View {
        HStack {
            // This is used here as a workaround to center the modal title
            // Fullscreencover navigation title doesn't seem to be working
            BikeUIText(text: "Cancel", size: 17, weight: .regular, color: .tealishBlue)
            Spacer()
            
            BikeUIText(text: title, size: 20, weight: .semibold, color: .white)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                BikeUIText(text: "Cancel", size: 17, weight: .regular, color: .brightBlue)
            }
        }
        .padding()
    }
}

struct ModalTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTitleView(title: "Add bike")
            .background(Color.tealishBlue)
    }
}
