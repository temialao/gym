//
//  gymApp.swift
//  gym
//
//  Created by Temi Alao on 21/04/2023.
//

import SwiftUI

@main
struct gymApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
