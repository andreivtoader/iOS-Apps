//
//  DropdownSectionView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct DropdownSectionView<T>: View where T: DropdownSelectable, T: RandomAccessCollection, T.Element : Hashable {
    let title: String
    var elements: T
    @Binding var selection: T.Element
    
    var body: some View {
        Section(header: FormSectionTitleView(title: title, isRequired: true)) {
            GenericOptions(elements: elements, selection: $selection)
                .padding()
        }
        .listRowBackground(Color(UIColor.waikawaGrey))
        .listRowInsets(EdgeInsets())

    }
}

struct DropdownSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownSectionView(title: "Cool title", elements: DistanceUnit.allCases, selection: .constant(.km))
            .background(.blue)
    }
}
