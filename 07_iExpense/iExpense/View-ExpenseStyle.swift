//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Andre Veltens on 27.10.25.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body) 
        } else if item.amount < 100 {
            return self.font(.title2)
        } else {
            return self.font(.title)
        }
    }
}
