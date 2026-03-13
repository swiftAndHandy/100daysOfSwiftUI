//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Andre Veltens on 10.03.26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something")
        }
    }
}

#Preview {
    ContentView()
}
