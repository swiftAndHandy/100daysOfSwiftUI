//
//  Tag.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import Foundation


struct Tag: Codable, Hashable {
    var name: String

    init(name: String) {
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.name = try container.decode(String.self)
    }


}
