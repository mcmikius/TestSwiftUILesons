
import Foundation
import UIKit

class Car {
    let products: Int
    let people: Int
    let pets: Int
    class var selfWeight: Int { return 1500 }
    class var maxWeight: Int { return 2000 }
    
    var totalWeight: Int {
        return products + people + pets + Car.selfWeight
    }
    init(products: Int, people: Int, pets: Int) {
        self.products = products
        self.people = people
        self.pets = pets
    }
}

let car = Car(products: 30, people: 300, pets: 50)
let maxWeight = Car.maxWeight
let carWeight = Car.selfWeight
let totalWeight = car.totalWeight
if maxWeight < totalWeight {
    print("You can't drive decause car is overloaded: \(totalWeight - maxWeight) ")
} else {
    print("You can drive!")
}

