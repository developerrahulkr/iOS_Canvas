//
//  ContactUs+CoreDataProperties.swift
//  
//
//  Created by Prankur on 14/12/22.
//
//

import Foundation
import CoreData


extension ContactUs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactUs> {
        return NSFetchRequest<ContactUs>(entityName: "ContactUs")
    }

    @NSManaged public var taskobject: NSObject?

}
