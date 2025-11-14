//
//  ContentView.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Fetch Data") {
                
            }
        }
        .padding()
    }
    
    func fetchData() {
        
    }
}

#Preview {
    ContentView()
}
