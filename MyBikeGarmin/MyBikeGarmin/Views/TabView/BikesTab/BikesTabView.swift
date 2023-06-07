//
//  BikesTabView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct BikesTabView: View {
    @ObservedObject var manager: BikeManager
    
    private let missingBikesDescription = "You don't have any bike added yet. Add your first bike and start registering your rides in order to keep your bike service cycles up to date."
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            if manager.allBikes.isEmpty {
                EmptyElementsView(description: missingBikesDescription, icon: "missing_bike_card", buttonAddTitle: "Add Bike", pageNavigation: .bikes, manager: manager)
            } else {
                BikesListView(manager: manager)
            }
        }
    }
}

struct BikesTabView_Previews: PreviewProvider {
    static var previews: some View {
        BikesTabView(manager: BikeManager())
    }
}
