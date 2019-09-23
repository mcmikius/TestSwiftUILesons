import UIKit
import Combine

enum ExampleError: Swift.Error {
    case somethingWrong
}

let weatherPublisher = PassthroughSubject<Int, ExampleError>()

let subscriber = weatherPublisher.filter( {
    $0 > 15
}).sink(receiveCompletion: { print($0)}) { (value) in
    print("Today temperature \(value) ºC")
}

weatherPublisher.send(23)
weatherPublisher.send(12)
weatherPublisher.send(32)
weatherPublisher.send(completion: Subscribers.Completion<ExampleError>.failure(ExampleError.somethingWrong))
weatherPublisher.send(16)
