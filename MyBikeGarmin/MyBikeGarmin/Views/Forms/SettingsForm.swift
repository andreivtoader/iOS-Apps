//
//  SettingsForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct SettingsForm: View {
    
    @ObservedObject var manager: BikeManager
    private let textfieldConfiguration = TextfieldUIConfiguration(title: "Service Reminder", type: .numeric, label: .empty, labelTitle: "")
    
    var body: some View {
        VStack {
            DropdownSelectionView(title: "Distance Units", elements: DistanceUnit.allCases, selection: $manager.settings.unit)
            
            ToggledEntryFieldView(configuration: textfieldConfiguration, input: $manager.settings.serviceReminder, selection: $manager.settings.serviceReminderOn)
            
            DropdownSelectionView(title: "Default Bike", elements: $manager.allBikes.map {$0.name.wrappedValue}, selection: $manager.settings.defaultBikeName)
                .disabled($manager.allBikes.isEmpty)
        }
        .padding(.horizontal, 8)
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
