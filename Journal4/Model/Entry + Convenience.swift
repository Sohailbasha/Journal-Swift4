//
//  Entry + Convenience.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import CoreData


extension Entry {
    convenience init?(title: String, bodyText: String, timeStamp: Date, context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}
