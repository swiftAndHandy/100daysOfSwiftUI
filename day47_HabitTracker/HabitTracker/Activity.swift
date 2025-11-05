//
//  Activity.swift
//  HabitTracker
//
//  Created by Andre Veltens on 03.11.25.
//

import Foundation

struct Activity: Codable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    
    
    var completions: Int = 0
    
    static let example = Activity(title: "Example activity", description: "This is a example activity")
    
    mutating func increment() {
        completions += 1
    }
}
