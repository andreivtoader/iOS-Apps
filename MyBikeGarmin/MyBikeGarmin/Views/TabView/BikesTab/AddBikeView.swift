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
    @State private var bike = Bike(name: "", type: .mtb, wheelSize: .twentySixPointFive, color: .blueLagoon, serviceDue: "", isDefault: true, rides: [])
    
    private let carouselHeightFactor = 2.25
    
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
                        self.manager.add(bike: bike)
                        dismiss()
                    }
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
