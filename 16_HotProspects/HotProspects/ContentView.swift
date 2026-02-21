//
//  ContentView.swift
//  HotProspects
//
//  Created by Andre Veltens on 15.02.26.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SortableProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            SortableProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contact", systemImage: "checkmark.circle")
                }
            
            SortableProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.fill")
                }
        }
    }
    
}

#Preview {
    ContentView()
}
