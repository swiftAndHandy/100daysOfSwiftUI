//
//  UserDetailView.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    let allUsers: [User]
    
    @Binding var path: NavigationPath
    
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
                    .padding(.vertical)
            }
            
            Section("Contact details") {
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }
            Section("Friends") {
                ForEach(user.friends) { friend in
                    NavigationLink(value: findFriend(with: friend.id)) {
                        Text("\(friend.name)")
                    }
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle("\(user.name) (\(user.age))")
        .toolbar {
            if path.count > 1 {
                Button {
                    path = NavigationPath()
                } label: {
                    Label("Close", systemImage: "house.fill")
                }
            }
        }
    }
    
    func findFriend(with id: UUID) -> User {
        return allUsers.filter { $0.id == id }.first!
    }
    
}

#Preview {
    UserDetailView(user: .example, allUsers: [.example], path: .constant(NavigationPath()))
}
