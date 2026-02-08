//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Andre Veltens on 11.11.25.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
