import UIKit
import Foundation

class Rectangular {
    let height: Int
    let width: Int
    let depth: Int
    
    var volume: Int {
        return height * width * depth
    }
    
    init(height: Int, width: Int, depth: Int) {
        self.height = height
        self.width = width
        self.depth = depth
    }
}

let rect = Rectangular(height: 10, width: 12, depth: 13)
rect.volume

class Person {
    var name: String
    var secondName: String
    var fullName: String {
        get {
            return name + " " + secondName
        }
        set(anotherNewValue) {
            let array = anotherNewValue.components(separatedBy: " ")
            name = array[0]
            secondName = array[1]
        }
    }
    init(name: String, secondName: String) {
        self.name = name
        self.secondName = secondName
    }
    
}

let person = Person(name: "Michail", secondName: "Bondarenko")
person.fullName

person.name
person.secondName

person.fullName = "Kira Nightly"
person.name
person.secondName
