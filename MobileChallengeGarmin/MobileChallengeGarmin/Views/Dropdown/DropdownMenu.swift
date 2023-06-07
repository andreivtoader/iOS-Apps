//
//  DropdownMenu.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct DropdownMenu: View {
    let title: String
    let options: [String]
    
    @Binding var selection: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            DropdownTextTitle(text: title, requiredIcon: true)
                .padding(.horizontal)
 
            Menu {
                ForEach(options, id: \.self) { option in
                    Button {
                        self.selection = String(describing: option)
                    } label: {
                        Text(String(describing: option))
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
                .border(labelShouldBeRed() ? .red : .clear, width: 2)
                .padding(.horizontal)
                
            }
            .buttonStyle(.borderless)
            
        }
        
    }
    
    func labelShouldBeRed() -> Bool {
        return selection.isEmpty
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(title: "Distance unit", options: ["km", "miles"], selection: .constant("MILES"))
    }
}
