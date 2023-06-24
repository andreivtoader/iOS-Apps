//
//  FormEntryLabelView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct FormLabelView: View {
    let title: String
    let isRequired: Bool
    
    var body: some View {
        HStack {
            BikeUIText(text: title, size: 12, weight: .regular, color: .greyCloud)
                 
            if isRequired {
                Image("icon_required")
            }
        }
    }
}

struct FormEntryLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(title: "Distance In", isRequired: true)
    }
}
