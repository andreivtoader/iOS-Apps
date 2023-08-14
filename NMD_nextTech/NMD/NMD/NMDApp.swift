//
//  NMDApp.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import SwiftUI

@main
struct NMDApp: App {
    @StateObject var viewModel = GratitudeVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
