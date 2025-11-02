//
//  ContentView.swift
//  Navigation
//
//  Created by Andre Veltens on 31.10.25.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print ("Failed to save navigation data")
        }
    }
}

struct DetailView: View {
    var number: Int
//    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Open to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")

        .navigationTitle("test")
//            .toolbar {
//                Button("Home") {
//                    path = NavigationPath()
//                }
//            }
    }
}

struct ContentView: View {
//    @State private var path = NavigationPath()
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) {
                    DetailView(number: $0)
                }
        }
    }
}

#Preview {
    ContentView()
}
