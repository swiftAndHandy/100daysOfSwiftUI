//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Andre Veltens on 03.11.25.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            if activity.description.isEmpty == false {
                Section {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.completions)")
                
                Button("Mark completed") {
                    var newActivity = activity
                    newActivity.completions += 1
                    
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActivity
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityView(data: Activities(), activity: Activity.example)
}
