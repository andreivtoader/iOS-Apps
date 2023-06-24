//
//  SettingsForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

/**
 The form entries will most likely need to be refactored using Measurement<T> in order to make use of the specific locale
 and to apply a proper MeasurementFormatter. I realized this a bit too late, sorry!
 */

struct SettingsForm: View {
    
    @ObservedObject var manager: BikeManager
    private let textfieldConfiguration = TextfieldUIConfiguration(title: "Service Reminder", isRequired: false, type: .numeric, label: .empty)
    
    var body: some View {
        VStack {
            DropdownSelectionView(title: "Distance Units", elements: DistanceUnit.allCases, selection: $manager.settings.unit, prompt: "")
            
            ToggledEntryFieldView(configuration: textfieldConfiguration, input: $manager.settings.serviceReminder, prompt: "", selection: $manager.settings.serviceReminderOn)
            
            DropdownSelectionView(title: "Default Bike", elements: $manager.allBikes.map {$0.name.wrappedValue}, selection: $manager.settings.defaultBikeName, prompt: "")
                .disabled($manager.allBikes.isEmpty)
        }
        .padding(.horizontal)
    }
}

struct SettingsForm_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            SettingsForm(manager: BikeManager())
        }
    }
}
