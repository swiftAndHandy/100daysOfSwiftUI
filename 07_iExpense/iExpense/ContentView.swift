//
//  ContentView.swift
//  iExpense
//
//  Created by Andre Veltens on 25.10.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder: [SortDescriptor<ExpenseItem>] = [SortDescriptor(\ExpenseItem.name)]
    
    var body: some View {
        NavigationStack {
            ExpensesList(category: nil, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by category")
                            .tag([
                                SortDescriptor(\ExpenseItem.category),
                            ])
                        
                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                            ])
                        
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
