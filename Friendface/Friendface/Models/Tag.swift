//
//  Tag.swift
//  Friendface
//
//  Created by Andre Veltens on 14.11.25.
//

import Foundation
import SwiftData

@Model
class Tag: Codable {
    var name: String
    
    enum CodingKeys: CodingKey {
        case name
    }

    init(name: String) {
        self.name = name
    }
    

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.name = try container.decode(String.self)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }

}
