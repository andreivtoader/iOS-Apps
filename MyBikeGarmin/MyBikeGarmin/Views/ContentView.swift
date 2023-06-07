//
//  ContentView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        AppTabView(manager: manager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: BikeManager())
    }
}
