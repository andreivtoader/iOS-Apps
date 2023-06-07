//
//  SectionedLabelView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct LabelSectionView: View {
    let title: String
    let labelTitle: String
    @Binding var isOn: Bool
    
    var body: some View {
        Section(header: FormSectionTitleView(title: title, isRequired: false)) {
            
            LabeledContent {
                Toggle("", isOn: $isOn)
                    .tint(.blue)
                    .foregroundColor(.white)
            } label: {
                Text(labelTitle)
                    .foregroundColor(.white)
                
            }
            .padding()
            
        }
        .listRowBackground(Color(UIColor.tealishBlue))
        .listRowInsets(EdgeInsets())
    }
}

struct LabelSectionView_Previews: PreviewProvider {
    static var previews: some View {
        LabelSectionView(title: "", labelTitle: "cool", isOn: .constant(true))
            .background(.black)
    }
}
