import Foundation
import UIKit

func sayHello() -> () {
    print("Hello")
}
sayHello()

func oneParam(param: Int) {
    var param = param
    param += 1
}

oneParam(param: 10)

func returnValue() -> Int {
    let c = 10
    return c
}

let a = returnValue()
a

func giveMeYour(name: String, andSecondName: String) -> String {
    return "Your full name is \(name) \(andSecondName)"
}
giveMeYour(name: "Michail", andSecondName: "Bondarenko")

func calcMoneyIn(array: [Int]) -> Int {
    var sum = 0
    func sayMoney() {
        print(sum)
    }
    for item in array {
        sum += item
    }
    sayMoney()
    return sum
}

calcMoneyIn(array: [1, 2, 3, 4, 5])


func findSum(ofIntegers integers: Int...) -> Int {
    var sum = 0
    for item in integers {
        sum += item
    }
    return sum
}

findSum(ofIntegers: 1, 2, 3, 4, 5, 6)
/*
 func sum(_: Int) -> int {
 return 10
 }
 */
func whatToDo(missed: Bool) -> (Int) -> Int {
    func missCountUp(input: Int) -> Int { return input + 1}
    func missCountDown(input: Int) -> Int { return input - 1}
    return missed ? missCountUp : missCountDown
}

var missedCount = 0
missedCount = whatToDo(missed: true)(missedCount)
missedCount = whatToDo(missed: false)(missedCount)
