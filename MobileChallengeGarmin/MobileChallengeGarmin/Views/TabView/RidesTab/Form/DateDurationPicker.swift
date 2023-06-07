//
//  DurationPicker.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI

struct DateDurationPicker: View {
    @Environment(\.colorScheme) var colorScheme
    
    let type: PickerType
    
    @Binding var hours: Int
    @Binding var minutes: Int
    
    @Binding var date: Date
    
    var body: some View {
        VStack(spacing: 0) {
            DropdownTextTitle(text: "Duration", requiredIcon: true)
            
            LabeledContent {
            } label: {
                HStack {
                    switch type {
                        case .duration:
                            Picker("", selection: $hours){
                                ForEach(0..<11, id: \.self) { i in
                                    DropdownInputText(text: "\(i) hours")
                                        .tag(i)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.white)
                
                            Picker("", selection: $minutes){
                                ForEach(0..<60, id: \.self) { i in
                                    DropdownInputText(text: "\(i) min")
                                        .tag(i)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.white)
                        case .date:
                            DatePicker("", selection: $date, displayedComponents: .date)
                                .labelsHidden()
                                .colorMultiply(colorScheme == .dark ? .black : .white)
                                .colorInvert()
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color(UIColor.waikawaGrey))

        }
        .padding()

    }
}

struct DurationPicker_Previews: PreviewProvider {
    static var previews: some View {
        DateDurationPicker(type: .date, hours:
                .constant(2), minutes: .constant(3), date: .constant(Date.now))
    }
}
