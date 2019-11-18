//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


class Human {
    var name: String
    
    func tellAboutMe() -> String {
        return "Hello! My name is \(name)"
    }
    init(name: String) {
        self.name = name
    }
}

class Child: Human {
    var toy = "Hourse"
    
    override func tellAboutMe() -> String {
        let originalText = super.tellAboutMe()
        return originalText + " And I have a toy \(self.toy)"
    }
    init(toy: String, name: String) {
        self.toy = toy
        super.init(name: name)
    }
    override init(name: String) {
        self.toy = "Hummer"
        super.init(name: name)
    }
}

let child = Child(name: "Kira")
child.tellAboutMe()
child.name
child.toy

let child1 = Child(toy: "Dinosaur", name: "Max")
child1.tellAboutMe()
