//
//  Friend+CoreDataProperties.swift
//  PetPal
//
//  Created by Mykhailo Bondarenko on 30.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var dob: Date?
    @NSManaged public var eyeColor: NSObject?

}
