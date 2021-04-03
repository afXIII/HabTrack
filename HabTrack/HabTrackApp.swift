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
    
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            MainTabView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
