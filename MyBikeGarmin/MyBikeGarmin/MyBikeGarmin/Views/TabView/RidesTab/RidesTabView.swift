//
//  RidesTabView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct RidesTabView: View {
    @ObservedObject var manager: BikeManager
    
    private let missingRidesDescription = "You don't have any ride added yet. Add your first ride and keep track of all your activities."
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            if manager.allRides.isEmpty {
                EmptyElementsView(description: missingRidesDescription, icon: "missing_ride", buttonAddTitle: "Add Ride", pageNavigation: .rides, manager: manager)
            } else {
                RidesListView(manager: manager)
            }
        }
    }
}

struct RidesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RidesTabView(manager: BikeManager())
    }
}
