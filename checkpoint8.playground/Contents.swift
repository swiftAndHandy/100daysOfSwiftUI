import UIKit

protocol Building {
    var rooms: Int { get }
    var costs: Int { get }
    
    var estateAgent: String { get }
    
    func summary() -> Void
}

struct House: Building {
    var rooms: Int
    var costs: Int
    
    var estateAgent: String
    
    func summary() {
        print("This House has \(rooms) rooms and costs \(costs) dollars. Contact \(estateAgent) for further information.")
    }
}

struct Office: Building {
    var rooms: Int
    var costs: Int
    
    var estateAgent: String
    
    func summary() {
        print("This Office has \(rooms) rooms and costs \(costs) dollars. Contact \(estateAgent) for further information.")
    }
}


Office(rooms: 40, costs: 100000, estateAgent: "Agent Smith").summary()
House(rooms: 10, costs: 50_000, estateAgent: "Simon Jung").summary()
