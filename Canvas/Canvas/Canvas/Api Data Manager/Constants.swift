//
//  Constants.swift
//  Canvas
//
//  Created by urmila reddy on 08/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//


import Foundation
import UIKit

struct CanvasUrls
{
    
    // For UAT
        //static let baseUrl = "http://online-uat.muzaini.com:81/api/"
        //static let baseurl_payment = "http://online-uat.muzaini.com:83/"
    
    // For Staging
//        static let baseUrl =  "http://online-uat.muzaini.com:8075/api/"
//        static let baseurl_payment = "http://online-uat.muzaini.com:8076/"
    
    // For Live
        static let baseUrl =  "https://online1.muzaini.com/api/"
        static let baseurl_payment = "https://online1.muzaini.com/"
    
    static let versionNumber = "1.0"
    
    static let checkHashing =  "/default/hashtest"
    static let languagesList = "/amec/getlanguages"
    static let loginLanguage =  "/amec/language"
    static let login = "/user/login"
    static let loginVerification = "/user/verifylogin"
    static let fcRateCalculator = "/beneficiary/fcratecalculator"
    static let verifyMobile = "/user/verifymobile"
    static let verifyEmail = "/user/verifyemail"
    static let verifyCivildId = "/user/verifycivilid"
    static let verifyEmailId = "/user/verifyemailid"
    static let generateOtp = "/user/generateotp"
    static let verifyOtp = "/user/verifyotp"
    static let verifyAcnt = "/user/verifyaccount"
    static let generateSecurityQuestions = "/user/securityquestion"
    static let accountConfig = "/amec/registrationconfigs"
    static let existUserFinalApi = "/user/createexistuser"
    static let forgotUserName = "/user/forgetusername"
    static let forgotPaswd = "/user/forgotpassword"
    static let forgotPaswd2 = "/user/forgotpassword2"
    static let resetPaswd = "/user/resetpassword"
    static let otpResetPaswd = "/user/otpresetpassword"
    static let newUserFinalApi = "/user/createnewuser"
    static let civilIdDobApi = "/user/verifydobcivilid"
    static let faq = "/amec/faq"
    static let termsConditions = "/amec/termsandconditions"
    static let benefBankTransfer = "/beneficiary/addbeneficiary/bank"
    static let benefCashTransfer = "/beneficiary/addbeneficiary/cash"
    static let benefWesternUnionTransfer = "/beneficiary/addbeneficiary/wu"
    static let benefGenerateOtp = "/beneficiary/otp/beneficiary"
    static let benefValidateOtp = "/beneficiary/verifyotp/beneficiary"
    static let getBeneficiaries = "/beneficiary/getbeneficiaries"
    static let favouriteBeneficiary = "/beneficiary/favourite"
    static let benefRate2Calculator = "/beneficiary/rate2calculator"
    static let benefPostTransaction = "/beneficiary/posttransaction"
    static let benefApproveTransctn = "/beneficiary/approvetransaction"
 // static let benefTransctnStatus = "/beneficiary/gettransaction"
    static let benefTransctnStatus = "/beneficiary/gettransactiondetails"
    static let benefConfigs = "/beneficiary/beneficiaryconfigs"
    static let benefTransctnFilter = "/beneficiary/transactionfilter"
    static let benefDownloadTransctnPdf = "/beneficiary/downloadtransaction"
    static let benefDownloadVoucherPdf = "/beneficiary/downloadvoucher"
    static let benefSendEmailVoucher = "/beneficiary/sharevoucher"
    static let benefWuRateCalculator = "/beneficiary/wuratecalculator"
    static let benefWuPostTransaction = "/beneficiary/wuposttransaction"
    static let rateCalculator = "/beneficiary/ratecalculator"
    static let ttRateCalculator = "/beneficiary/ttratecalculator"
    static let addBenefImg = "/beneficiary/beneficiaryimage"
    static let videoUpload = "/amec/upload"
    static let branchesLocator = "/amec/branches"
    static let updateProfile = "/profile/userprofileimage"
    static let profileChangePassword = "/profile/changepassword"
    static let getProfileDetails = "/profile/profiledetails"
    static let updateProfileDetails = "/profile/profileupdate"
    static let profileFeedback = "/profile/feedback"
    static let profileConfigs = "/profile/profileconfigs"
    static let getCivilDetail = "/usercivilidupdate/civilidprofiledetails"
    static let updateCivilId = "/usercivilidupdate/civilidupdate"
    //Biometric Related
    static let enableBiometricProfile = "/profile/updatebiometric"
    static let checkBiometricEnabled = "/user/getbiometricstatus"
    static let biometricLogin = "/user/biometriclogin"
    static let biometricVerifyLogin = "/user/biometricverifylogin"
    static let verifySecrityQuestnsOtp = "/profile/verifysecurityquestionsotp"
    static let resetSecrityQuestns = "/profile/restsecurityquestions"
    static let countrysList = "/amec/countries"
    static let appVersionControl = "/amec/ipapkversion"
    static let stateList = "/amec/states"
    static let cityList = "/amec/cities"
    static let deleteBeneficiary = "/beneficiary/deletebeneficiary"
    static let loginTrack = "/user/userlogintrack"
    static let contactUs = "/amec/contactus"
    static let addRateAlert = "/profile/addratealert"
    static let getRateAlert = "/profile/getratealerts"
    static let deleteRateAlert = "/profile/deleteratealerts"
    static let occupationDrpDwn = "/amec/occupations"
    static let barChartData = "/profile/transactioninsights"
    static let lineChartData = "/profile/getratepattern"
    static let verifyUserName = "/user/verifyisvalidusername"
    static let enableDisableBenef = "/beneficiary/disablebeneficiary"
    static let preLoginOffers = "/offers/preLoginOffers"
    static let postLoginOffers = "/offers/postLoginOffers"
    static let getOffersList = "/offers/offersList"
    
    static let siteUnderManti = "/SiteUnderMaintenance/getSiteUnderMain"
    static let gethelpAndTips = "/user/GetHelpAndTipsList"
    static let preLoginHelpTips = "/user/PreLoginGetHelpVideos"
    
    static let channelException = "/channelexception/channelexception"
    static let benefVisaDirectTransfer = "/beneficiary/addbeneficiary/visadirect"
    static let getSessionID = "/beneficiary/getSessionID"
    static let transactionEnquiry = "/transactionenquiry/TransactionEnquiryGet"
    static let fxBookingTransectionEnquiry = "/fxbooking/fctransactionenquiry"
    
    static let getfxbookinaddress = "/fxbooking/getfxbookingaddress"
    static let addfxbookingaddress = "/fxbooking/addfxbookingaddress"
    static let updatefxbookingaddress = "/fxbooking/updatefxaddress"
    static let deletefxbookingaddress = "/fxbooking/deletefxaddress"
    
    static let getfxbookingbranchlist = "/fxbooking/fxbranches"
    static let getfxbookingdatelist = "/fxbooking/getselecteddate"
    static let getfxbookingratecalculator = "/fxbooking/fcrate2calculator"
    static let getfxsessionid = "/fxbooking/getSessionID"
    static let createfxtransaction = "/fxbooking/createfctransaction"
    static let fxBookingDetails = "/fxbooking/fxbookingdetails"
    static let fxsharefxvoucher = "/fxbooking/sharefxvoucher"
    static let downloadfxvoucher = "/fxbooking/downloadfxvoucher"
    static let get_user_branch_details_url = "/fxbooking/getuserbranchdetails"
    static let add_user_branch = "/fxbooking/adduserbranch"
    static let latest_news_url = "/newsevent/latestnews"
    static let all_news_url = "/newsevent/allnews"
    static let fxbookingTimeSlotURL = "/fxbooking/fxtimeslot"
    static let branchDeleteAddressURL = "/fxbooking/deleteuserbranch"


}

//headers
let CONTENTTYPE = "Content-Type"

let APPLICATIONJSON = "application/json"

let APPLICATIONNAME = ""

//SotryBoard

let MAIN_STORYBOARD: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)



postfix operator %

postfix func % ( percentage: Int) -> Double {
    
    return Double(percentage) / 100
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



struct Images {
  static var eyeOpen: UIImage? = {
    if #available(iOS 13.0, *) {
      return UIImage(systemName: "eye")
    } else {
      return UIImage(named: "eye_open")
    }
 //   return UIImage(named: "eye_open")
  }()
  static var eyeClose: UIImage? = {
    if #available(iOS 13.0, *) {
      return UIImage(systemName: "eye.slash")
    } else {
      return UIImage(named: "eye_close")
    }
   // return UIImage(named: "eye_close")
  }()
  static var person: UIImage? = {
     if #available(iOS 13.0, *) {
       return UIImage(systemName: "person")
     } else {
       return UIImage(named: "defaultProfile")
     }
  //  return UIImage(named: "defaultProfile")
   }()
  
  static var star: UIImage? = {
     if #available(iOS 13.0, *) {
       return UIImage(systemName: "star")
     } else {
       return UIImage(named: "fav-ben-grey")
     }
  //  return UIImage(named: "fav-ben-grey")
   }()
  static var starFill: UIImage? = {
    if #available(iOS 13.0, *) {
      return UIImage(systemName: "star.fill")
    } else {
      return UIImage(named: "star.fill")
    }
  //  return UIImage(named: "starRed")
  }()
  static var stopCircleFill: UIImage? = {
     if #available(iOS 13.0, *) {
       return UIImage(systemName: "stop.circle.fill")
     } else {
       return UIImage(named: "circleChecked")
     }
  //  return UIImage(named: "circleChecked")
   }()
  
  static var circle: UIImage? = {
     if #available(iOS 13.0, *) {
       return UIImage(systemName: "circle")
     } else {
       return UIImage(named: "circleUnchecked")
     }
   // return UIImage(named: "circleUnchecked")
   }()
}
