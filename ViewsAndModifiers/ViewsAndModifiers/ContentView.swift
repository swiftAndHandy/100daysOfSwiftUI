//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Andre Veltens on 09.10.25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.orange)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(Font.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
    
    init(_ text: String,) {
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CapsuleText("Hi there")
            CapsuleText("Second")
                .titleStyle()
        }
    }
}
    

#Preview {
    ContentView()
}
