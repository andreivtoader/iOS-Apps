//
//  BikeCardTitleView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import PopupView

struct BikeCardTitleView: View {
    @ObservedObject var manager: BikeManager
    @Binding var bike: Bike
    
    @State var editBikeSheet = false
    @State var deleteBikePopup = false
    
    var body: some View {
        HStack {
            Spacer()
            Menu {
                Button() {
                    editBikeSheet.toggle()
                } label: {
                    HStack {
                        BikeUIText(text: "Edit Bike", size: 15, weight: .regular, color: .white)
                        Image("icon_edit")
                    }
                }
                
                Button(role: .destructive) {
                    deleteBikePopup.toggle()
                } label: {
                    HStack {
                        Image("icon_delete")
                        BikeUIText(text: "Delete bike", size: 15, weight: .regular, color: .white)
                    }
                }
            } label: {
                Image("icon_overflow")
            }
            .fullScreenCover(isPresented: $editBikeSheet) {
                EditBikeView(manager: manager, bike: $bike)
            }
            .popup(isPresented: $deleteBikePopup) {
                // delete bike popup view
                DeleteBikeView(manager: manager, bike: $bike, isShowing: $deleteBikePopup)
            } customize: {
                $0
                    .isOpaque(true)
                    .closeOnTapOutside(false)
                    .backgroundColor(.black.opacity(0.4))
            }
        }
    }
}

struct BikeCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        BikeCardTitleView(manager: BikeManager(), bike: .constant(Bike(name: "", type: .electric, wheelSize: .twentyEight, color: .blueLagoon, serviceDue: "1200", isDefault: false, rides: [])))
            .background(Color.waikawaGrey)
    }
}
