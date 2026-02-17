//
//  ContentView.swift
//  HotProspects
//
//  Created by Andre Veltens on 15.02.26.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if granted {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding(.vertical)
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Katzenklo reinigen."
                content.subtitle = "Das ist wichtig."
                content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { error in
                    if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
