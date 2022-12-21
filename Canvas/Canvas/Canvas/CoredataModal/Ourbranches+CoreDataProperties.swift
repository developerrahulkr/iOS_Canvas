//
//  Ourbranches+CoreDataProperties.swift
//  Canvas
//
//  Created by Rahul Kumar on 15/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//
//

import Foundation
import CoreData


extension Ourbranches {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ourbranches> {
        return NSFetchRequest<Ourbranches>(entityName: "Ourbranches")
    }

    @NSManaged public var taskobject: NSObject?

}
