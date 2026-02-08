//
//  ContentView.swift
//  TinyConvert
//
//  Created by Andre Veltens on 08.10.25.
//

import SwiftUI

struct ContentView: View {
    private let units = ["°C", "°F", "K"]
    
    @State private var baseUnit: String = "°C"
    @State private var baseAmount: Double = 0.0
    @State private var targetUnit: String = "°F"
    private var targetAmount: Double {
        switch (baseUnit, targetUnit) {
            case ("°C", "°F"): return baseAmount * 9/5 + 32
            case ("°C", "K"): return baseAmount + 273.15
            case ("°F", "°C"): return (baseAmount - 32) * 5/9
            case ("°F", "K"): return (baseAmount - 32) * 5/9 + 273.15
            case ("K", "°F"): return (baseAmount - 273.15) * 9/5 + 32
            case ("K", "°C"): return baseAmount - 273.15
            default: return baseAmount
        }
    }
    @FocusState private var isEditing: Bool
    

    var body: some View {
        NavigationStack {
            Form {
                Section("Convert") {
                    HStack {
                        TextField("Value", value: $baseAmount, format: .number)
                        Picker("of base unit", selection: $baseUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
                Section("into") {
                    Picker("of target unit", selection: $targetUnit) {
                        ForEach(units, id: \.self) {
                            if $0 != baseUnit {
                                Text($0)
                            }
                        }
                    }
                }
                Section("Result") {
                    Text(baseAmount.formatted() + " \(baseUnit) equals " + targetAmount.formatted() + " \(targetUnit)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
