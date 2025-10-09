import UIKit

//for number in 1...100 {
//    print("\(number) -> \(fizzBuzz(number: number))")
//}

count(to:3)

func fizzBuzz(number: Int) -> String {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        return "FizzBuzz"
    } else if number.isMultiple(of: 3) {
        return "Fizz"
    } else if number.isMultiple(of: 5) {
        return "Buzz"
    } else {
        return "\(number)"
    }
}

func count(to: Int) {
    print ("I'm counting:")
    for i in 1...to {
        print("\(i)")
    }
}

func buyCar(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        return
    }
    
}

buyCar(price: 300000)
