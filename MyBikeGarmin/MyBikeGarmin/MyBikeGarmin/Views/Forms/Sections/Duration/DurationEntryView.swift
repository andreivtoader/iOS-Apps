//
//  DurationEntryView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct DurationEntryView: View {
    let title: String
//    @Binding var ride: Ride
    @Binding var duration: Duration
    var prompt: String
    
    @State private var hours = 0
    @State private var minutes = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            FormLabelView(title: title, isRequired: true)
            
            LabeledContent {
            } label: {
                HStack() {
                    Picker("", selection: $duration.hours){
                        ForEach(0..<24) { i in
                            BikeUIText(text: "\(i)h", size: 14, weight: .regular, color: .black)
                                .tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.white)
                    
                    Picker("", selection: $duration.minutes){
                        ForEach(0..<60) { i in
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
            
            BikeUIText(text: prompt, size: 12, weight: .regular, color: .red)
        }
    }
}

struct DurationEntryView_Previews: PreviewProvider {
    static var bikey = Bike(name: "Firsty", type: .mtb, wheelSize: .twentySeven, color: .blueLagoon, serviceDue: "1200", isDefault: true, rides: [])
    static var previews: some View {
//        DurationEntryView(title: "Duration", ride: .constant(Ride(title: "Faget MTB ride", bike: bikey, distance: "100", duration: Duration(hours: 4, minutes: 34), date: Date.now)))
        DurationEntryView(title: "Duration", duration: .constant(Duration(hours: 3, minutes: 34)), prompt: "")
    }
}
