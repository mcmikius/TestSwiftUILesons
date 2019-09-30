//
//  Friend+CoreDataClass.swift
//  PetPal
//
//  Created by Mykhailo Bondarenko on 30.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


public class Friend: NSManagedObject {

    
    var age: Int {
        if let dob = dob as Date? {
            return Calendar.current.dateComponents([.year], from: dob, to: Date()).year!
        }
        return 0
    }
}
