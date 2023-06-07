//
//  FormEntryFieldView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct TextfieldEntryView: View {
    let configuration: TextfieldUIConfiguration
    
    @Binding var input: String
    @Binding var selection: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            FormEntryLabelView(title: configuration.title, isRequired: true)
            
            HStack {
                switch configuration.type {
                    case .text:
                    TextField(text: $input) { EmptyView() }
                        .keyboardType(.default)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        
                    
                    case .numeric:
                    TextField(text: $input) { EmptyView() }
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                
                switch configuration.label {
                    case .label:
                    BikeUIText(text: configuration.labelTitle, size: 14, weight: .regular, color: .greyCloud)
                    
                    case .empty:
                    BikeUIText(text: "", size: 14, weight: .regular, color: .white)
                }
                
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 7).fill(Color.waikawaGrey))
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white, lineWidth: 0.75)
            )
            
            BikeUIText(text: "Required field", size: 12, weight: .regular, color: .red)
                .opacity(0)
        }
    }
}

struct TexfieldEntryView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldEntryView(configuration: TextfieldUIConfiguration(title: "Bike Name", type: .text, label: .empty), input: .constant("Canyon"), selection: .constant(true))
    }
}
