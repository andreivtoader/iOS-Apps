//
//  BikesForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

/**
 The form entries will most likely need to be refactored using Measurement<T> in order to make use of the specific locale
 and to apply a proper MeasurementFormatter. I realized this a bit too late, sorry!
 */

struct BikesForm: View {
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    private let bikeNameTextfieldConfiguration = TextfieldUIConfiguration(title: "Bike Name", isRequired: true, type: .text, label: .empty)
    
    var body: some View {
        VStack {
            TextfieldEntryView(configuration: bikeNameTextfieldConfiguration, input: $manager.formValidator.bikeName, prompt: manager.formValidator.bikeNamePrompt)
            
            DropdownSelectionView(title: "Wheel Size", elements: WheelSize.allCases.map{$0.rawValue}, selection: $manager.formValidator.wheelSize, prompt: manager.formValidator.wheelSizePrompt)
            
            TextfieldEntryView(configuration: TextfieldUIConfiguration(title: "Service in", isRequired: true, type: .numeric, label: .label, labelTitle: "\(manager.settings.unit.description)"), input: $manager.formValidator.serviceIn, prompt: manager.formValidator.serviceInPrompt)
            
            LabeledToggledView(text: "Default Bike", selection: $bike.isDefault)
        }
        .padding(.horizontal, 8)
    }
}

struct BikesForm_Previews: PreviewProvider {
    static let bike = Bike(name: "Firsty", type: .mtb, wheelSize: .twentyNine, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])
    
    static var previews: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            BikesForm(manager: BikeManager(), bike: .constant(bike))
        }
    }
}
