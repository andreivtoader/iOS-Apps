//
//  AddBikeView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct AddBikeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    @State private var isPresented = false
    
    @State private var currentColor: UIColor = .white
    @State private var bikeType = BikeType.road
    @State private var bikeNameStr = ""
    @State private var wheelSizeStr = ""
    @State private var serviceDueStr = ""
    @State private var isDefaultBike = true
    
    var body: some View {
        ZStack {
            Color(.tealishBlue).ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    Spacer()
                    Text(K.Bike.addBikeTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading)
                    Spacer()
                    Button(K.Menu.CANCEL) {
                        dismiss()
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 0) {
                    Spacer()
                    ColorCarouselView(selectedColor: $currentColor)

                    BikeCarouselView(selectedColor: $currentColor, type: $bikeType)

                    TextfieldWithSuffix(title: K.Bike.bikeNameTitle, requiredIcon: true, suffix: false, suffixText: "", currentText: $bikeNameStr)

                    DropdownMenu(title: K.Bike.wheelSizeTitle, options: WheelSizeType.getAllWheelSizes(), selection: $wheelSizeStr)

                    TextfieldWithSuffix(title: K.Bike.serviceTitle, requiredIcon: true, suffix: true, suffixText: "KM", currentText: $serviceDueStr)
                    
                    LabeledToggleButton(text: "Default Bike", isOn: $isDefaultBike)

                    Spacer()
                    
                    //pop to bike list view when bike is added
                    AddButtonView(title: K.Bike.addBikeTitle) {
                        print("Current color: \(currentColor)")
                        print("bikeType: \(bikeType)")
                        print("bikeNameStr: \(bikeNameStr)")
                        print("wheelSizeStr: \(wheelSizeStr)")
                        print("serviceDueStr: \(serviceDueStr)")
                        print("isDefaultBike: \(isDefaultBike)")
                        
                        
                           
                        var bike = Bike(name: bikeNameStr, type: bikeType, wheelSize: WheelSizeType(rawValue: Double(wheelSizeStr) ?? 0) ?? .twentySixPointFive, color: Color(currentColor), serviceDue: Int(serviceDueStr) ?? 0, isDefault: isDefaultBike, rides: [Ride]())
                        
                        if bikeNameStr.isEmpty || wheelSizeStr.isEmpty || serviceDueStr.isEmpty {
                            
                        } else {
                            if self.manager.allBikes.isEmpty {
                                bike.isDefault = true
                            }
                            self.manager.allBikes.append(bike)
                            print(self.manager.allBikes.count)
                            self.manager.updateSettingsDefaultBikeName()
                            
                            dismiss()
                        }
                    }

                    Spacer()

                }
            }
        }
    }
}

struct AddBikeView_Previews: PreviewProvider {
    static var previews: some View {
        AddBikeView(manager: BikeManager())
    }
}
