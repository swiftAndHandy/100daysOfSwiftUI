//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Andre Veltens on 10.10.25.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var CPUMove: String = "Rock"
    @State private var playerMustWin: Bool = Bool.random()
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.purple, .pink], center: .top, startRadius: 0, endRadius: 1000)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("You have to")
                Text(playerMustWin ? "win" : "lose")
                    .font(.title.bold())
                HStack(alignment: .center) {
                    Text("against")
                    Text(CPUMove)
                        .font(.title.bold())
                }
                Spacer()
                HStack(spacing: 30) {
                    Button {
                        makeMove("Rock")
                    } label: {
                        Text("🪨")
                            .font(.system(size: 70))
                    }
                    Button {
                        makeMove("Paper")
                    } label: {
                        Text("📜")
                            .font(.system(size: 70))
                    }
                    Button {
                        makeMove("Scissors")
                    } label: {
                        Text("✂️")
                            .font(.system(size: 70))
                    }
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(Font.title)
                Spacer()
            }
        }
        
    }
    
    func makeMove(_ playerMove: String) {
        var playerWins: Bool = false
        var matchTied: Bool = false
        
        switch (playerMove, CPUMove) {
        case ("Rock", "Scissors"), ("Scissors", "Paper"), ("Paper", "Rock"):
            playerWins = true
        case ("Scissors", "Rock"), ("Paper", "Scissors"), ("Rock", "Paper"):
            playerWins = false
        default:
            matchTied = true
        }
        
        if playerWins == playerMustWin {
            score += 1
        } else if !matchTied {
            score -= 1
        }
        
        CPUMove = moves.randomElement()!
        playerMustWin.toggle()
    }
    
}

#Preview {
    ContentView()
}
