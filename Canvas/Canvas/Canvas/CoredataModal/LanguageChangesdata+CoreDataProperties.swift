//
//  LanguageChangesdata+CoreDataProperties.swift
//  
//
//  Created by Rahul Kumar on 21/12/22.
//
//

import Foundation
import CoreData


extension LanguageChangesdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LanguageChangesdata> {
        return NSFetchRequest<LanguageChangesdata>(entityName: "LanguageChangesdata")
    }

    @NSManaged public var languageData: NSObject?

}
