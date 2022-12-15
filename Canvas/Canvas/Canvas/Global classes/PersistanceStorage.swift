//
//  PersistanceStorage.swift
//  Canvas
//
//  Created by Rahul Kumar on 15/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import Foundation
import CoreData

class PersistantStorage {
    
    init(){}
    static let shared = PersistantStorage()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Canvas")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var context = persistentContainer.viewContext

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetchManagedObject<T: NSManagedObject>(manageObject: T.Type) -> [T]? {
        
        do {
            guard let result = try PersistantStorage.shared.context.fetch(manageObject.fetchRequest()) as? [T] else {return nil}
            return result
            
        }catch let error {
            print(error)
        }
        return nil
    }
}

