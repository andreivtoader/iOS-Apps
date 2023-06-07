//
//  FormView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI
import FormValidator

struct FormView: View {
    @ObservedObject var manager: BikeManager
    
    @State private var isOn = true
    @State private var text = ""
    @State private var unit: DistanceUnit = .km
    @State private var wheelSize: WheelSizeType = .twentyNine
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    
    let textfieldToggleConfiguration = TextfieldUIConfiguration(title: "Toggle textfield", type: .text, label: .toggle, labelTitle: "")
    
    let textfieldLabelConfiguration = TextfieldUIConfiguration(title: "Label textfield", type: .numeric, label: .label, labelTitle: "MILES")
    
    let textfieldEmptylabelConfiguration = TextfieldUIConfiguration(title: "No label", type: .text, label: .empty, labelTitle: "")
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Form {
                    LabelSectionView(title: "", labelTitle: "Default", isOn: $isOn)
                    
                    TextfieldSectionView(configuration: textfieldToggleConfiguration, manager: manager, selection: $isOn)
                    
                    TextfieldSectionView(configuration: textfieldEmptylabelConfiguration, manager: manager, selection: $isOn)
                    
                    TextfieldSectionView(configuration: textfieldLabelConfiguration, manager: manager, selection: $isOn)
                    
//                    DropdownSectionView(title: "Dropdown", elements: DistanceUnit.allCases, selection: $unit)
                    
//                    DropdownSectionView(title: "Wheel size", elements: WheelSizeType.allCases, selection: $wheelSize)
                    
                    DurationSectionView(title: "Duration", formGeometry: geometry, manager: manager)
                    
                    DateSectionView(title: "date", manager: manager)
                }
                .background(Color(UIColor.tealishBlue))
                .scrollContentBackground(.hidden)
            }
        }

    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(manager: BikeManager())
    }
}
