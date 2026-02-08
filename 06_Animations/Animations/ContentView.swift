//
//  ContentView.swift
//  Animations
//
//  Created by Andre Veltens on 16.10.25.
//

import SwiftUI

struct CornerRotadedModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotadedModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotadedModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    let letters = Array("Hello SwiftUI!")
    @State private var showingRed = false
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled: Bool = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        
        if showingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .transition(.pivot)
        }
        
        VStack {
            Button("hi there") {
                withAnimation {
                    showingRed.toggle()
                }
            }
        }
        
        
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(2)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
    }
}

#Preview {
    ContentView()
}
