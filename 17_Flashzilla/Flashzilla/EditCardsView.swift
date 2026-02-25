//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Andre Veltens on 25.02.26.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards: [Card] = []
    @State private var newPrompt: String = ""
    @State private var newAnswer: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Prompt", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: deleteCard)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: close)
            }
            .onAppear(perform: loadData)
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
        cards.append(Card(prompt: trimmedPrompt, answer: trimmedAnswer))
        CardStoreage.saveData(for: cards)
        newPrompt = ""
        newAnswer = ""
    }
    
    func deleteCard(at index: IndexSet) {
        cards.remove(atOffsets: index)
        CardStoreage.saveData(for: cards)
    }
    
    func close() {
        dismiss()
    }
    
    func loadData() {
        cards = CardStoreage.loadData()
    }
}

#Preview {
    EditCardsView()
}


