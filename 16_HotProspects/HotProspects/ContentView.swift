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
        VStack {
            Text("Hello world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: isSelectedColor(backgroundColor, newColor: .red)) {
                        backgroundColor = .red
                    }
                    Button("Green", systemImage: isSelectedColor(backgroundColor, newColor: .green)) {
                        backgroundColor = .green
                    }
                    Button("Blue", systemImage: isSelectedColor(backgroundColor, newColor: .blue)) {
                        backgroundColor = .blue
                    }
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
