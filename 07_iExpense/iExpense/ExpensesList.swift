//
//  ExpensesList.swift
//  iExpense
//
//  Created by Andre Veltens on 27.10.25.
//

import SwiftData
import SwiftUI

struct ExpensesList: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: localCurrency))
                        .foregroundStyle(item.amount <= 10 ? .green : item.amount < 100 ? .blue : .red)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount.formatted(.currency(code: localCurrency)))")
                .accessibilityHint("\(item.type)")
            }
            .onDelete(perform: removeItem)
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
    
    init(type: String = "All", sortBy: [SortDescriptor<ExpenseItem>]){
            _expenses = Query(filter: #Predicate<ExpenseItem> {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortBy)
    }
    
}

#Preview {
    ExpensesList(type: "All", sortBy: [])
        .modelContainer(for: ExpenseItem.self)
}
