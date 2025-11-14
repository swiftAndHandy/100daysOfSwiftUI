//
//  Friend.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
