//
//  ContentView.swift
//  eduTimesTable
//
//  Created by Andre Veltens on 20.10.25.
//

import SwiftUI

struct ContentView: View {
    enum displayedView {
        case game
        case settings
    }
    
    @State private var currentView = displayedView.settings
    @State private var currentQuestion: Int = 0
    @State private var timesTable: Int = 6
    
    @State private var selectedQuestionAmount: Int = 2
    
    
    private var maxQuestions: Int {
        var sum = 5
        for index in 0...selectedQuestionAmount {
            sum += index * 5
        }
        return sum
    }
    
    var body: some View {
        NavigationStack {
                if currentView == .game {
                    
                } else if currentView == .settings {
                    VStack {
                        Form {
                            Section("Times table for number") {
                                Stepper(value: $timesTable, in: 2...12) {
                                    Text("\(timesTable)")
                                }
                            }
                            Section("Number of Rounds") {
                                HStack(spacing:50) {
                                    Button { selectedQuestionAmount = 0 } label: {
                                        Text("5")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(.green)
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    
                                    Button { selectedQuestionAmount = 1  } label: {
                                        Text("10")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(.green)
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    
                                    Button { selectedQuestionAmount = 2 } label: {
                                        Text("20")
                                    }
                                    .frame(width: 75, height: 75)
                                    .background(.green)
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                }
                            }
                        }
                        .navigationTitle("Configure Game")
                        
                        HStack {
                            Text("maxQuestions: \(maxQuestions)")
                        }
                    }
                }
        
        }
    }
}

#Preview {
    ContentView()
}
