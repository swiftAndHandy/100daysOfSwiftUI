//
//  ContentView.swift
//  Moonshot
//
//  Created by Andre Veltens on 28.10.25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("gridView") private var gridView: Bool = true
    
    var body: some View {
        NavigationStack {
            Group {
                if gridView {
                    GridView(missions: missions, astronauts: astronauts)
                } else {
                    GridView(missions: missions, astronauts: astronauts)
                }
            }
            .toolbar {
                Button {
                    gridView.toggle()
                } label: {
                    if gridView {
                        Label("Show as list", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
                .buttonStyle(.plain)
                .foregroundStyle(.blue)
            }
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
