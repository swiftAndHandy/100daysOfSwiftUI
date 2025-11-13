//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Andre Veltens on 25.10.25.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
