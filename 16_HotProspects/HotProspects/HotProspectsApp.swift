//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Andre Veltens on 15.02.26.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
