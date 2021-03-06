//
//  Expense+CoreDataClass.swift
//  Expenses
//
//  Created by Jeffrey Freet on 4/27/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, amount: Double, date: Date?) {
        let appDelagate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelagate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Expense.entity(), insertInto: managedContext)
        
        self.name = name
        self.amount = amount
        self.date = date
        
    }
}
