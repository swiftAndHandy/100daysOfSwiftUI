//
//  User.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [Tag]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Swift Handy", age: 36, company: "BP", email: "hello@bp", address: "nothingham street", about: "just a dude, learning SwiftUI", registered: .now, tags: [Tag(name:"cool"), Tag(name: "swift")], friends: [])
    
}
