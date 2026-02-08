//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Andre Veltens on 08.10.25.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 10)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle: String = ""
    
    @State private var userScore: Int = 0
    @State private var currentQuestion: Int = 0
    @State private var gameOver: Bool = false
    
    @State private var selectedFlag = -1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black, .black, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing:30) {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.white)
                
                VStack(spacing: 15) {
                
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0)
                        )
                        .opacity(selectedFlag == number || selectedFlag == -1 ? 1 : 0.25)
                        .scaleEffect(selectedFlag == -1 ? 1 : selectedFlag == number ? 1.25 : 0.75)
//                        .animation(.default, value: selectedFlag)

                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                Spacer()
                Spacer()
                Text("Score: \(userScore), \(selectedFlag)")
                    .foregroundStyle(Color.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") { }
        } message: {
            Text(scoreTitle == "Correct!" ? "Your score is: \(userScore)" : "No points this time.")
        }
        .alert("Game Finished", isPresented: $gameOver) {
            Button("Restart") { restartGame() }
        } message: {
            Text("Your final score is: \(userScore).")
        }
    }
    
    func flagTapped(_ number: Int) {
        currentQuestion += 1
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
            showingScore = true
        }
        if currentQuestion >= 8 {
            gameOver = true
        } else {
            askQuestion()
        }
    }
    
    func restartGame() {
        currentQuestion = 0
        userScore = 0
        askQuestion()
    }
    
    func askQuestion() {
        withAnimation() {
            selectedFlag = -1
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
