//
//  BikesTabView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct BikesTabView: View {
    @ObservedObject var manager: BikeManager
    
    init(_ manager: BikeManager) {
        self.manager = manager
        
        // setting the navigation title color
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
    }
    var body: some View {
//        NavigationStack {
            ZStack {
                Color(UIColor.tealishBlue).ignoresSafeArea()
                
                if manager.allBikes.isEmpty {
                    EmptyBikesView(manager: manager)
                } else {
                    BikesListView(manager: manager)
                }
            }
//        }
    }
}

struct BikesTabView_Previews: PreviewProvider {
    static var previews: some View {
        BikesTabView(BikeManager())
    }
}
