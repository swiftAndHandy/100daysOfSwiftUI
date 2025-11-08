//
//  ContentView.swift
//  Bookworm
//
//  Created by Andre Veltens on 08.11.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Detlef", "Jürgen", "Olaf", "Gesine", "Petra"]
                    let lastNames = ["Kroes", "Veltens", "Böhnke", "Schulz", "Kaiser"]
                    
                    let firstName = firstNames.randomElement()!
                    let lastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(firstName) \(lastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
