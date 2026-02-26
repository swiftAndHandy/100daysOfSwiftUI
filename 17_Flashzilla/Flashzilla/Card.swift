//
//  Card.swift
//  Flashzilla
//
//  Created by Andre Veltens on 24.02.26.
//

import Foundation

struct Card: Codable, Equatable, Identifiable {
    let id: UUID
    var prompt: String
    var answer: String
    
    init(prompt: String, answer: String) {
        self.id = UUID()
        self.prompt = prompt
        self.answer = answer
    }
}

struct CardStoreage {
    private static let storageKey = "Cards"
    
    static func saveData(for cards: [Card]) {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    static func loadData() -> [Card] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([Card].self, from: data)
        else { return [] }
        
        return decoded
    }
}

extension Card {
    static let example = Card(prompt: "Who played the 10th Doctor in Doctor Who?", answer: "David Tennant")
}
