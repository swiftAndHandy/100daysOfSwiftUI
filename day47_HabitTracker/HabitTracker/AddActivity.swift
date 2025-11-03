//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Andre Veltens on 03.11.25.
//

import SwiftUI

struct AddActivity: View {
    var data: Activities
    
    @State private var name = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Activity name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add activity")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = name.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else {
                        return
                    }
                    
                    let activity = Activity(title: trimmedTitle, description: description)
                    
                    data.activities.append(activity)
                    dismiss()
                }
                
                Button("Cancel") { dismiss() }
            }
        }
    }
}


#Preview {
    AddActivity(data: Activities())
}
