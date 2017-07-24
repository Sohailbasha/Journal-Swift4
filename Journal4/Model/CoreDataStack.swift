//
//  CoreDataStack.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Journal4")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext }
}


