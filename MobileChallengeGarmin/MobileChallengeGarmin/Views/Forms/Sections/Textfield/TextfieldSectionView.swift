//
//  TextfieldSectionView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct TextfieldSectionView: View {
    let configuration: TextfieldUIConfiguration
    
    @ObservedObject var manager: BikeManager
    @Binding var selection: Bool
    
    var body: some View {
        Section(header: FormSectionTitleView(title: configuration.title, isRequired: false)) {
            
            HStack {
                switch configuration.type {
                    case .text:
                    TextField(text: $manager.firstName) { EmptyView() }
                        .keyboardType(.asciiCapableNumberPad)
                        .foregroundColor(.white)
                        .validation(manager.firstNameValidation)
                    
                    case .numeric:
                    TextField(text: $manager.firstName) { EmptyView() }
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .validation(manager.firstNameValidation)
                }
                
                switch configuration.label {
                    case .toggle:
                    Toggle("", isOn: $selection)
                        .tint(.blue)
                        .foregroundColor(.white)
                    
                    case .label:
                    Text(configuration.labelTitle)
                        .foregroundColor(.gray)
                    
                    case .empty:
                    Text("")
                }  
                
            }
            .padding()
        }
        .listRowBackground(Color(UIColor.waikawaGrey))
        .listRowInsets(EdgeInsets())
    }
}

struct TextfieldSectionView_Previews: PreviewProvider {
    static let previewConf = TextfieldUIConfiguration(title: "asdf", type: .text, label: .toggle, labelTitle: "cool label title")
    static var previews: some View {
        TextfieldSectionView(configuration: previewConf, manager: BikeManager(), selection: .constant(true))
            .background(.black)
    }
}
