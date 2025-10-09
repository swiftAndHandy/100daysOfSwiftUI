import UIKit


struct Car {
    
    let model: String
    let seats: Int
    private(set) var currentGear: Int = 1
    let totalGears: Int = 6
    
    mutating func shiftGear(up: Bool) {
        switch up {
        case true:
            if currentGear < totalGears {
                self.currentGear += 1
            } else {
                print("Can't gear up anymore!")
            }
        case false:
            if currentGear > 1 {
                self.currentGear -= 1
            } else {
                print("Can't gear down anymore!")
            }
        }
    }
    
}


var myCar = Car(model: "Toyota Corolla", seats: 5)

print(myCar)
myCar.shiftGear(up: true)
myCar.shiftGear(up: true)
myCar.shiftGear(up: true)
myCar.shiftGear(up: true)
myCar.shiftGear(up: true)
myCar.shiftGear(up: true)
print(myCar)
