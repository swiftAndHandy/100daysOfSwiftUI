//
//  Order.swift
//  CupcakeCorner
//
//  Created by Andre Veltens on 05.11.25.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestsEnabled = "specialRequestsEnabled"
        case _addFrosting = "addFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
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
    
    var name: String = UserDefaults.standard.string(forKey: "name") ?? "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    var streetAddress: String = UserDefaults.standard.string(forKey: "address") ?? "" {
        didSet {
            UserDefaults.standard.set(streetAddress, forKey: "address")
        }
    }
    var city: String = UserDefaults.standard.string(forKey: "city") ?? "" {
        didSet {
            UserDefaults.standard.set(city, forKey: "city")
        }
    }
    var zip: String = UserDefaults.standard.string(forKey: "zip") ?? "" {
        didSet {
            UserDefaults.standard.set(zip, forKey: "zip")
        }
    }
    
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
