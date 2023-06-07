//
//  DurationSectionView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct DurationSectionView: View {
    
    let title: String
    let formGeometry: GeometryProxy
    @ObservedObject var manager: BikeManager
    
    let widthDivider: CGFloat = 4.0
    let heightDivider: CGFloat = 15.0
    
    var body: some View {
        Section(header: FormSectionTitleView(title: title, isRequired: true)) {
            
            LabeledContent {
                
            } label: {
                HStack() {
                    Picker("", selection: $manager.duration.hours){
                        ForEach(0..<11, id: \.self) { i in
                            Text("\(i)h")
                                .tag(i)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: formGeometry.size.width / widthDivider, height: formGeometry.size.height / heightDivider, alignment: .trailing)
                    .validation(manager.durationValidation)
                    
                    Picker("", selection: $manager.duration.minutes){
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)m")
                                .tag(i)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: formGeometry.size.width / widthDivider, height: formGeometry.size.height / heightDivider, alignment: .leading)
                }
                .padding()
            }
        }
        .listRowBackground(Color(UIColor.waikawaGrey))
        .listRowInsets(EdgeInsets())
    }
}

struct DurationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            DurationSectionView(title: "Duration", formGeometry: geometry, manager: BikeManager())
        }
        
    }
}
