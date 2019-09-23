//
//  Order.swift
//  WithoutCoreDataWebinarSix
//
//  Created by Mykhailo Bondarenko on 23.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

public class Order: NSManagedObject, Identifiable {
    @NSManaged public var drink: String
    @NSManaged public var createdAt: Date
}

extension Order {
    static func getAllOrders() -> NSFetchRequest<Order> {
        let request: NSFetchRequest<Order> = Order.fetchRequest() as! NSFetchRequest<Order>
        let sortDescriptor = NSSortDescriptor(key: "drink", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
