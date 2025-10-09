import UIKit

var requiredSqrroot = 1009

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func calculateSquareroot(_ number: Int) throws -> Int{
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw SquareRootError.noRoot
}

func squareroot(of number: Int) throws -> Int {
    switch number {
    case 1...10000:
        return try calculateSquareroot(number)
    default:
        throw SquareRootError.outOfBounds

    }
}

do {
    try print(squareroot(of: requiredSqrroot))
} catch {
    print("Error: \(requiredSqrroot) caused \(error)")
}
