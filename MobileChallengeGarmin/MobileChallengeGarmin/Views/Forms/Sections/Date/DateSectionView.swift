//
//  DateSectionView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct DateSectionView: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        Section(header: FormSectionTitleView(title: title, isRequired: true)) {
            
            VStack {
                DatePicker("", selection: $manager.date, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .colorMultiply(colorScheme == .dark ? .black : .white)
                    .colorInvert()
                    .validation(manager.dateValidation)
            }
            .padding()
        }
        .listRowBackground(Color(UIColor.waikawaGrey))
        .listRowInsets(EdgeInsets())
    }
}

struct DateSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DateSectionView(title: "Date", manager: BikeManager())
    }
}
