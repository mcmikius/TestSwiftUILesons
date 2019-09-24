//
//  Person+CoreDataProperties.swift
//  SwiftUICoreData
//
//  Created by Mykhailo Bondarenko on 24.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        
        let request = NSFetchRequest<Person>(entityName: "Person")
        let sortDescriptor = NSSortDescriptor(key: "isFavorite", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var photoData: Data?
    @NSManaged public var gender: String?
    @NSManaged public var age: String?

}
