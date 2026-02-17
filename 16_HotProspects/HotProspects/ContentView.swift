//
//  ContentView.swift
//  HotProspects
//
//  Created by Andre Veltens on 15.02.26.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
        
    }
    
    func isSelectedColor(_ color: Color, newColor: Color) -> String {
        return color == newColor ? "checkmark.circle.fill" : ""
        
    }
    
}

#Preview {
    ContentView()
}
