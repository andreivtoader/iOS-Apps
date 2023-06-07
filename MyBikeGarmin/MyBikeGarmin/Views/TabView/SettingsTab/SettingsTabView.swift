//
//  SettingsTabView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack(spacing: 0) {
                BikeUIText(text: "Settings", size: 20, weight: .semibold, color: .white)
                    .padding()
                
                SettingsForm(manager: manager)
                
                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(manager: BikeManager())
    }
}
