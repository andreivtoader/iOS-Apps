//
//  MobileChallengeGarminApp.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

@main
struct MobileChallengeGarminApp: App {
    @StateObject var manager = BikeManager()
    
    var body: some Scene {
        WindowGroup {
            LoadingScreenView(manager: manager)
        }
    }
}
