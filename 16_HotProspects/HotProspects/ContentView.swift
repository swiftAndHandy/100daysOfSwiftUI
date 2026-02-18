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
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contact", systemImage: "checkmark.circle")
                }
            
            ProspectsView(filter: .uncontacted)
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
