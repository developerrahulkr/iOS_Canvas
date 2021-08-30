//
//  ProfileDetails.swift
//  Canvas
//
//  Created by urmila reddy on 08/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
class ProfileDetails {
    
    static let shared = ProfileDetails()
    
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
    
    var countryName:String!
    
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
    
    
    var CountOfExpectedTxn:String!
    var CountOfExpectedTxnMY:String!
    var ValueForExpectedTxn:String!
    var ValueForExpectedTxnMY:String!
    
    var new_identityType_is_required:Bool!
    
    var new_identityId_is_required:Bool!
    var new_identityId_field_accept:String!
    var new_identityId_max_length:Int!
    var new_identityId_min_length:Int!
    
    var new_identityIssueDate_is_required:Bool!
    
    var new_identityExpiryDate_is_required:Bool!
    
    var new_identityCountryIssue_is_required:Bool!
    
    var new_identityPlaseIssue_is_required:Bool!
    var new_identityPlaseIssue_field_accept:String!
    var new_identityPlaseIssue_max_length:Int!
    var new_identityPlaseIssue_min_length:Int!
    
    var new_preferredLanguage_is_required:Bool!
    
    var new_salutation_is_required:Bool!
    
    
    var new_firstName_is_required:Bool!
    var new_firstName_field_accept:String!
    var new_firstName_max_length:Int!
    var new_firstName_min_length:Int!
    
    var new_middleName_is_required:Bool!
    var new_middleName_field_accept:String!
    var new_middleName_max_length:Int!
    var new_middleName_min_length:Int!
    
    var new_lastName_is_required:Bool!
    var new_lastName_field_accept:String!
    var new_lastName_max_length:Int!
    var new_lastName_min_length:Int!
    
    var new_nationality_is_required:Bool!
    
    var new_dob_is_required:Bool!
    
    var new_placeOfBirth_is_required:Bool!
    var new_placeOfBirth_field_accept:String!
    var new_placeOfBirth_max_length:Int!
    var new_placeOfBirth_min_length:Int!
    
    var new_mobileNumber_is_required:Bool!
    var new_mobileNumber_field_accept:String!
    var new_mobileNumber_max_length:Int!
    var new_mobileNumber_min_length:Int!
    
    var new_telephone_is_required:Bool!
    var new_telephone_field_accept:String!
    var new_telephone_max_length:Int!
    var new_telephone_min_length:Int!
    
    var new_emailId_is_required:Bool!
    var new_emailId_field_accept:String!
    var new_emailId_max_length:Int!
    var new_emailId_min_length:Int!
    
    var new_secndryEmailId_is_required:Bool!
    var new_secndryEmailId_field_accept:String!
    var new_secndryEmailId_max_length:Int!
    var new_secndryEmailId_min_length:Int!
    
    var new_residentType_is_required:Bool!
    
    var new_flat_is_required:Bool!
    var new_flat_field_accept:String!
    var new_flat_max_length:Int!
    var new_flat_min_length:Int!
    
    var new_floor_is_required:Bool!
    var new_floor_field_accept:String!
    var new_floor_max_length:Int!
    var new_floor_min_length:Int!
    
    var new_building_is_required:Bool!
    var new_building_field_accept:String!
    var new_building_max_length:Int!
    var new_building_min_length:Int!
    
    var new_gada_is_required:Bool!
    var new_gada_field_accept:String!
    var new_gada_max_length:Int!
    var new_gada_min_length:Int!
    
    var new_street_is_required:Bool!
    var new_street_field_accept:String!
    var new_street_max_length:Int!
    var new_street_min_length:Int!
    
    var new_block_is_required:Bool!
    var new_block_field_accept:String!
    var new_block_max_length:Int!
    var new_block_min_length:Int!
    
    var new_areaCity_is_required:Bool!
    var new_areaCity_field_accept:String!
    var new_areaCity_max_length:Int!
    var new_areaCity_min_length:Int!
    
    var new_zipCode_is_required:Bool!
    var new_zipCode_field_accept:String!
    var new_zipCode_max_length:Int!
    var new_zipCode_min_length:Int!
    
    var new_state_is_required:Bool!
    var new_state_field_accept:String!
    var new_state_max_length:Int!
    var new_state_min_length:Int!
    
    var new_countryCode_is_required:Bool!
    
    var new_remitterCategory_is_required:Bool!
    
    var new_politicalScope_is_required:Bool!
    
    var new_PEPPosition_is_required:Bool!
    var new_PEPPosition_field_accept:String!
    var new_PEPPosition_max_length:Int!
    var new_PEPPosition_min_length:Int!
    
    var new_politicalExposedPerson_is_required:Bool!
    
    var new_RelationshipPEP_is_required:Bool!
    
    var new_occupation_is_required:Bool!
    
    var new_employerName_is_required:Bool!
    var new_employerName_field_accept:String!
    var new_employerName_max_length:Int!
    var new_employerName_min_length:Int!
    
    var new_employerID_is_required:Bool!
    var new_employerID_field_accept:String!
    var new_employerID_max_length:Int!
    var new_employerID_min_length:Int!
    
    var new_employerLocation_is_required:Bool!
    var new_employerLocation_field_accept:String!
    var new_employerLocation_max_length:Int!
    var new_employerLocation_min_length:Int!
    
    var new_employerDesigntn_is_required:Bool!
    var new_employerDesigntn_field_accept:String!
    var new_employerDesigntn_max_length:Int!
    var new_employerDesigntn_min_length:Int!
    
    var new_salary_is_required:Bool!
    var new_salary_field_accept:String!
    var new_salary_max_length:Int!
    var new_salary_min_length:Int!
    
    var new_otherIncome_is_required:Bool!
    var new_otherIncome_field_accept:String!
    var new_otherIncome_max_length:Int!
    var new_otherIncome_min_length:Int!
    
    var new_typeOfService_is_required:Bool!
    
    var new_purposeOfTransfer_is_required:Bool!
    
    var new_expectedTransctnPerMonth_is_required:Bool!
    var new_expectedTransctnPerMonth_field_accept:String!
    var new_expectedTransctnPerMonth_max_length:Int!
    var new_expectedTransctnPerMonth_min_length:Int!
    
    var new_expectedTransctnPerYear_is_required:Bool!
    var new_expectedTransctnPerYear_field_accept:String!
    var new_expectedTransctnPerYear_max_length:Int!
    var new_expectedTransctnPerYear_min_length:Int!
    
    var new_trnsctnValuePerMonth_is_required:Bool!
    var new_trnsctnValuePerMonth_field_accept:String!
    var new_trnsctnValuePerMonth_max_length:Int!
    var new_trnsctnValuePerMonth_min_length:Int!
    
    var new_trnsctnValuePerYear_is_required:Bool!
    var new_trnsctnValuePerYear_field_accept:String!
    var new_trnsctnValuePerYear_max_length:Int!
    var new_trnsctnValuePerYear_min_length:Int!
    
    var new_CountOfExpectedTxn_is_required:Bool!
    var new_CountOfExpectedTxn_field_accept:String!
    var new_CountOfExpectedTxn_max_length:Int!
    var new_CountOfExpectedTxn_min_length:Int!
    
    
    var new_ValueForExpectedTxn_is_required:Bool!
    var new_ValueForExpectedTxn_field_accept:String!
    var new_ValueForExpectedTxn_max_length:Int!
    var new_ValueForExpectedTxn_min_length:Int!
    
    
    var new_sourceOfIncome_is_required:Bool!
    
    var new_avgYearlyIncome_is_required:Bool!
    var new_avgYearlyIncome_field_accept:String!
    var new_avgYearlyIncome_max_length:Int!
    var new_avgYearlyIncome_min_length:Int!
    
}
