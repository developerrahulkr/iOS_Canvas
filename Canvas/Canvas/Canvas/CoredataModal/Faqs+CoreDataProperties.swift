//
//  Faqs+CoreDataProperties.swift
//  
//
//  Created by Prankur on 14/12/22.
//
//

import Foundation
import CoreData


extension Faqs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Faqs> {
        return NSFetchRequest<Faqs>(entityName: "Faqs")
    }


}
