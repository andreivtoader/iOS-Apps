//
//  DeleteBikeView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI

struct DeleteBikeView: View {
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            BikeUIText(text: bike.name, size: 20, weight: .semibold, color: .white)
            BikeUIText(text: "will be deleted.", size: 17, weight: .semibold, color: .white)
            
            HStack {
                Button {
                    isShowing = false
                } label: {
                    BikeUIText(text: "Cancel", size: 15, weight: .regular, color: .white)
                        .frame(maxWidth: .infinity)
                }

                
                AddButtonView(title: "Delete") {
                    self.manager.delete(bike: bike)
                    isShowing = false
                }
            }
        }
        .background(Color.waikawaGrey)
        .padding()
    }
}

struct DeleteBikeView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteBikeView(manager: BikeManager(), bike: .constant(Bike(name: "Canyon", type: .electric, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: [])), isShowing: .constant(false))
    }
}
