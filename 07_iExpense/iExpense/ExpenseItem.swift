//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Andre Veltens on 26.10.25.
//


import SwiftData
import SwiftUI

@Model
class ExpenseItem {
    var name: String
    var type: String
    var amount: Double
    var category: String
    
    init(name: String, type: String, amount: Double, category: String) {
        self.name = name
        self.type = type
        self.amount = amount
        self.category = category
    }
}
