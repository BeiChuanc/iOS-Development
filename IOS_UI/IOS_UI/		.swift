//
//  IOS_UIApp.swift
//  IOS_UI
//
//  Created by 北川 on 2025/2/9.
//

import SwiftUI

@main
struct IOS_UIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
