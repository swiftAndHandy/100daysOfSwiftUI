//
//  HistoryView.swift
//  HighRollers
//
//  Created by Andre Veltens on 12.03.26.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) var dismiss
    private var history: [DiceRoll]
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(history) { historyElement in
                    VStack(alignment: .leading) {
                        Text("\(historyElement.date.formatted(date: .omitted, time: .omitted))")
                            .font(.title)
                        
                        Text("Result: \(historyElement.results.reduce(into: [:]) {$0[$1, default: 0] += 1 }.sorted { $0.key < $1.key }.map { face, count in count > 1 ? "\(count) times \(face)" : "\(face)"  }.joined(separator: ", "))")
                        
                        Text("Total: \(historyElement.results.reduce(0, +))")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .navigationTitle("Result History")
        }
    }
    
    init(for history: [DiceRoll]) {
        self.history = history.sorted(by: { $0.date > $1.date })
    }
}

#Preview {
    HistoryView(for: [])
}
