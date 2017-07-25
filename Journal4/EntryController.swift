//
//  EntryController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class EntryController {
    
    
    // CRUD
    
    
    // R: READ
    let sharedInstance = EntryController()
    
    func create(_ entry: Entry) {
        
    }
    
    func delete(_ entry: Entry) {
        try? CoreDataStack.context.delete(entry)
    }
    
    func saveEntry() {
        try? CoreDataStack.context.save()
    }
    
    func loadEntry() {
        
    }
    
}
