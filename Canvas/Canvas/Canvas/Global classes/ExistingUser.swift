//
//  ExistingUser.swift
//  Canvas
//
//  Created by urmila reddy on 21/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation

class ExistingUser {
    
    static let shared = ExistingUser()
    
    //Existing Customer
    var civilidExtCustApi:String!
    var mobileNumbExtCustApi:String!
    var emailIdExtCustApi:String!
    
    //DataFromVerifyAccount for second tab
    var civildId:String!
    var emailId:String!
    var firstName:String!
    var lastName:String!
    var middleName:String!
    var mobileNumber:String!
    
    //Questions & answers
    var firstQuestn:String!
    var firstAnswer:String!
    var secndQuestn:String!
    var secndAnswer:String!
    var userQuestion:String!
    var userAnswer:String!
    var imgSelected:String!
    
    var numberOfQuestions:String!
    
    
    //For all tabs data
    var accountNo:String!
    var address1:String!
    var address2:String!
    var averageYearIncome:String!
    var bankName:String!
    var block:String!
    var branchName:String!
    var building:String!
    var city:String!
    var civilID:String!
    var countOfExpectedTxn:String!
    var countOfExpectedTxn_MY:String!
    var country:String!
    var countryCode:String!
    var countryOfBirth:String!
    var dateOfBirth:String!
    var designation:String!
    var doesIDExpiry:String!
  
    var employerLocation:String!
    var employerName:String!
    
   
    var flat:String!
    var floor:String!
    var gada:String!
    var gender:String!
    var idExpiryDate:String!
    var idIssueDate:String!
    var idIssuer:String!
    var identityCountryIssue:String!
    var identityId:String!
    var identityPlaseIssue:String!
    var identityType:String!
    var isPoliticallyExposed:String!
    
    
    var mobile:String!
    var nationality:String!
    var occupation:String!
    var otherIncome:String!
    var pepPosition:String!
    var placeOfBirth:String!
    var politicalScope:String!
    var postCode:String!
    var preferredLanguage:String!
    var purpose:String!
    
    var purposeOfTrasnfer:String!
    var relationshipPEP:String!
    var remID:String!
    var remexpdate:String!
    var remitterCategory:String!
    var remitterCode:String!
    var remitterstatus:String!
    var residentType:String!
    var salary:String!
    var salutation:String!
    
    var sourceOfIncome:String!
    var state:String!
    var status:String!
    var street:String!
    var telephone:String!
    var typeOfService:String!
    var valueForExpectedTxn:String!
    var valueForExpectedTxn_MY:String!
    
}
