//
//  AnotherNewsAppApp.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

@main
struct AnotherNewsAppApp: App {
    @StateObject var manager = NewsManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            WelcomeView(manager: manager)
                .padding()
                .task {
                    print("Now loading...")
                    do {
                        try await manager.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        print("Now saving...")
                        Task {
                            do {
                                try await manager.save(topics: manager.selectedTopics)
                            } catch {
                                fatalError(error.localizedDescription)
                            }
                        }
                    }
                }
            
        }
    }
}
