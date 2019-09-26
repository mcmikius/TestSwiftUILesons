//
//  Category+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Mykhailo Bondarenko on 26.09.2019.
//  Copyright © 2019 Shawn Moore. All rights reserved.
//
//

import Foundation
import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    var expenses: [Expense]? {
        return self.rawExpenses?.array as? [Expense]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard  let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        self.init(entity: Category.entity(), insertInto: context)
        self.title = title
    }

}
