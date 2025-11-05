//
//  Order.swift
//  CupcakeCorner
//
//  Created by Andre Veltens on 05.11.25.
//

import Foundation

@Observable
class Order {
    static let types = ["Chocolate", "Strawberry", "Vanilla", "Pistachio"]
    
    var type: Int = 0
    var quantity: Int = 1
    
    var specialRequestsEnabled: Bool = false {
        didSet {
            if specialRequestsEnabled == false {
                addFrosting = false
                addSprinkles = false
            }
        }
    }
    var addFrosting: Bool = false
    var addSprinkles: Bool = false
    
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zip: String = ""
    
    var hasValidAddress: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && !streetAddress.trimmingCharacters(in: .whitespaces).isEmpty && !city.trimmingCharacters(in: .whitespaces).isEmpty && !zip.trimmingCharacters(in: .whitespaces).isEmpty && zip.trimmingCharacters(in: .whitespaces).allSatisfy(\.isNumber)
    }
    
    var cost: Decimal {
        var cost = Decimal(quantity*2)
        cost += addFrosting ? 1 * Decimal(quantity) : 0
        cost += addSprinkles ? 0.5 * Decimal(quantity) : 0
        return cost
    }
}
