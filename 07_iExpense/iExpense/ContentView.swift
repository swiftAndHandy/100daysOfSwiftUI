//
//  ContentView.swift
//  iExpense
//
//  Created by Andre Veltens on 25.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItem)
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
            }
        }
    }
    
    func removeItem(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
//        expenses.items.remove(atOffsets: offsets)
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItem(at offsets: IndexSet) {
        removeItem(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItem(at offsets: IndexSet) {
        removeItem(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}
