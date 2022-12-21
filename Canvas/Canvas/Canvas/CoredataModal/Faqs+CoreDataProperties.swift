//
//  Faqs+CoreDataProperties.swift
//  Canvas
//
//  Created by Rahul Kumar on 15/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//
//

import Foundation
import CoreData


extension Faqs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Faqs> {
        return NSFetchRequest<Faqs>(entityName: "Faqs")
    }

    @NSManaged public var faqData: NSObject?

}
