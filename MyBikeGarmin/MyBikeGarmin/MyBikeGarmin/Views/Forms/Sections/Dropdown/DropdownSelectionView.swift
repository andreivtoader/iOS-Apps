//
//  DropdownSelectionView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct DropdownSelectionView<T>: View where T: DropdownSelectable, T: RandomAccessCollection, T.Element : Hashable {
    let title: String
    var elements: T
    @Binding var selection: T.Element
    var prompt: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            FormLabelView(title: title, isRequired: true)
            
            LabeledContent {
                Menu {
                    ForEach(elements, id: \.self) { element in
                        Button {
                            self.selection = element
                        } label: {
                            BikeUIText(text: String(describing: element), size: 14, weight: .regular, color: .white)
                        }
                    }
                } label: {
                    HStack {
                        Spacer()
                        Image("icon_dropdown")
                    }
                }
            } label: {
                BikeUIText(text: String(describing: selection), size: 14, weight: .regular, color: .white)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 7).fill(Color.waikawaGrey))
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white, lineWidth: 0.75)
            )
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
            
            BikeUIText(text: prompt, size: 12, weight: .regular, color: .red)
        }
    }
}

struct DropdownSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownSelectionView(title: "Distance Units", elements: DistanceUnit.allCases, selection: .constant(DistanceUnit.miles), prompt: "")
    }
}
