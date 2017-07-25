//
//  EntryController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    func create(_ entry: Entry) {
        saveEntry()
    }
    
    func delete(_ entry: Entry) {
        entry.managedObjectContext?.delete(entry)
        saveEntry()
    }
    
    func saveEntry() {
        try? CoreDataStack.context.save()
    }
    
}
