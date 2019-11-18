
import Foundation
import UIKit

struct Site {
    var siteName = "SwiftBook.ru"
    let visitsToday = 1000
    let visitsYesterday = 1000
    
    var visitsTommorow: Int {
        return (visitsToday + visitsYesterday) / 2
    }
    lazy var someLazyProperty = 1 + 2
    
    func description() -> String {
        return "We had \(visitsYesterday) visitors yesterday. Today we have \(visitsToday) visitors. Tomorrow we will have about \(visitsTommorow) visitors."
    }
}

let firstWebSite = Site()
//func changeSiteName(site: Site) -> Site {
//    //var site = site
//    site.siteName = "iphonecoder.ru"
//    return site
//}

//changeSiteName(site: firstWebSite)
firstWebSite.siteName

let secondWebSite = Site()
let thirdWebSite = firstWebSite

//if firstWebSite === thirdWebSite {
//    print("===")
//} else {
//    print("not!")
//}
