//
//  DurationEntryView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct DurationEntryView: View {
    let title: String
    @Binding var ride: Ride
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            FormEntryLabelView(title: title, isRequired: true)
            
            LabeledContent {
            } label: {
                HStack() {
                    Picker("", selection: $ride.duration.hours){
                        ForEach(0..<24, id: \.self) { i in
                            BikeUIText(text: "\(i)h", size: 14, weight: .regular, color: .black)
                                .tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.white)
                    
                    Picker("", selection: $ride.duration.minutes){
                        ForEach(0..<60, id: \.self) { i in
                            BikeUIText(text: "\(i)m", size: 14, weight: .regular, color: .black)
                                .tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.white)
                }
                .frame(maxHeight: 50)
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
//        .frame(height: 30)
    }
}

struct DurationEntryView_Previews: PreviewProvider {
    static var bikey = Bike(name: "Firsty", type: .mtb, wheelSize: .twentySeven, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])
    static var previews: some View {
        DurationEntryView(title: "Duration", ride: .constant(Ride(title: "Faget MTB ride", bike: bikey, distance: "100", duration: Duration(hours: 4, minutes: 34), date: Date.now)))
    }
}
