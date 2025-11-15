//
//  ContentView.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.name) private var users: [User]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green.opacity(0.6) : .red.opacity(0.7))
                            .frame(width: 30)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle(Text("Friendface"))
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user, allUsers: users, path: $path)
            }
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)

            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let downloadedUsers = try decoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)

            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()
                
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
}

#Preview {
    ContentView()
}
