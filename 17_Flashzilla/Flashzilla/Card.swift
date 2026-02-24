//
//  Card.swift
//  Flashzilla
//
//  Created by Andre Veltens on 24.02.26.
//

import Foundation

struct Card {
    var prompt: String
    var answer: String
    
}

extension Card {
    static let example = Card(prompt: "Who played the 10th Doctor in Doctor Who?", answer: "David Tennant")
}
