//
//  BikesForm.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct BikesForm: View {
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    private let bikeNameTextfieldConfiguration = TextfieldUIConfiguration(title: "Bike Name", type: .text, label: .empty, labelTitle: "")
    
    var body: some View {
        VStack {
            TextfieldEntryView(configuration: bikeNameTextfieldConfiguration, input: $bike.name, selection: .constant(false))
            
            DropdownSelectionView(title: "Wheel Size", elements: WheelSize.allCases, selection: $bike.wheelSize)
            
            TextfieldEntryView(configuration: TextfieldUIConfiguration(title: "Service in", type: .numeric, label: .label, labelTitle: "\(manager.settings.unit.description)"), input: $bike.serviceDue, selection: .constant(false))
            
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
