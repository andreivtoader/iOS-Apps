//
//  ToggledEntryFieldView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct ToggledEntryFieldView: View {
    let configuration: TextfieldUIConfiguration
    
    @Binding var input: String
    @Binding var selection: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextfieldEntryView(configuration: configuration, input: $input, selection: $selection)
                
                Toggle("", isOn: $selection)
                    .tint(Color.brightBlue)
                    .foregroundColor(.white)
                    .toggleStyle(.switch)
                    .frame(width: 30)
                    .padding(.horizontal)
            }
        }
    }
}

struct ToggledEntryFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ToggledEntryFieldView(configuration: TextfieldUIConfiguration(title: "Bike Name", type: .text, label: .empty), input: .constant("Canyon"), selection: .constant(true))
    }
}
