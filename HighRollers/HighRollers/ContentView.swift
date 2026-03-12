//
//  ContentView.swift
//  HighRollers
//
//  Created by Andre Veltens on 10.03.26.
//

import SwiftUI

struct DiceRoll: Identifiable, Codable {
    var id: UUID = UUID()
    var results: [Int]
    var date: Date
}

struct DiceView: View {
    var value: Int
    var body: some View {
        Text("\(value)")
    }
}

struct DiceList: View {
    var results: [Int]
    
    let columns = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(Array(results.enumerated()), id: \.offset) { index, result in
                DiceView(value: result)
                    .frame(width: 50, height: 50)
                    .background(.blue)
                    .border(.black)
            }
        }
    }
}

struct ContentView: View {
    
    let diceSides = [4, 6, 8, 10, 12, 20, 100]
    let savePath = URL.documentsDirectory.appending(path: "ResultHistory")
    
    @State private var amountOfDices: Int = 1
    @State private var amountOfSides: Int = 6
    @State private var historyIsPresented: Bool = false
    
    @State private var results = [Int]()
    @State private var history: [DiceRoll] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Result: \(results.reduce(0, +))")
                DiceList(results: results)
                    .padding()
                    .frame(maxWidth: .infinity)
                Spacer()
                HStack {
                    VStack(spacing: 0) {
                        Text("Number of dices:")
                        Picker("Number of dices", selection: $amountOfDices) {
                            ForEach(1..<10) {
                                Text("\($0)").tag($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    VStack(spacing: 0) {
                        Text("Sides:")
                        Picker("Number of dices", selection: $amountOfSides) {
                            ForEach(diceSides, id: \.self) {
                                Text("\($0)").tag(Int($0))
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                Button("Roll \(amountOfDices)d\(amountOfSides)") {
                    rollDice()
                }
                .buttonStyle(.glass)
                Spacer()
            }
            .toolbar {
                Button("Test", systemImage: "clock.arrow.circlepath") {
                    historyIsPresented = true
                }
                    .sheet(isPresented: $historyIsPresented) {
                        HistoryView(for: history)
                    }
            }
        }
        .onAppear {
            history = loadResults()
        }
    }
    
    func rollDice() {
        results.removeAll()
        for _ in 0..<amountOfDices {
            results.append(Int.random(in: 1...amountOfSides))
        }
        saveResults()
    }
    
    func saveResults() {
        do {
            var history = loadResults()
            history.append(DiceRoll(results: results, date: Date()))
            let data = try JSONEncoder().encode(history)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            self.history = history
        } catch {
            print("Error while saving: \(error)")
        }
    }
    
    func loadResults() -> [DiceRoll] {
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([DiceRoll].self, from: data)
            
        } catch {
            print("Error while loading: \(error)")
            return []
        }
    }

}

#Preview {
    ContentView()
}
