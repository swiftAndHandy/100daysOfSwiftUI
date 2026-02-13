//
//  ContentView.swift
//  WordScramble
//
//  Created by Andre Veltens on 13.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var allWords = [String]()
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text (word)
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(word), \(word.count) letters")
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Text("Score: \(score)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(.purple)
                    .foregroundStyle(.white)
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {}
                message: {
                    Text(errorMessage)
                }
            .toolbar {
                Button("New Game", action: restartGame)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        newWord = ""
        
        guard answer.count > 0 else { return }
        
        guard equalsRootWord(word: answer) else {
            wordError(title: "Word equals root word", message: "Try to spell another word out of \(rootWord)")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "To short", message: "Try to find a word with more than 2 letters.")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word is used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell '\(answer)' from '\(rootWord)'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not in dictionary", message: "\(answer) is not a real word.")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            score += 10 + (answer.count - 2)
        }
        
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                allWords = startWords.split(separator: "\n").map(String.init)
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func restartGame() {
        rootWord = allWords.randomElement() ?? "silkworm"
        usedWords.removeAll()
        newWord = ""
        score = 0
    }
    
    func equalsRootWord(word: String) -> Bool {
        word != rootWord
    }
    
    func isLongEnough(word: String) -> Bool {
        word.count > 2
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
        
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
