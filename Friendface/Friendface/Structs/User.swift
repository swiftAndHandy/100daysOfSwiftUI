//
//  User.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import Foundation

struct User {
    let id: String
    let isActice: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    
    let tags: [Tag]
    
    let friends: [Friend]
    
    enum CodingKeys: String, CodingKey {
        case id, isActice, name, age, company, email, address, about, registered, tags, friends
    }
    
}
