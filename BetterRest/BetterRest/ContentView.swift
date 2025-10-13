//
//  ContentView.swift
//  BetterRest
//
//  Created by Andre Veltens on 11.10.25.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount: Double = 8.0
    @State private var coffeAmount: Int = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var sleepResults: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let predition = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - predition.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "There was an error"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
//                VStack(alignment: .leading, spacing: 10) {
                Section("When do you want to wake up?") {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Information about your habits") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("How much sleep do you want?")
                            .font(.headline
                            )
                        Stepper("^[\(sleepAmount.formatted()) hours](inflect:true)", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Daily coffee consume")
                            .font(.headline)
                        Stepper("^[\(coffeAmount) cup](inflect:true)", value: $coffeAmount, in: 0...20)
//                        Picker("Daily coffe consume", selection: $coffeAmount) {
//                            ForEach(1..<21) {
//                                Text(String($0))
//                            }
//                        }
                    }
                }
                
                Section("Recommended bedtime") {
                    Text("\(sleepResults)")
                        .font(.title3)
                }
            }
            .navigationTitle("Better Rest")

        }
        
    }
}

#Preview {
    ContentView()
}
