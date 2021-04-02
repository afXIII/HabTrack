//
//  HabTrackApp.swift
//  HabTrack
//
//  Created by AL3 on 3/31/21.
//

import SwiftUI

@main
struct HabTrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
