//
//  BeneficiaryDetails.swift
//  Canvas
//
//  Created by urmila reddy on 28/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
class BeneficiaryDetails {
    
    static let shared = BeneficiaryDetails()
    
    var voucherMsg = ""
    
    var enableOrDisable:Bool!
    var beneficiaryId:Int!
    var firstName:String!
    var lastName:String!
    var middleName:String!
    var address1:String!
    var address2:String!
    var city:String!
    var state:String!
    var stateCode:String!
    var cityCode:String!
    var postCode:String!
    var country:String!
    var currency:String!
    var mobile:String!
    var accountNumber:String!
    var bankCode:String!
    var bankName:String!
    var branchCode:String!
    var branchName:String!
    var ifscCode:String!
    var swiftCode:String!
    var ibanCode:String!
    var cnicno:String!
    
     var countryName:String!
    
    
    var rate:String!
    var commisionAmnt:String!
    var netLcAmnt:String!
    var fc:String!
    var lc:String!
    var calcType:String!
    
    var sourceCurrenyCode:String!
    var targetCurencyCode:String!
    var txnRefNo:String!
    
    
    var abaRouteCode:String!
    var agentID:String!
    var agentName:String!
    var benID:String!
    var beneficiaryType:Int!
    var beneficiaryTypeName:String!

    var branchAddress1:String!
    var branchAddress2:String!
    var branchCity:String!
    var branchState:String!
    var defaultPurposeCode:String!
    var defaultPurposeName:String!
    var disbursalMode:String!
    var disbursalModeName:String!
    var fcMaxAmount:String!
    var fcMinAmount:String!
    var nationality:String!
    var referenceId:String!
    var remID:String!
    var remarks:String!
    var sourceOfIncome:String!
    var telePhone:String!
    var txnRef:String!
    
    var conversionRate:String!
    var destinationPrincipalAmount:String!
    var grossTotalAmount:String!
    var originatorsPrincipalAmount:String!
    var senderFee:String!
    
    var sendAmount:String!
    
    var quickSend:String!
    
    var lcAmntQuickSend:Double!
    
    var contactFirstName = ""
    var contactMobileNumber = ""
    var contactLastName = ""
    var contactMiddleName = ""
    
    
    var bank_FirstName_is_required:Bool!
    var bank_FirstName_field_accept:String!
    var bank_FirstName_max_length:Int!
    var bank_FirstName_min_length:Int!
    
    var bank_LastName_is_required:Bool!
    var bank_LastName_field_accept:String!
    var bank_LastName_max_length:Int!
    var bank_LastName_min_length:Int!
    
    var bank_MiddleName_is_required:Bool!
    var bank_MiddleName_field_accept:String!
    var bank_MiddleName_max_length:Int!
    var bank_MiddleName_min_length:Int!
    
    var bank_Mobile_is_required:Bool!
    var bank_Mobile_field_accept:String!
    var bank_Mobile_max_length:Int!
    var bank_Mobile_min_length:Int!
    
    var bank_Telephone_is_required:Bool!
    var bank_Telephone_field_accept:String!
    var bank_Telephone_max_length:Int!
    var bank_Telephone_min_length:Int!
    
    var bank_Nationality_is_required:Bool!
    
    var bank_Address1_is_required:Bool!
    var bank_Address1_field_accept:String!
    var bank_Address1_max_length:Int!
    var bank_Address1_min_length:Int!
    
    var bank_Address2_is_required:Bool!
    var bank_Address2_field_accept:String!
    var bank_Address2_max_length:Int!
    var bank_Address2_min_length:Int!
    
    var bank_District_is_required:Bool!
    var bank_District_field_accept:String!
    var bank_District_max_length:Int!
    var bank_District_min_length:Int!
    
    var bank_City_is_required:Bool!
    var bank_City_field_accept:String!
    var bank_City_max_length:Int!
    var bank_City_min_length:Int!
    
    var bank_State_is_required:Bool!
    var bank_State_field_accept:String!
    var bank_State_max_length:Int!
    var bank_State_min_length:Int!
    
    var bank_PostCode_is_required:Bool!
    var bank_PostCode_field_accept:String!
    var bank_PostCode_max_length:Int!
    var bank_PostCode_min_length:Int!
    
    var bank_Country_is_required:Bool!
    
    var bank_Currency_is_required:Bool!
    
    var bank_BeneficiaryIdType_is_required:Bool!
    
    var bank_BeneficiaryIdNumber_is_required:Bool!
    var bank_BeneficiaryIdNumber_field_accept:String!
    var bank_BeneficiaryIdNumber_max_length:Int!
    var bank_BeneficiaryIdNumber_min_length:Int!
    
    var bank_BeneficiaryRelationship_is_required:Bool!
    var bank_BeneficiaryRelationship_field_accept:String!
    var bank_BeneficiaryRelationship_max_length:Int!
    var bank_BeneficiaryRelationship_min_length:Int!
    
    var bank_BankName_is_required:Bool!
    var bank_BankName_field_accept:String!
    var bank_BankName_max_length:Int!
    var bank_BankName_min_length:Int!
    
    var bank_BranchName_is_required:Bool!
    var bank_BranchName_field_accept:String!
    var bank_BranchName_max_length:Int!
    var bank_BranchName_min_length:Int!
    
    var bank_AccountType_is_required:Bool!
    
    var bank_IFSCCode_is_required:Bool!
    var bank_IFSCCode_field_accept:String!
    var bank_IFSCCode_max_length:Int!
    var bank_IFSCCode_min_length:Int!
    
    var bank_SWIFTCode_is_required:Bool!
    var bank_SWIFTCode_field_accept:String!
    var bank_SWIFTCode_max_length:Int!
    var bank_SWIFTCode_min_length:Int!
    
    var bank_CNICNO_is_required:Bool!
    var bank_CNICNO_field_accept:String!
    var bank_CNICNO_max_length:Int!
    var bank_CNICNO_min_length:Int!
    
    var bank_IBANCode_is_required:Bool!
    var bank_IBANCode_field_accept:String!
    var bank_IBANCode_max_length:Int!
    var bank_IBANCode_min_length:Int!
    
    var bank_AccountNumber_is_required:Bool!
    var bank_AccountNumber_field_accept:String!
    var bank_AccountNumber_max_length:Int!
    var bank_AccountNumber_min_length:Int!
    
    var bank_BranchAddress1_is_required:Bool!
    var bank_BranchAddress1_field_accept:String!
    var bank_BranchAddress1_max_length:Int!
    var bank_BranchAddress1_min_length:Int!
    
    var bank_BranchAddress2_is_required:Bool!
    var bank_BranchAddress2_field_accept:String!
    var bank_BranchAddress2_max_length:Int!
    var bank_BranchAddress2_min_length:Int!
    
    var bank_BranchCode_is_required:Bool!
    var bank_BranchCode_field_accept:String!
    var bank_BranchCode_max_length:Int!
    var bank_BranchCode_min_length:Int!
    
    var bank_Remarks_is_required:Bool!
    var bank_Remarks_field_accept:String!
    var bank_Remarks_max_length:Int!
    var bank_Remarks_min_length:Int!
    
    var cash_Remarks_is_required:Bool!
    var cash_Remarks_field_accept:String!
    var cash_Remarks_max_length:Int!
    var cash_Remarks_min_length:Int!
    
    var cash_FirstName_is_required:Bool!
    var cash_FirstName_field_accept:String!
    var cash_FirstName_max_length:Int!
    var cash_FirstName_min_length:Int!
    
    var cash_LastName_is_required:Bool!
    var cash_LastName_field_accept:String!
    var cash_LastName_max_length:Int!
    var cash_LastName_min_length:Int!
    
    var cash_MiddleName_is_required:Bool!
    var cash_MiddleName_field_accept:String!
    var cash_MiddleName_max_length:Int!
    var cash_MiddleName_min_length:Int!
    
    var cash_Mobile_is_required:Bool!
    var cash_Mobile_field_accept:String!
    var cash_Mobile_max_length:Int!
    var cash_Mobile_min_length:Int!
    
    var cash_Telephone_is_required:Bool!
    var cash_Telephone_field_accept:String!
    var cash_Telephone_max_length:Int!
    var cash_Telephone_min_length:Int!
    
    var cash_Nationality_is_required:Bool!
    
    var cash_Address1_is_required:Bool!
    var cash_Address1_field_accept:String!
    var cash_Address1_max_length:Int!
    var cash_Address1_min_length:Int!
    
    var cash_Address2_is_required:Bool!
    var cash_Address2_field_accept:String!
    var cash_Address2_max_length:Int!
    var cash_Address2_min_length:Int!
    
    var cash_District_is_required:Bool!
    var cash_District_field_accept:String!
    var cash_District_max_length:Int!
    var cash_District_min_length:Int!
    
    var cash_City_is_required:Bool!
    var cash_City_field_accept:String!
    var cash_City_max_length:Int!
    var cash_City_min_length:Int!
    
    var cash_State_is_required:Bool!
    var cash_State_field_accept:String!
    var cash_State_max_length:Int!
    var cash_State_min_length:Int!
    
    var cash_PostCode_is_required:Bool!
    var cash_PostCode_field_accept:String!
    var cash_PostCode_max_length:Int!
    var cash_PostCode_min_length:Int!
    
    var cash_Country_is_required:Bool!
    
    var cash_Currency_is_required:Bool!
    
    var cash_BeneficiaryIdType_is_required:Bool!
    
    var cash_AccountNumber_is_required:Bool!
    var cash_AccountNumber_field_accept:String!
    var cash_AccountNumber_max_length:Int!
    var cash_AccountNumber_min_length:Int!
    
    
    var cash_BeneficiaryIdNumber_is_required:Bool!
    var cash_BeneficiaryIdNumber_field_accept:String!
    var cash_BeneficiaryIdNumber_max_length:Int!
    var cash_BeneficiaryIdNumber_min_length:Int!
    
    var cash_BeneficiaryRelationship_is_required:Bool!
    var cash_BeneficiaryRelationship_field_accept:String!
    var cash_BeneficiaryRelationship_max_length:Int!
    var cash_BeneficiaryRelationship_min_length:Int!
    
    var cash_BankName_is_required:Bool!
    var cash_BankName_field_accept:String!
    var cash_BankName_max_length:Int!
    var cash_BankName_min_length:Int!
    
    var cash_BranchName_is_required:Bool!
    var cash_BranchName_field_accept:String!
    var cash_BranchName_max_length:Int!
    var cash_BranchName_min_length:Int!
    
    var cash_AccountType_is_required:Bool!
    
    var cash_IFSCCode_is_required:Bool!
    var cash_IFSCCode_field_accept:String!
    var cash_IFSCCode_max_length:Int!
    var cash_IFSCCode_min_length:Int!
    
    var cash_SWIFTCode_is_required:Bool!
    var cash_SWIFTCode_field_accept:String!
    var cash_SWIFTCode_max_length:Int!
    var cash_SWIFTCode_min_length:Int!
    
    var cash_CNICNO_is_required:Bool!
    var cash_CNICNO_field_accept:String!
    var cash_CNICNO_max_length:Int!
    var cash_CNICNO_min_length:Int!
    
    var cash_IBANCode_is_required:Bool!
    var cash_IBANCode_field_accept:String!
    var cash_IBANCode_max_length:Int!
    var cash_IBANCode_min_length:Int!
    
    var cash_BranchAddress1_is_required:Bool!
    var cash_BranchAddress1_field_accept:String!
    var cash_BranchAddress1_max_length:Int!
    var cash_BranchAddress1_min_length:Int!
    
    var cash_BranchAddress2_is_required:Bool!
    var cash_BranchAddress2_field_accept:String!
    var cash_BranchAddress2_max_length:Int!
    var cash_BranchAddress2_min_length:Int!
    
    var cash_BranchCode_is_required:Bool!
    var cash_BranchCode_field_accept:String!
    var cash_BranchCode_max_length:Int!
    var cash_BranchCode_min_length:Int!
    
    var wu_FirstName_is_required:Bool!
    var wu_FirstName_field_accept:String!
    var wu_FirstName_max_length:Int!
    var wu_FirstName_min_length:Int!
    
    var wu_LastName_is_required:Bool!
    var wu_LastName_field_accept:String!
    var wu_LastName_max_length:Int!
    var wu_LastName_min_length:Int!
    
    var wu_MiddleName_is_required:Bool!
    var wu_MiddleName_field_accept:String!
    var wu_MiddleName_max_length:Int!
    var wu_MiddleName_min_length:Int!
    
    var wu_City_is_required:Bool!
    
    
    var wu_State_is_required:Bool!
    
    var wu_Country_is_required:Bool!
    
    var wu_Currency_is_required:Bool!
    
    
    var beneficiaryIDTypesNameData = [String]()
    var beneficiaryIDTypesValueData = [String]()
    var pickerbeneficiaryIDTypesData = [[String: String]]()
    
    var beneficiaryRltnNameData = [String]()
    var beneficiaryRltnValueData = [String]()
    var pickerbeneficiaryRltnData = [[String: String]]()
    
    var bankAccountTypesNameData = [String]()
    var bankAccountTypesValueData = [String]()
    var pickerbankAccountTypesData = [[String: String]]()
    
    
    var createdDatee:String!
    var sourceTotalAmnt: String!
    var targetTotalAmnt: String!
    
    var transctnStatusText: String!
    var transctnStatusInt: Int!
    
    var countryCode: String!
    
    
    
    
    var directTransferWu: String!
    var beneficiaryImg: String!
    
    var purposeList: [BeneficiaryPurposeData] = []
    
    var targetCurncyFulName: String!
    
    var westernUnionProfileImg = ""
    
    var mtcn: String!
    var ttRefNottn: String!
    
    var refreshOrNot = "no"
    
    var remitterEmail = ""
    
    var isRetail  = false
    
    var beneficaryBankFilteredResponse = [Any]()
    var beneficaryCashFilteredResponse = [Any]()
    var beneficaryWuFilteredResponse = [Any]()
    
    
}
