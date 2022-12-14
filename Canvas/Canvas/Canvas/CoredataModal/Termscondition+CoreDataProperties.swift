//
//  Termscondition+CoreDataProperties.swift
//  
//
//  Created by Prankur on 14/12/22.
//
//

import Foundation
import CoreData


extension Termscondition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Termscondition> {
        return NSFetchRequest<Termscondition>(entityName: "Termscondition")
    }

    @NSManaged public var taskobject: NSObject?

}
