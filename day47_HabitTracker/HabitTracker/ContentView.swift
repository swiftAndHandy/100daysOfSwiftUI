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
                    Text("Detail View")
                } label: {
                    HStack {
                        Text(activity.title)
                        
                        Spacer()
                        
                        Text(String(activity.completions))
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
}

#Preview {
    ContentView()
}
