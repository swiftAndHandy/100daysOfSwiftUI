//
//  ContentView.swift
//  HabitTracker
//
//  Created by Andre Veltens on 03.11.25.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)
                        
                        Spacer()
                        
                        Text(String(activity.completions))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity = true
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completions < 3 {
            .red
        } else if activity.completions < 10 {
            .orange
        } else if activity.completions < 30 {
            .yellow
        } else {
            .green
        }
    }
}

#Preview {
    ContentView()
}
