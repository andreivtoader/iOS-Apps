//
//  MyBikeGarminApp.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import UserNotifications

@main
struct MyBikeGarminApp: App {
    @StateObject var manager = BikeManager()
    
    var body: some Scene {
        WindowGroup {
            LoadingScreenView(manager: manager)
                .onAppear {
                    manager.notificationHandler.askPermission()
                }
        }
        
    }
}
