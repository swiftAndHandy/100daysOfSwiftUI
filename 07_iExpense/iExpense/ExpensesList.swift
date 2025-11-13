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
    
    init(category: String?, sortOrder: [SortDescriptor<ExpenseItem>]){
        if let category {
            _expenses = Query(filter: #Predicate<ExpenseItem> { item in
                item.category == category
            }, sort: sortOrder)
        } else {
            _expenses = Query(sort: sortOrder)
        }
    }
    
}

#Preview {
    ExpensesList(category: "Private", sortOrder: [])
        .modelContainer(for: ExpenseItem.self)
}
