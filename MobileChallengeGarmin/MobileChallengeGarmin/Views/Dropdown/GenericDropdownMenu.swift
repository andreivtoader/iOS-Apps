//
//  DropdownMenu.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct GenericDropdownMenu<T>: View where T: DropdownSelectable, T: RandomAccessCollection, T.Element : Hashable {
    let title: String
    let elements: T
    
    @State private var selection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            DropdownTextTitle(text: title, requiredIcon: true)
 
            Menu {
                ForEach(elements, id: \.self) { element in
                    Button {
                        self.selection = String(describing: element)
                    } label: {
                        Text(String(describing: element))
                    }
                }
            } label: {
                HStack {
                    DropdownInputText(text: selection)
                    
                    Spacer()
                    
                    Image(K.UIIcons.DROPDOWN)
                }
                .padding()
                .background(Color(UIColor.waikawaGrey))
                .padding(.horizontal)
            }
            .buttonStyle(.borderless)
        }
        
    }
}

struct GenericDropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
//        GenericDropdownMenu(title: "Distance Unit", type: DistanceUnit.self)
        GenericDropdownMenu(title: "Cool title", elements: ["1", "2"])
        
    }
}
