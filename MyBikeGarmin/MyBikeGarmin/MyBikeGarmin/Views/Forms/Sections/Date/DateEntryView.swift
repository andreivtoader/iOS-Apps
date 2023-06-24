//
//  DateEntryView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct DateEntryView: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    @Binding var ride: Ride
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            FormLabelView(title: title, isRequired: true)
            
            HStack {
                DatePicker("", selection: $ride.date, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .tint(Color.cloudBurst)
                    .colorMultiply(colorScheme == .dark ? .black : .white)
                    .colorInvert()
                Spacer()
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 7).fill(Color.waikawaGrey))
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white, lineWidth: 0.75)
            )
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
        }
    }
}

struct DateEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DateEntryView(title: "Date", ride: .constant(Ride(title: "Faget MTB ride", bike: Bike(name: "Firsty", type: .mtb, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: []), distance: "100", duration: Duration(hours: 4, minutes: 34), date: Date.now)))
            .background(.teal)
    }
}
