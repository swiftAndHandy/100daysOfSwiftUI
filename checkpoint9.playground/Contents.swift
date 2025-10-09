import UIKit

func randomElement(integerArray: [Int]?) -> Int {
    return integerArray?.randomElement() ?? Int.random(in: 1...100)
}

print(randomElement(integerArray: nil))
print(randomElement(integerArray: [1, 220, 33, 49, 51]))
