//
//  Instructor+CoreDataProperties.swift
//  Relationships
//
//  Created by Jena Grafton on 11/17/15.
//  Copyright © 2015 Fahir Mehovic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Instructor {

    @NSManaged var lastName: String?
    @NSManaged var name: String?
    @NSManaged var course: NSSet?

}
