//
//  MyBikeGarminApp.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import UserNotifications


/**
 Further unit tests and UI tests will need to be added to the app to make sure that after refactoring nothing breaks and the functionality is still there.
 */

@main
struct MyBikeGarminApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var manager = BikeManager()
    
    var body: some Scene {
        WindowGroup {
            LoadingScreenView(manager: manager)
                .onAppear {
                    manager.notificationHandler.askPermission()
                }
                .task {
                    do {
                         try await manager.load()
                    } catch {
                        print(error)
                    }
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        Task {
                            do {
                                try await manager.save(resource: manager.allRides, url: BikeManager.ridesFileURL())
                                try await manager.save(resource: manager.allBikes, url: BikeManager.bikesFileURL())
                                try await manager.save(resource: [manager.settings], url: BikeManager.settingsFileURL())
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
        }
        
    }
}
