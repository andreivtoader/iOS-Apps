//
//  RidesTabView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct RidesTabView: View {
    @ObservedObject var manager: BikeManager
    
    init(_ manager: BikeManager) {
        self.manager = manager
    }
    
    var body: some View {
//        NavigationStack {
            ZStack {
                Color(UIColor.tealishBlue).ignoresSafeArea()
                
                if manager.allRides.isEmpty {
                    EmptyRidesView(manager)
                } else {
                    RidesListView(manager: manager)
                }
            }
//        }
    }
}

struct RidesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RidesTabView(BikeManager())
    }
}
