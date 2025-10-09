import UIKit

class Animal {
    
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    
}

class Dog: Animal {
    
    init(legAmount: Int = 4) {
        super.init(legs: legAmount)
    }
    
    func speak() {
        print("Barking.")
    }
    
}

class Cat: Animal {
    
    let isTame: Bool
    
    init(legAmount: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legAmount)
    }
    
    func speak() {
        print("Maaah.")
    }
    
}

class Corgi: Dog {
    override func speak() {
        print("Wuff!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Wau!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Miau!")
        
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}


let corgi = Corgi()
let poodle = Poodle()
let persian = Persian(isTame: true)
let lion = Lion(isTame: false)

corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
