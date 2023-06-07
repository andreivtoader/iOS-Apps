//
//  GenericOptions.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI

struct GenericOptions<T>: View where T: DropdownSelectable, T: RandomAccessCollection, T.Element : Hashable {
    var elements: T
    @Binding var selection: T.Element
    
    var body: some View {
        LabeledContent {
            Menu {
                ForEach(elements, id: \.self) { element in
                    Button {
                        self.selection = element
                    } label: {
                        Text(String(describing: element))
                    }
                }
            } label: {
                HStack {
                    Spacer()
                    Image("icon_dropdown")
                }
            }
        } label: {
            Text(String(describing: selection))
                .foregroundColor(.white)
        }
    }
}

struct GenericOptions_Previews: PreviewProvider {
    static var previews: some View {
        GenericOptions(elements: DistanceUnit.allCases, selection: .constant(DistanceUnit.km))
            .background(.blue)
    }
}
