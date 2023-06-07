//
//  RidesForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct RidesForm: View {
    @ObservedObject var manager: BikeManager
    @Binding var ride: Ride
    
    private let rideTitleConfiguration = TextfieldUIConfiguration(title: "Ride Title", type: .text, label: .empty)
    
    var body: some View {
        VStack {
            TextfieldEntryView(configuration: rideTitleConfiguration, input: $ride.title, selection: .constant(false))
            
            DropdownSelectionView(title: "Bike", elements: $manager.allBikes.map {$0.name.wrappedValue}, selection: $ride.bike.name)
                .disabled(manager.allBikes.isEmpty)
                .listRowInsets(EdgeInsets())
                .onChange(of: ride) { _ in
                    // update bike in @State ride structure
                    if let bike = manager.allBikes.filter({$0.name == ride.bike.name}).first {
                        ride.bike = bike
                    }
                }
            
            TextfieldEntryView(configuration: TextfieldUIConfiguration(title: "Distance", type: .numeric, label: .label, labelTitle: "\(manager.settings.unit.description)"), input: $ride.distance, selection: .constant(false))
            
            DurationEntryView(title: "Duration", ride: $ride)
            
            DateEntryView(title: "Date", ride: $ride)
                .padding(.vertical)
        }
        .padding(.horizontal, 8)
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
