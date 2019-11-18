
import Foundation

protocol Human {
    var name: String { get }
}

protocol Driver {
    
    var car: Bool { get }
    var license: Bool { get }
    
    func toDrive() -> Bool
    
}

extension Driver {
    var car: Bool { return true }
    var license: Bool { return true }
    var name: String {
        return "Victor"
    }
    
    func toDrive() -> Bool {
        return true
    }
}

extension FirmDriver: Driver {

    var license: Bool {
    return false
    }
}

class FirmDriver {
    
}


let firmDriver = FirmDriver()
firmDriver.license
