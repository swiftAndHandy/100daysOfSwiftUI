//
//  ContentView.swift
//  iExpense
//
//  Created by Andre Veltens on 25.10.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortBy: [SortDescriptor<ExpenseItem>] = [SortDescriptor(\ExpenseItem.name)]
    @State private var sortOrder: SortOrder = .forward
    @State private var expenseType = "All"
    
    var body: some View {
        NavigationStack {
            ExpensesList(type: expenseType, sortBy: sortBy)
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
                
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $expenseType) {
                        Text("Show All")
                            .tag("All")
                        
                        Divider()
                        
                        ForEach(AddView.types, id: \.self) { type in
                            Text(type)
                                .tag(type)
                        }
                        
                        
                    }
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortBy) {
                        Text("Sort by category")
                            .tag([
                                SortDescriptor(\ExpenseItem.type),
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
