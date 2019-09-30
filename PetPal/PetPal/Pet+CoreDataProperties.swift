//
//  Pet+CoreDataProperties.swift
//  PetPal
//
//  Created by Mykhailo Bondarenko on 30.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var name: String
    @NSManaged public var kind: String
    @NSManaged public var picture: Data?
    @NSManaged public var dob: Date?
    @NSManaged public var owner: Friend

}
