//
//  Global.swift
//  Canvas
//
//  Created by urmila reddy on 08/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class Global {
    
    static let shared = Global()
    
    //login screen
    var timeoUtOrNot:String!
    var countris: [Country] = []
   
    
    var logoutValue:Int!
    var countrisAll = [[String: Any]]()
    var countrisAllBank = [[String: Any]]()
    var countrisAllFc = [[String: Any]]()
    var countrisAllWU = [[String: Any]]()
    var countrisAllWUAdd = [[String: Any]]()
    var countrisAllBankAdd = [[String: Any]]()
    var countrisAllCashAdd = [[String: Any]]()
    var countrisAllRate = [[String: Any]]()
   
    var countryCurncyAry:NSArray!
    var countryCurncyBankAry:NSArray!
    var countryCurncyCashAry:NSArray!
    
    var logoutHeaderTxt:String!
    
    var loginHeaderTxt:String!
    var userNameTxt: String!
    var paswdText:String!
    var forgotUserNameTxt:String!
    var forgotPswdTxt: String!
    var tryAnotherQuestnTxt: String!
    var verifySecurityImg: String!
    var verifyProceedAfterLogin: String!
    var loginWithFaceIDTxt: String!
    
    var loginBtnTxt:String!
    var signUpBtnTxt:String!
    var orTxt:String!
    var almuzinBottomTxt:String!
    var errorTxtRequired:String!
    var answerPlaceHolderTxt:String!
    var enterQuestnTxt:String!
    
    //Existing customer
    var existingTopHeaderTxt:String!
    var existingCustomrTxt: String!
    var setUpOnlineTxt:String!
    var newCustomerTxt:String!
    var registerWithAlMTxt: String!
    
    //Verify all tabs
    var firstSecndTabHeaderTxt:String!
    var civilIdTxt:String!
    var mobileNumberTxt: String!
    var emailIdTxt:String!
    var firstNameTxt:String!
    var lastNameTxt: String!
    var middleNameTxt: String!
    var thirdTabHeaderTxt:String!
    var createQuestnBtnTxt:String!
    var selectSecureImgTxt :String!
    var iHaveReadAgreeTxt: String!
    var termsConditionBtnTxt: String!
    var showMoreBtnTxt: String!
    
    
    //common
    var verifyBtnTxt:String!
    var backBtnTxt: String!
    var continueBtnTxt: String!
    var submitBtnTxt:String!
    var verifyConfirmPswdTxt:String!
    var verifySubmitBtnTxt:String!
    var nxtBtnTxt: String!
    var commonMonth: String!
    var commonYear: String!
    var importContacts: String!
    var cancelTxt: String!
    var saveTxt: String!
    var updateTxt: String!
    var editTxt: String!
    var removeTxt: String!
    var goTxt: String!
    
    
    
    //Verification pop up
    var verificationHeaderTxt:String!
    var verfiCtnSubTitleTxt:String!
    var codeExpiresTxt: String!
    var verifctnConfirmBtnTxt:String!
    
    //Verifiy online Account
    var verifyOnlineHeaderTxt:String!
    var verifyUsernameTxt:String!
    var verifyPaswdTxt: String!
    
    //new customer
    var newSelectVideoTxt:String!
       var newPreviewVideoTxt:String!
       var newUplodFrntImgeTxt:String!
       var newUplodBckImgTxt:String!
       var newRecordVideoTxt:String!
    
    var enableBiometricTxt: String!
    
    var newCustomerHeader:String!
    var identityTabNameTxt:String!
    var personalTabNameTxt:String!
    var employmentTabNameTxt:String!
    var remitanceTabNameTxt:String!
    
    
    var newCidentityTypeTxt:String!
    var newCidentityNumberTxt:String!
    var newCIdIssueDateTxt:String!
    var newCIdExpiryDateTxt:String!
    var newCCountryOfIsueTxt:String!
    var newCPlaceOfIsueTxt:String!
    
    
    var persnalSalutatnTxt:String!
    var persnalFirstNameTxt:String!
    var persnalmiddleNameTxt:String!
    var persnalLastNameTxt:String!
    var persnalGenderTxt:String!
    var persnalNationlityTxt:String!
    var persnalDobTxt:String!
    var persnalPobTxt:String!
    var persnalPsportNumberTxt:String!
    var persnalPsprtIsueTxt:String!
    var persnalPsprtIsueExpireTxt:String!
    var persnalMobileNumberTxt:String!
    var persnalTelephnTxt:String!
    var persnalEmailIdTxt:String!
    var persnalSecndryEmailTxt:String!
    var persnalMaleTxt:String!
    var persnalFemaleTxt:String!
    var persnalNeutralTxt:String!
    
    
    var acntResidentTypeTxt:String!
    var acntFlatTxt:String!
    var acntFloorTxt:String!
    var acntBuildingTxt:String!
    var acntGadaTxt:String!
    var acntStreetTxt:String!
    var acntblockTxt:String!
    var acntAreaCityTxt:String!
    var acntZipcodeTxt:String!
    var acntStateTxt:String!
    var acntCountryTxt:String!
    var acntRemiterCategryTxt:String!
    var acntPoliticalScopeTxt:String!
    var acntAreYouRelativeTxt:String!
    var acntDegreOfReltnSHipTxt:String!
    var acntRemitIndividualTxt:String!
    var acntRemitPoliticalTxt:String!
    var acntPoliticalLocalTxt:String!
    var acntPoliticalInterntnlTxt:String!
    var acntRelativeYesTxt:String!
    var acntRelativeNoTxt:String!
    var acntDegreCloseTxt:String!
    var acntDegreDistantTxt:String!
    var acntDegreNeutralsTxt:String!
    var pepPositionTxt:String!
    
    
    var ocuptnTxt:String!
    var employNameTxt: String!
    var employeIdTxt:String!
    var employLoctn:String!
    var designtnTxt:String!
    var salaryEmploy:String!
    var otherIncome: String!
    
    var remitTypeOfServiceTxt: String!
    var remitPurposeTransferTxt: String!
    var remitExpctedPerMonthTxt: String!
    var remitExpctedPerYearTxt: String!
    var remitTrnsctnValPerMonthTxt: String!
    var remitTrnsctnValPerYearTxt: String!
    var remitSourceOfIncomeTxt: String!
    var remitAvgYearlyIncomeTxt: String!
    
    var transExpectedCount:String!
    var transExpectedCountMy:String!
    var transExpectedValue:String!
    var transExpectedValueMy:String!
    
    
    var preferLangTxt:String!
    
    var countryIsueDrpText:String!
    var placeIsueDrpTetx:String!
    var preferLangDrpTxt:String!
    var residentDrpTxt:String!
    var salutnDrpTxt:String!
    var stateDrpTxt:String!
    var countryCodeDrpTxt:String!
    var purposeOfTrnsferDrpTxt:String!
    var typeOfServiceDrpTxt:String!
    var sourceOfIncomeDrpTxt:String!
    var occuptnDrpTxt:String!
    
    
    var fromNewExistUser:String!
    
    var recordSelfieVideoTxt:String!
    
    
    
    //After Login
    var afterLoginSecurityImg:String!
    var afterLoginSecurityQuestn:String!
    var afterLoginRegistrtnId:String!
    var afterLoginSecurityQuestnId:Int!
    var afterLoginUserName:String!
    var afterLoginPaswd:String!
    
    
    //Forgot Password
    var forgotPswdUserName:String!
    var forgotPswdCivilId:String!
    var forgotPswdRegstrtnId:String!
    var otpType:Int!
    var forgotPswdMobileNumber:String!
    
    //Beneficiary
    var benefCasBankWu:String!
    
    var firstNameb:String!
    var lastNameb:String!
    var middleNameb:String!
    var address1b:String!
    var address2b:String!
    var cityb:String!
    var stateb:String!
    var postCodeb:String!
    var countryb:String!
    var currencyb:String!
    var mobileb:String!
    var accountNumberb:String!
    var bankCodeb:String!
    var bankNameb:String!
    var branchCodeb:String!
    var branchNameb:String!
    var ifscCodeb:String!
    var swiftCodeb:String!
    var ibanCodeb:String!
    var cnicnob:String!
    
    var beneficiaryHeader:String!
    var beneficiriesHeader:String!
    var beneficiaryDetailsHeader:String!
    var addBenfcryHeader:String!
    var selectBenefType:String!
    var addBank:String!
    var addCash:String!
    var addWesternUnion:String!
    var sendMoneyTxt:String!
    var benefType:String!
    
    //benef List
    var benefListID:String!
    var benefListName:String!
    var benefListCountry:String!
    var benefListMobile:String!
    var benefListTransferMoney:String!
    var benefListDiscount:String!
    var benefListRate:String!
    var benefListCommission:String!
    var benefListTaxCharges:String!
    var benefListNetPayable:String!
    var benefLisTotalAmount:String!
    var benefListdetailsName:String!
    var benefLisdetailsBankname:String!
    var benefListDetailsAcno:String!
    var benefListDetailsBranch:String!
    var benefListDetailsCurrency:String!
    var benefListDetailsSourceOfIncome:String!
    var benefListDetailsDisbursalMode:String!
    var benefListDetailsPurposename:String!
    var benefListDetailsPrincipalAmount:String!
    var benefListDetailsOrigPrincipalAmount:String!
    
    //rate calculator form
    var ratesendReceiveDesc:String!
    var rateDetails:String!
    var rateOriginatorAmount:String!
    var rateConversationDetails:String!
    var rateDestinationAmount:String!
    var rateSenderFee:String!
    var rateGrossTotalAmount:String!
    
    //change paswd screen
    var changeOldPassword: String!
    var changeNewPassword: String!
    
    //feedback screen
    var feedbackName: String!
    var feedbackMobile: String!
    var feedbackEmail: String!
    
    //transactions
    var transactionsShareVoucherTxt: String!
    var transactionsTransferTxt: String!
    var transactionsModeOfTrnsfrTxt: String!
    
    var transactionsList: String!
    var transactionsFilterBy: String!
    var transactionsFromDate: String!
    var transactionsToDate: String!
    var transactionsPeriod: String!
    var transactionsApply: String!
    var transactionsPDFDownload: String!
    var transactionsExcelDownload: String!
    var transactionsRefID: String!
    var transactionsBeneficiaryName: String!
    var transactionsStatus: String!
    var transactionsSourceCurrency: String!
    var transactionsTargetCurrency: String!
    var transactionsTableTotalAmount: String!
    var transactionsCreatedDate: String!
    var transactionsTxnRef: String!
    var transactionsRate: String!
    var transactionsCommission: String!
    var transactionsFCAmount: String!
    var transactionsLCAmount: String!
    var transactionsCurrency: String!
    var transactionsDetailsTotalAmount: String!
    var transactionsDownloadVoucher: String!
    var transactionsQuickSend: String!
    
    //Add beneficiary
    var AddBenefNationality: String!
    var AddBenefDistrict: String!
    var AddBenefIDType: String!
    var AddBenefIDNumber: String!
    var AddBenefRelationBeneficiary: String!
    var AddBenefAccountType: String!
    var AddBenefBranchAddress1: String!
    var AddBenefBranchAddress2: String!
   
    
    //Rate calculator
    var rateCalculatorHeader:String!
    var youSendTxt:String!
    var theyReceiveTxt:String!
    var convertTxt:String!
    var transctnSumary:String!
    var amntToBeReceived:String!
    var conversnRate:String!
    var lcAmnt:String!
    var ratetax:String!
    var totalAmntPayable:String!
    
    //login
    var faqTxt: String!
    var termsConditionsShortTxt: String!
    var branchLoctrtLoginTxt: String!
    
    var countrysChangeAccordingly = "Any"
    
    //Drop downs
    var countryNameData = [String]()
    var countryCodesData = [String]()
    var currencyCodesData = [String]()
    var currencyNameData = [String]()
    var phoneCodesData = [String]()
    var pickerResponseCountryData = [[String: String]]()
    var pickerResponseOnlyCurrencyData = [[String: String]]()
    var pickerResponseFullCurrencyNameData = [[String: String]]()
    
    //Drop downs
    var countryNameDataAll = [String]()
    var countryCodesDataAll = [String]()
    var currencyCodesDataAll = [String]()
    var currencyNameDataAll = [String]()
    var phoneCodesDataAll = [String]()
    var pickerResponseCountryDataAll = [[String: String]]()
    var pickerResponseOnlyCurrencyDataAll = [[String: String]]()
    var pickerResponseFullCurrencyNameDataAll = [[String: String]]()
    
    //Drop downs
    var countryNameDataBank = [String]()
    var countryCodesDataBank = [String]()
    var currencyCodesDataBank = [String]()
    var currencyNameDataBank = [String]()
    var phoneCodesDataBank = [String]()
    var pickerResponseCountryDataBank = [[String: String]]()
    var pickerResponseOnlyCurrencyDataBank = [[String: String]]()
    var pickerResponseFullCurrencyNameDataBank = [[String: String]]()
    
    //Drop downs
    var countryNameDataFc = [String]()
    var countryCodesDataFc = [String]()
    var currencyCodesDataFc = [String]()
    var currencyNameDataFc = [String]()
    var phoneCodesDataFc = [String]()
    var pickerResponseCountryDataFc = [[String: String]]()
    var pickerResponseOnlyCurrencyDataFc = [[String: String]]()
    var pickerResponseFullCurrencyNameDataFc = [[String: String]]()
    
    
    //Drop downs
    var countryNameDataWU = [String]()
    var countryCodesDataWU  = [String]()
    var currencyCodesDataWU  = [String]()
    var currencyNameDataWU  = [String]()
    var phoneCodesDataWU  = [String]()
    var pickerResponseCountryDataWU  = [[String: String]]()
    var pickerResponseOnlyCurrencyDataWU  = [[String: String]]()
    var pickerResponseFullCurrencyNameDataWU  = [[String: String]]()
    
    //Drop downs
    var countryNameDataWUAdd = [String]()
    var countryCodesDataWUAdd = [String]()
    var currencyCodesDataWUAdd = [String]()
    var currencyNameDataWUAdd = [String]()
    var phoneCodesDataWUAdd = [String]()
    var pickerResponseCountryDataWUAdd = [[String: String]]()
    var pickerResponseOnlyCurrencyDataWUAdd = [[String: String]]()
    var pickerResponseFullCurrencyNameDataWUAdd = [[String: String]]()
    
    //Drop downs bank add
    var countryNameDataBankAdd = [String]()
    var countryCodesDataBankAdd = [String]()
    var currencyCodesDataBankAdd = [String]()
    var currencyNameDataBankAdd = [String]()
    var phoneCodesDataBankAdd = [String]()
    var pickerResponseCountryDataBankAdd = [[String: String]]()
    var pickerResponseOnlyCurrencyDataBankAdd = [[String: String]]()
    var pickerResponseFullCurrencyNameDataBankAdd = [[String: String]]()
    
    //Drop downs cash add
    var countryNameDataCashAdd = [String]()
    var countryCodesDataCashAdd = [String]()
    var currencyCodesDataCashAdd = [String]()
    var currencyNameDataCashAdd = [String]()
    var phoneCodesDataCashAdd = [String]()
    var pickerResponseCountryDataCashAdd = [[String: String]]()
    var pickerResponseOnlyCurrencyDataCashAdd = [[String: String]]()
    var pickerResponseFullCurrencyNameDataCashAdd = [[String: String]]()
    
    
    //Rate Pattern countries
    var ratePcountryNameData = [String]()
    var ratePcountryCodesData = [String]()
    var ratePcurrencyCodesData = [String]()
    var ratePcurrencyNameData = [String]()
    var ratePphoneCodesData = [String]()
    var ratePpickerResponseCountryData = [[String: String]]()
    var ratePpickerResponseOnlyCurrencyData = [[String: String]]()
    var ratePpickerResponseFullCurrencyNameData = [[String: String]]()
    
    
    
    var afterLoginSecurityQuestnsList = [String]()
    var afterLoginSecurityIdList = [Int]()
     var afterLoginSecurityIdListString = [String]()
    
    var civilIdNames = [String]()
    var identityTypes = [String]()
    var pickerResponseCivilId = [[String: String]]()
    
    var languageNames = [String]()
    var languageValues = [String]()
    var pickerResponseLanguge = [[String: String]]()
    
    var langNamesList = [String]()
    var langValuesList = [String]()
    var pickerResponseLangugeChange = [[String: String]]()
    
    var residentNames = [String]()
    var residentValues = [String]()
    var pickerResponseResident = [[String: String]]()
    
    var salutationNames = [String]()
    var salutationValues = [String]()
    var pickerResponseSalutation = [[String: String]]()
    
    var occupationNames = [String]()
    var occupationValues = [String]()
    var pickerResponseOccupation = [[String: String]]()
    
    var typeServiceNames = [String]()
    var typeServiceValues = [String]()
    var pickerResponseTypeService = [[String: String]]()
    
    var purposeTransferNames = [String]()
    var purposeTransferValues = [String]()
    var pickerResponsePurposeTransfer = [[String: String]]()
    
    var sourceIncomeNames = [String]()
    var sourceIncomeValues = [String]()
    var pickerResponseSourceIncome = [[String: String]]()
    
    var expectedTxnTypesNames = [String]()
    var expectedTxnTypesValues = [String]()
    var pickerResponseexpectedTxnTypes = [[String: String]]()
    
    
    
    //textfield properties
    
    //Register Screen
    var username_is_required:Bool!
    var username_field_accept:String!
    var username_max_length:Int!
    var username_min_length:Int!
    
    var password_is_required:Bool!
    var password_field_accept:String!
    var password_max_length:Int!
    var password_min_length:Int!
    
    //Existing Account
    var exist_civilID_is_required:Bool!
    var exist_civilID_field_accept:String!
    var exist_civilID_max_length:Int!
    var exist_civilID_min_length:Int!
    
    var exist_mobile_is_required:Bool!
    var exist_mobile_field_accept:String!
    var exist_mobile_max_length:Int!
    var exist_mobile_min_length:Int!
    
    var exist_emailID_is_required:Bool!
    var exist_emailID_field_accept:String!
    var exist_emailID_max_length:Int!
    var exist_emailID_min_length:Int!
    
    var exist_firstName_is_required:Bool!
    var exist_firstName_field_accept:String!
    var exist_firstName_max_length:Int!
    var exist_firstName_min_length:Int!
    
    var exist_lastName_is_required:Bool!
    var exist_lastName_field_accept:String!
    var exist_lastName_max_length:Int!
    var exist_lastName_min_length:Int!
    
    var exist_middleName_is_required:Bool!
    var exist_middleName_field_accept:String!
    var exist_middleName_max_length:Int!
    var exist_middleName_min_length:Int!
    
    var exist_securityQuestion_is_required:Bool!
    var exist_securityQuestion_field_accept:String!
    var exist_securityQuestion_max_length:Int!
    var exist_securityQuestion_min_length:Int!
    
    var exist_answer_is_required:Bool!
    var exist_answer_field_accept:String!
    var exist_answer_max_length:Int!
    var exist_answer_min_length:Int!
    
    
    
    //New User fields validations
    
    
    
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
    
    var otpTypeForBeneficiary:Int!
    
    var editBenefBank:String!
    var editBenefCash:String!
    var editBenefWesternUnion:String!
    
    var feedbckClear:String!
    var feedBckHeader:String!
    var feedbckSubmit:String!
    var feedbckWriteYourFeedback:String!
    var feedbckQuery:String!
    
    var selectedBenefDisabled:String!
    var alreadyExistsTxt:String!
    var username_toolTipTxt:String!
    
   
    var pdfUrl:NSURL!
    var noRecordsFoundTxt:String!
    
    
    
    public func getFieldType(text: String) -> ValueType {
        var textFieldType:ValueType!
        switch text {
        case "alphabet":
            textFieldType = .alphabet
            break
        case "alphabet_with_space":
            textFieldType =  .alphabet_with_space
            break
        case "alphanumeric":
            textFieldType =  .alphanumeric
            break
        case "alphanumeric_with_space":
            textFieldType = .alphanumeric_with_space
            break
        case "numbers":
            textFieldType =  .numbers
            break
        case "numbers_with_space":
            textFieldType =  .numbers_with_space
            break
        case "numbers_with_splchar":
            textFieldType =  .numbers_with_splchar
            break
        case "password_Validation":
            textFieldType =  .password_Validation
            break
        case "any":
            textFieldType =  ValueType.none
            break
            
        default:
            textFieldType = ValueType.none
            break
        }
        return textFieldType
    }
  /*  public String getErrorCode(String messageCode) {

           if (apiMessageCodes.has(messageCode)) {
               try {
                   return apiMessageCodes.getString(messageCode);
               } catch (JSONException e) {
                   e.printStackTrace();
               }
           }

           return null;
       }*/
    
    var messageCodeAry:NSDictionary!
    
    public func messageCodeType(text: String) -> String {
        var messageType = ""
        if text != ""
        {
            messageType =  messageCodeAry[text] as? String ?? ""
            return messageType
        }
        return ""
        
    }
    
   
    
    func convertToAryDictionary(text: String) -> [[String: Any]]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            } catch {
                print(error.localizedDescription)
            }
            
        }
        return nil
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
            
        }
        return nil
    }
    
    var questionAryCount:Int!
    
    //menu labels
    var menuBeneficiary:String!
    var menuChangePaswd:String!
    var menuContact:String!
    var menuDashboard:String!
    var menuFeedback:String!
    var menuMessages:String!
    var menuProfile:String!
    var menuTransactions:String!
    var menuRateAlert:String!
    var menuOffer:String!
    
    var faceIdLockTxt: String!
    
    //hi
    //branch locator
    var lat:String!
    var long:String!
    var branchNameLocator: String!
    var branchAdresLocator: String!
    
    var newUserUserName: String!
    var newUserPaswd: String!
    
    var loginChat: String!
    var ourBranches: String!
    var recentTransctnsLbl: String!
    
    var transactnInsight: String!
       var ratePaternDashboard: String!
       var setAlertDashboard: String!
    var favBenfDashboard: String!
    
    var fromListGrid = ""
    
    var profileTab: String!
    var sampleVideoPathhhh:String!
    var welcomeTxt: String!
    
    var logoutTxt: String!
    
    var toolTipTxt: String!
    
  static var dashBoardGuideView: Bool {
    set {
      UserDefaults.standard.set(true, forKey: "GUIDE_VIEW_DASHBOARD")
    }
    get {
      return UserDefaults.standard.bool(forKey: "GUIDE_VIEW_DASHBOARD")
      
    }
  }
  static var transGuideView: Bool {
    set {
      UserDefaults.standard.set(true, forKey: "GUIDE_VIEW_TRANS")
    }
    get {
      return UserDefaults.standard.bool(forKey: "GUIDE_VIEW_TRANS")
      
    }
  }
  static var benficiaryGuideView: Bool {
    set {
      UserDefaults.standard.set(true, forKey: "GUIDE_VIEW_BENEFICIARY")
    }
    get {
      return UserDefaults.standard.bool(forKey: "GUIDE_VIEW_BENEFICIARY")
      
    }
  }
  static var profileGuideView: Bool {
    set {
      UserDefaults.standard.set(true, forKey: "GUIDE_VIEW_PROFILE")
    }
    get {
      return UserDefaults.standard.bool(forKey: "GUIDE_VIEW_PROFILE")
      
    }
  }
    
    
    
    
    
    var contryNationality:String!
    var lastLoginTxt:String!
   
    var fontReqLbl:UIFont = UIFont(name: "Avenir-Book", size: 12.0)!
    var fontTopLbl:UIFont = UIFont(name: "Avenir-Book", size: 14.0)!
    var fontBottomLbl:UIFont = UIFont(name: "Avenir-Medium", size: 17.0)!
    
    var fontHeader:UIFont = UIFont(name: "Avenir-Medium", size: 16.0)!
    var fontDescription:UIFont = UIFont(name: "Avenir-Medium", size: 14.0)!
    
    
    
     var viewProfileTxt:String!
     var AllQuetnAry:[[String:Any]]!
     var isInvalidTxt:String!
     var uscedfulMailAlert:String!
     var selectVideoFileAlert:String!
     var selectFrontBackFilesAlert:String!
     var selectIdProfDocAlert:String!
     var paswdDoesntMatchAlert:String!
     var sizeLimitOnlyTxtAlert:String!
     var isueExpireSameAlert:String!
     var duplicateSecrtQuestnsAlert:String!
     var answer3QuestnsAlert:String!
     var invalidMobileNumberTxtAlert:String!
     var invalidEmailTxtAlert:String!
     var sendLimit = 10
     var receiveLimit = 15
    
     var digitsAfterDecimal = 3
    
     var proceedTermsCondtnAlertTxt:String!
     var okTxt: String!
    
     var pendingTrnsctnTxt:String!
     var failedTrnsctnTxt: String!
    
    
    var persnalDetlsLbl:String!
    var addresDetlsLbl:String!
    var remitanceDetlsLbl:String!
    var trnsctnReltdDetlsLbl:String!
    
    var showMoreTxt:String!
    var createUserNamePaswd:String!
    
    var minLengthTxtt:String!
    
    var invalidTxt:String!
    
    var aPolticalExposedToolTip:String!
    var isPolticalExposedToolTip:String!
    
    var seeSampleVideoTxt:String!
    var frontTxt:String!
    var backTxt:String!
    var browseTxt:String!
    var recordTxt:String!
    var uploadProfDocmntsTxt:String!
    var uploadCivildIdTxt:String!
    var uploadSelfieVideTxt:String!
    
    var profileReviewTitleLbl:String!
    var profileReviewSubTitleLbl:String!
    
    var benSucesSubtitleTxt:String!
    var confirmCivildIdTxt:String!
    
    var confrmUserToResetPaswd:String!
    
    var transctionByPeriodTxt:String!
    var transactionByDateTxt:String!
    
    var monthTxtt:String!
    var yearTxtt:String!
    
    var sendNowTxt:String!
    var bankTabTxt:String!
    var wuTabTxt:String!
    var indicativeRatesTxt:String!
    
    var yesTxt:String!
    var noTxt:String!
    
    var navTxtForPayment:String!
    
    //voucher related
    var serviceOpted:String!
    var voucherNumber:String!
    var accountNumberVoucher:String!
    var bankNameVoucher:String!
    var branchNameVoucher:String!
    var statusVoucher:String!
    
    var sourceAmntTxtt:String!
    var targetAmntTxtt:String!
    
    var sendEmailTxtt:String!
    var emailIdTxttLbl:String!
    
    var mobileNumberBenfTxt:String!
    var telephneNumbrBenefTxt:String!
    var nationalityBenefTxt:String!
    var districtBenefTxt:String!
    var benefIdTypeTxtt:String!
    var accounttypeTxt:String!
    
    var branchAddress1Txtt:String!
    var branchAddress2Txtt:String!
    
    var remarksTxtt:String!
    
    var occupationToolTip:String!
    var otherIncomeToolTip:String!
    var countOfExpctdTrnsctnToolTip:String!
    var valueOfEpctdTrnsctnToolTip:String!
    var avgYearlyIncomeToolTip:String!
    
    var videoFileToolTip:String!
    var imageFileToolTip:String!
    
    //Guided tour
    var addNewBenfGT:String!
    var addBenefChoiceGT:String!
    var selectBenefTypeGT:String!
    var viewBenedTrnsctTypeGT:String!
    var switchBwnBenefViewsGT:String!
    var toggleBtwenGridCardGT:String!
    var transctnGT:String!
    var initiateTrnsctnGT:String!
    var enableDisableBiometricGT:String!
    var toggleEnbleDiableBioGT:String!
    
    var changePswdGT:String!
    var switchTabChngePswdGT:String!
    var editProfileGT:String!
    var clickOnEditPrfileGT:String!
    var recentTrnsctnsGT:String!
    var clickOnPerticrTrnsctnGT:String!
    
    var favBenefGT:String!
    var favBenefDescptnGT:String!
    var rateCalctrGT:String!
    var calcltnDoneBasedOnGT:String!
    var transctnsGt:String!
    var switchBtwnTabTrnsctnFilterGT:String!
    var trnsctnByPeriodGT:String!
    var filterTrnsctnByPeriodGT:String!
    var downloadTrnsctnsGT:String!
    var downldTrnsctnSeltdPeriodGT:String!
    
    //beneficiaries
    var addBeneficiaryTxt:String!
    var editBeneficiryTxt:String!
  
    var alertNotToResetTxt = "Changing language during data entry will clear the existing forms"
    
    var remiterInactiveDashboard:String!
    var remiterInactiveBeneficiary:String!
    var remiterInactiveTrnsctn:String!
    
    var securityimglblOne:String!
    var securityimglblTwo:String!
    var securityimglblThree:String!
    
    var newPswdConfrmSameTxt:String!
    var pswdConfrmSameTxt:String!
    
    var hasNumber: String!
    var hasCapitalCase: String!
    var hasSmallCase: String!
    var hasSpecialCharacters: String!
    var restQuestnsTxt: String!
    var resetTxt: String!
    var foreignCurncyTxt: String!
    var fcSourceOrTarget: String!
    
    var plsContctAdminOtp: String!
    var enterOtpAlrdyExists: String!
    
    var biometricNormalLogin: String!
    
    var securityQuestnsReset: String!
    var versionLbl: String!
    var benAdded:String!
    var menuRateThisAppString: String!
    var featureAddedSoonTxt: String!
    var fraudPopUpDirectWu: String!
    var fraudRemovePopUpWu: String!
    var transfersTxtTab: String!
    
    var smsTxt: String!
    var emailTxt: String!
    
    var mtcnn: String!
    var ttNumbr: String!
    
    var selectYourQuestnTxt: String!
    var createYourOwnQuestnTxt: String!
    var finalCountSecurityQuestn: String!
    var firstTimeStr = "first"

    
    var acceptTermsCondtnsAlert: String!
    var localCurncyTxt: String!
    var foreignLcCurncyTxt: String!
    var fromWuBankCashRate = "Any"
    
    
    var securityVerfictnTxt: String!
    var showLessTxt: String!
    
    var favBenfTxt: String!
    var unfavBenefTxt: String!
    var enableBenefTxt: String!
    var disableBenefTxt: String!

    
    
    var refreshOrNot = "no"
    var onlyThresholdTxt: String!
   
    
    var sessionTimedOutTxt: String!
    
    var changeLangeHeaderTxt = ""
    var changeLangSubTitleTxt: String!
    
    var guidedTour1: String!
    var guidedTour2: String!
    var guidedTour3: String!
    var guidedTour4: String!
    var guidedTour5: String!
    var guidedTour6: String!
    var guidedTour7: String!
    var guidedTour8: String!
    var guidedTour9: String!
    var guidedTour10: String!
    var guidedTour11: String!
    var guidedTour12: String!
    var guidedTour13: String!
    var guidedTour14: String!
    var guidedTour15: String!
    var guidedTour16: String!
    var guidedTour17: String!
    var guidedTour18: String!
    var guidedTour19: String!
    var guidedTour20: String!
    var guidedTour21: String!
    var guidedTour22: String!
    var guidedTour23: String!
    var guidedTour24: String!
    var guidedTour25: String!
    var guidedTour26: String!
    var guidedTour27: String!
    var guidedTour28: String!
    
    var thresholdValueTxt: String!
    
    
    //new variables added
    var securityAnswerTxt: String!
    var enterOtpTxt: String!
    var selectSecurityImg: String!
    var sameFileUploadTxt: String!
    var repetFailedPendingTxt: String!
    var repeatTxt: String!
    
    
    var identityDetlsTxt: String!
    var employmntDetlsTxt: String!
    var editProfileTxt: String!
    
    var oneMonthTxt: String!
    var threeMonthTxt: String!
    var sixMonthTxt: String!
    var oneYearTxt: String!
    
    var profileDetlsTxt: String!
    var bankDetlsTxt: String!
    
    var youCantCreateAnthrQuestnTxt: String!
    var fileTxt: String!
    var selectOptionTxt: String!
    var alrdySelFrntBckFiles: String!
    var remveFrntImgToUpNewOne: String!
    var remveBckImgToUpNewOne: String!
    var alrdySelctdVideo: String!
    var benefDatNotAvailble: String!
    var chngDataDuringEntryForm: String!
    var cameraTxt: String!
    var galryTxt: String!
    
    var pendingTxt: String!
    var sucessTxt: String!
    var editTxtt: String!
    var favTxtt: String!
    var retailTxt: String!
    
    
    var lowTxt: String!
    var mediumTxt: String!
    var highTxt: String!
    var strongTxt: String!
    var answerTxt: String!
    var viewOnGoogleMapTxt: String!
    
    
    var employmntToolTip: String!
    
    var deleteTxt: String!
    var doneTxt: String!
    var failedTxt: String!
    var cancelleddTxt: String!
    var youPauOnlyyTxt: String!
   
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()

        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)

            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    
   /* var publicKeyStr = "iub286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159"
    
    var hmacResult2: String = self.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: "iib286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159")*/
    
    var publicKeyStr = "iub286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159"
    var privateKeyStr = "iib286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159"
    
   
    
    
    func languageChangeActn() {
        let pickerData = Global.shared.pickerResponseLangugeChange
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            let langcode = "\(value)"
            if langcode == "en" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
               
            }
            else if langcode == "ar" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
           
            }
            else if langcode == "hi" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "hi")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
               
            }
            else if langcode == "ml" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "ml")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
               
            }
            else if langcode == "fil" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "fil")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
               
            }
            else {
                print("no language")
            }
           
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = storyboard.instantiateInitialViewController()
    }
    }
    
    
}

class TimerApplication: UIApplication {

    // the timeout in seconds, after which should perform custom actions
    // such as disconnecting the user
    private var timeoutInSeconds: TimeInterval {
        // 2 minutes
      //  return  0.5 * 60
        return 15 * 60
    }

    private var idleTimer: Timer?

    // resent the timer because there was user interaction
    private func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }

        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds,
                                         target: self,
                                         selector: #selector(TimerApplication.timeHasExceeded),
                                         userInfo: nil,
                                         repeats: false
        )
    }

    // if the timer reaches the limit as defined in timeoutInSeconds, post this notification
    @objc private func timeHasExceeded() {
        NotificationCenter.default.post(name: .appTimeout,
                                        object: nil
        )
    }

    override func sendEvent(_ event: UIEvent) {

        super.sendEvent(event)

        if idleTimer != nil {
            self.resetIdleTimer()
            
        }

        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
    }
}
extension Notification.Name {

    static let appTimeout = Notification.Name("appTimeout")

}
