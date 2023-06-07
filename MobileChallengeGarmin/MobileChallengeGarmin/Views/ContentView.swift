//
//  ContentView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        AppTabView(manager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: BikeManager())
    }
}
