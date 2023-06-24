//
//  AddBikeView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct AddBikeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: BikeManager
    
    @State private var bike = Bike(name: "", type: .mtb, wheelSize: .twentySix, color: .blueLagoon, serviceDue: "", isDefault: true, rides: [])
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            Image("wave")
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                VStack {
                    ModalTitleView(title: "Add Bike")
                }
                
                Spacer()
                
                VStack {
                    BikeCarouselView(bike: $bike)
                    BikesForm(manager: manager, bike: $bike)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    AddButtonView(title: "Add Bike") {
                        //update with validated values from FormValidator
                        bike.name = manager.formValidator.bikeName
                        bike.serviceDue = manager.formValidator.serviceIn
                        bike.wheelSize = WheelSize(rawValue: manager.formValidator.wheelSize) ?? .twentySix
                        
                        manager.formValidator.clearBikeFormEntries()
                        manager.add(bike: bike)
                        dismiss()
                    }
                    .opacity(manager.formValidator.isBikeRegistrationValid ? 1 : 0.6)
                    .disabled(manager.formValidator.isBikeRegistrationValid == false)
                }
                
                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
    }
}

struct AddBikeView_Previews: PreviewProvider {
    static var previews: some View {
        AddBikeView(manager: BikeManager())
            .background(.teal)
    }
}
