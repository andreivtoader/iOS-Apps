//
//  ModalTitleView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct ModalTitleView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
            }
        }
        .padding()
    }
}

struct ModalTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTitleView(title: "Add gratitude")
    }
}
