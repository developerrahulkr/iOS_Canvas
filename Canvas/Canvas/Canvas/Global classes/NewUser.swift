//
//  NewUser.swift
//  Canvas
//
//  Created by urmila reddy on 25/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
class NewUser {
    
    static let shared = NewUser()
    
    //Identity
    var identityType:String!
    var identityId:String!
    var identityIssueDate:String!
    var identityExpireDate:String!
    var identityCountryIsuue:String!
    var identityPlaceIsue:String!
    
    //Personal
    var preferredLang:String!
    var residentType:String!
    var salutation:String!
    var firstName:String!
    var middleName:String!
    var lastName:String!
    var dob:String!
    var placeOfBirth:String!
    var nationality:String!
    var flat:String!
    var floor:String!
    var building:String!
    var gada:String!
    var street:String!
    var block:String!
    var city:String!
    var state:String!
    var country:String!
    var mobile:String!
    var telephone:String!
    var zipcode:String!
    
    var email:String!
    
    var secondryEmail:String!
    var gender:String!
    var remitterCategry:String!
    var politicalScope:String!
    var pepPosition:String!
    var isPoliticallyExposed:String!
    var relationshipPEP:String!
    
    //Employment
    var occupation:String!
    var employerName:String!
    var employeeID:String!
    var employLocation:String!
    var designation:String!
    var salary:String!
    var otherIncome:String!
    
    //Remittance
    var serviceType:String!
    var purpose:String!
    var expectedMonth:String!
    var expectedYear:String!
    var transationMonth:String!
    var transationYear:String!
    var incomeSource:String!
    var averageIncome:String!
    
    //For video image pdf
    var DocumentFrontSide:String!
    var DocumentFrontSideExtension:String!
    var DocumentBackSide:String!
    var DocumentBackSideExtension:String!
    var videoUrl:NSURL!
    
    var CountOfExpectedTxn:String!
    var CountOfExpectedTxnMY:String!
    var ValueForExpectedTxn:String!
    var ValueForExpectedTxnMY:String!
    
    
    
    //new user
    var dateDobMaximum:Date!
    
}
