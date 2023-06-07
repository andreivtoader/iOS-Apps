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
            FormEntryLabelView(title: title, isRequired: true)
            
            HStack {
                DatePicker("", selection: $ride.date, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
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
            
//            BikeUIText(text: "Required field", size: 12, weight: .regular, color: .red)
//                .opacity(0)
        }
    }
}

struct DateEntryView_Previews: PreviewProvider {
    static var bikey = Bike(name: "Firsty", type: .mtb, wheelSize: .twentySeven, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])
    
    static var previews: some View {
        DateEntryView(title: "Date", ride: .constant(Ride(title: "Faget MTB ride", bike: bikey, distance: "100", duration: Duration(hours: 4, minutes: 34), date: Date.now)))
            .background(.teal)
    }
}
