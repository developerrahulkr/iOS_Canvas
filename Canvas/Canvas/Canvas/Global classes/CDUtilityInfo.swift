//
//  CDUtilityInfo.swift
//  Canvas
//
//  Created by Rahul Kumar on 15/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import Foundation
import CoreData


class CDUtilityInfo {
    
    static let shared = CDUtilityInfo()
//  MARK: - ContactUs data Save
    
    func saveContactData(obj : NSObject) {
        let contaxt = ContactUs(context: PersistantStorage.shared.context)
        contaxt.taskobject = obj
        PersistantStorage.shared.saveContext()
    }
    
//  MARK: - Term And Condition data Save
    func saveTermAndConditionData(obj : NSObject) {
        let contaxt = Termscondition(context: PersistantStorage.shared.context)
        contaxt.taskobject = obj
        PersistantStorage.shared.saveContext()
    }
    
//  MARK: - Our Branches data Save
    func saveOurBrenchesData(obj : NSObject) {
        let contaxt = Ourbranches(context: PersistantStorage.shared.context)
        contaxt.taskobject = obj
        PersistantStorage.shared.saveContext()
    }
    
//  MARK: - FAQ data Save
        func saveFAQData(obj : NSObject) {
            let contaxt = Faqs(context: PersistantStorage.shared.context)
            contaxt.faqData = obj
            PersistantStorage.shared.saveContext()
        }
    
    
//MARK: - Fetch Data
//    MARK: - contact us data featch
    @discardableResult
    func getAllContactData() -> ContactUs? {
            let fetchData = NSFetchRequest<ContactUs>(entityName: "ContactUs")
            do {
                let result = try PersistantStorage.shared.context.fetch(fetchData).first
                return result
            }catch let error {
                print(error.localizedDescription)
            }
            return nil
        }
    
    
//    MARK: - Term And Condition data featch
        @discardableResult
        func getAllTermAndCondition() -> [Termscondition]? {
                let fetchData = NSFetchRequest<Termscondition>(entityName: "Termscondition")
                do {
                    let result = try PersistantStorage.shared.context.fetch(fetchData)
                    return result
                }catch let error {
                    print(error.localizedDescription)
                }
                return []
            }
    
    
    //    MARK: - Our Branches data featch
        @discardableResult
        func getAllOurBrenches() -> Ourbranches? {
                let fetchData = NSFetchRequest<Ourbranches>(entityName: "Ourbranches")
                do {
                    let result = try PersistantStorage.shared.context.fetch(fetchData).first
                    return result
                }catch let error {
                    print(error.localizedDescription)
                }
                return nil
            }
    
    
    //    MARK: - Our Branches data featch
        @discardableResult
        func getAllFAQData() -> Faqs? {
                let fetchData = NSFetchRequest<Faqs>(entityName: "Faqs")
                do {
                    let result = try PersistantStorage.shared.context.fetch(fetchData).first
                    return result
                }catch let error {
                    print(error.localizedDescription)
                }
                return nil
            }
}
