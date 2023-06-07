//
//  FormSectionTitleView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI

struct FormSectionTitleView: View {
    let title: String
    let isRequired: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            .font(.system(size: 14, weight: .regular))
            
            if isRequired {
                Image("icon_required")
            }
            
        }
    }
}

struct FormSectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionTitleView(title: "asdf", isRequired: true)
            .background(.blue)
    }
}
