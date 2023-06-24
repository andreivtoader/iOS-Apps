//
//  RidesForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

/**
 The form entries will most likely need to be refactored using Measurement<T> in order to make use of the specific locale
 and to apply a proper MeasurementFormatter. I realized this a bit too late, sorry!
 */

struct RidesForm: View {
    @ObservedObject var manager: BikeManager
    @Binding var ride: Ride
    
    private let rideTitleConfiguration = TextfieldUIConfiguration(title: "Ride Title", isRequired: false, type: .text, label: .empty)
    
    var body: some View {
        VStack {
            TextfieldEntryView(configuration: rideTitleConfiguration, input: $ride.title, prompt: "")
            
            DropdownSelectionView(title: "Bike", elements: $manager.allBikes.map {$0.name.wrappedValue}, selection: $manager.formValidator.rideBike, prompt: manager.formValidator.rideBikePrompt)
                .disabled(manager.allBikes.isEmpty)
                .listRowInsets(EdgeInsets())
                .onChange(of: manager.formValidator.rideBike) { _ in
                    // update bike in @State ride structure
                    if let bike = manager.allBikes.filter({$0.name == manager.formValidator.rideBike}).first {
                        ride.bike = bike
                    }
                }

            TextfieldEntryView(configuration: TextfieldUIConfiguration(title: "Distance", isRequired: true, type: .numeric, label: .label, labelTitle: "\(manager.settings.unit.description)"), input: $manager.formValidator.distance, prompt: manager.formValidator.distancePrompt)

            DurationEntryView(title: "Duration", duration: $manager.formValidator.duration, prompt: manager.formValidator.durationPrompt)

            DateEntryView(title: "Date", ride: $ride)
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

struct RidesForm_Previews: PreviewProvider {
    static var bikey = Bike(name: "Firsty", type: .mtb, wheelSize: .twentySeven, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])
    
    static var previews: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            RidesForm(manager: BikeManager(), ride: .constant(Ride(title: "Faget MTB ride", bike: bikey, distance: "100", duration: Duration(hours: 0, minutes: 0), date: Date.now)))
        }
    }
}
