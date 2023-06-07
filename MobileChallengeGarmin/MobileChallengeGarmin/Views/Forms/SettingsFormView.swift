//
//  SettingsFormView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 04.06.2023.
//

import SwiftUI

struct SettingsFormView: View {
    @ObservedObject var manager: BikeManager
    
    private let textfieldConfiguration = TextfieldUIConfiguration(title: "Service Reminder", type: .numeric, label: .toggle, labelTitle: "")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Form {
                    DropdownSectionView(title: "Distance Units", elements: DistanceUnit.allCases, selection: $manager.settings.unit)
                    
                    TextfieldSectionView(configuration: textfieldConfiguration, manager: manager, selection: $manager.settings.serviceReminderOn)
                    
                    // TODO - bug here: if settings tab visible before any bike is show, the dropdown remains disabled.
                    // First you need to introduce a bike, then go to settings
                    // The fix was to disable the dropdown if the published array was empty!!!!!
                    DropdownSectionView(title: "Default Bike", elements: $manager.allBikes.map {$0.name.wrappedValue}, selection: $manager.settings.defaultBikeName)
                        .disabled($manager.allBikes.isEmpty)
                }
                .background(Color(UIColor.tealishBlue))
                .scrollContentBackground(.hidden)
                .onDisappear {
                    // update the current default bike by name
                    manager.updateDefaultBike(by: manager.settings.defaultBikeName)
                }
            }
        }
    }
}

struct SettingsFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFormView(manager: BikeManager())
    }
}
