//
//  AddView.swift
//  iExpense
//
//  Created by Andre Veltens on 26.10.25.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double = 0
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                .keyboardType(.decimalPad)
        }
        .navigationTitle("Add new expense")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .cancel) { dismiss() }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self)
}
