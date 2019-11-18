//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)

class Human {
    var name: String
    var age: Int?
    var hairs: Bool
    
    func description() -> String {
        if let humanAge = age {
            return "Hello! My name is \(name) and I'am \(humanAge) years old!"
        } else {
            return "Hello! My name is \(name)!"
        }
        
    }
    init() {
        name = "Ivan"
        hairs = true
    }
    init(name: String, age: Int?, hairs: Bool){
        self.name = name
        self.age = age
        self.hairs = hairs
    }
}

let human = Human()
human.age
human.name
human.hairs
let human1 = Human(name: "Michail", age: nil, hairs: true)
