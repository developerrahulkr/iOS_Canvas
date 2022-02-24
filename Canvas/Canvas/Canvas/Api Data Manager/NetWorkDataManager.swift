//
//  NetWorkDataManager.swift
//  Canvas
//
//  Created by urmila reddy on 08/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetWorkDataManager {
    
    static let sharedInstance = NetWorkDataManager()
    
  /*  let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
    
    let headersHmac: HTTPHeaders = ["x-publickey" : Global.shared.publicKeyStr, "x-client": hmacResult2, "x-hash" : ""]*/
    
  //  let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
 //   var headersWithAuthorization: HTTPHeaders
    lazy var headersWithAuthorization: HTTPHeaders = {

        let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
        var headers = HTTPHeaders()
        if let authToken = UserDefaults.standard.string(forKey: "token") {
            headers  = [.authorization(bearerToken: authToken)]

                headers["x-publickey"] = Global.shared.publicKeyStr
                headers["x-client"] = hmacResult2
                headers["x-hash"] = ""

            }

            return headers
        }()
    
    func setTokenValue()
    {
        let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
        var headers = HTTPHeaders()
        if let authToken = UserDefaults.standard.string(forKey: "token") {
            headers  = [.authorization(bearerToken: authToken)]
            
                headers["x-publickey"] = Global.shared.publicKeyStr
                headers["x-client"] = hmacResult2
                headers["x-hash"] = ""
                
            }

           headersWithAuthorization = headers
    }
    
    
    
    lazy var headers: HTTPHeaders = {
       var headers = HTTPHeaders()
       let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
       headers = ["x-publickey" : Global.shared.publicKeyStr, "x-client": hmacResult2, "x-hash" : ""]

       return headers

     }()
    
    //Language code implementation
    func languageChangeImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber +  CanvasUrls.loginLanguage
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Faq code implementation
    func faqImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber +  CanvasUrls.faq
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //terms & implementation
    func termsConditionsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber +  CanvasUrls.termsConditions
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Login to your account
    func loginImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.login
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Login Verification
    func loginVerificationImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.loginVerification
        
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Verify Mobile
    func verifyMobileImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyMobile
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Verify Email
    func verifyEmailImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyEmail
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    
    //Generate OTP
    func generateOtpImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.generateOtp
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //languages list implementation
    func langugesListImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.languagesList
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Showing branches in maps
    func branchLocatorImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.branchesLocator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Verify OTP
    func verifyOtpImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyOtp
        
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Verify Account
    func verifyAccountImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyAcnt
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Verify CivilId
    func verifyCivilIdImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyCivildId
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Verify EmailId
    func verifyEmailIdImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyEmailId
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Verify Username
       func verifyUsernameImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifyUserName
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headers).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    //enable disable beneficiary
    func enableDisableBenefImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.enableDisableBenef
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Generate security questions
    func generateSecurityQuestionsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.generateSecurityQuestions
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Account configuration
    func accountConfigsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.accountConfig
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //exist user creation
    func existUserCreationImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.existUserFinalApi
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //new user creation
    func newUserCreationImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.newUserFinalApi
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Forget username
    func forgotUsernameImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.forgotUserName
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Forget Password
    func forgotPaswdImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.forgotPaswd
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Forget Password2
    func forgotPaswdTwoImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.forgotPaswd2
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Reset Password
    func resetPaswdImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.otpResetPaswd
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary Bank Transfer
    func benefBankTransferImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefBankTransfer
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary cash Transfer
    func benefCashTransferImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefCashTransfer
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary western union transfer
    func benefWesternUnionTransferImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefWesternUnionTransfer
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary generate otp
    func benefGenerateOtpImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefGenerateOtp
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary validate otp
    func benefValidateOtpImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefValidateOtp
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary list
    func benefGetListImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        print(headersWithAuthorization)
        
//        let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
//        var headers = HTTPHeaders()
//        if let authToken = UserDefaults.standard.string(forKey: "token") {
//            headers  = [.authorization(bearerToken: authToken)]
//
//                headers["x-publickey"] = Global.shared.publicKeyStr
//                headers["x-client"] = hmacResult2
//                headers["x-hash"] = ""
//
//            }
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.getBeneficiaries
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    // prelogin Help Video
    func preLogingetHelpAndTips(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
        {
            
            let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.preLoginHelpTips
      //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
            print(apiUlr)
            print(postParameters)
            
            AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                JSONEncoding.default, headers: headers).responseJSON
                { response in
                    
                    let completion = self.dealWithDictResponse(response: response)
                    completionHandler(completion.0, completion.1)
            }
        }
    
    // Get Help Video
    func getHelpAndTips(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
        {
            
            let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.gethelpAndTips
      //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
            print(apiUlr)
            print(postParameters)
            
            AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                JSONEncoding.default, headers: headersWithAuthorization).responseJSON
                { response in
                    
                    let completion = self.dealWithDictResponse(response: response)
                    completionHandler(completion.0, completion.1)
            }
        }
    
    //Favourite Beneficiary
    func benefFavouriteImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.favouriteBeneficiary
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary rate 2 calculator
    func benefRate2CalculatorImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefRate2Calculator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary post transaction
    func benefPostTransctnImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefPostTransaction
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary wu rate calculator
    func benefWuRateCalculatorImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefWuRateCalculator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary wu post transaction
    func benefWuPostTransctnImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefWuPostTransaction
        
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary approve transaction
    func benefApproveTransctnImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefApproveTransctn
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary approve transaction
    func toCheckIpAdressImplimentation(headersTobePassed : HTTPHeaders,completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = "http://online-uat.muzaini.com:81/api/1.0/default/ipaddress"
        
        AF.request(apiUlr, method: .get, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary transcation status
    func benefTrnsctnStatusImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefTransctnStatus
        print(apiUlr)
        print(postParameters)
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary transcation status
       func benefImgImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.addBenefImg
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headersWithAuthorization).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    
    //Beneficiary configs
    func benefConfigsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefConfigs
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Default hashing
       func checkingHashImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.checkHashing
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headers).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    //Civild Id Dob Validation
          func civildDobValidationImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
          {
              
              let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.civilIdDobApi
              
              AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                  JSONEncoding.default, headers: headers).responseJSON
                  { response in
                      
                      let completion = self.dealWithDictResponse(response: response)
                      completionHandler(completion.0, completion.1)
              }
          }
    
    //Beneficiary transaction filter
    func benefTransctnFilterImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
       
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefTransctnFilter
        print(apiUlr)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary transaction pdf/excel
    func benefTransctnPdfImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefDownloadTransctnPdf
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Beneficiary voucher pdf
    func benefVoucherPdfImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefDownloadVoucherPdf
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Beneficiary voucher send email
    func benefVoucherSendEmailImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.benefSendEmailVoucher
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Countries
    func countryListImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.countrysList
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Check VersionControl
func appVersionControl(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.appVersionControl
  //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
        print(apiUlr)
        print(postParameters)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    func getOfferList(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
        {
            
            let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.getOffersList
      //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
            print(apiUlr)
            print(postParameters)
            
            AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                JSONEncoding.default, headers: headers).responseJSON
                { response in
                    
                    let completion = self.dealWithDictResponse(response: response)
                    completionHandler(completion.0, completion.1)
            }
        }
    func preLoginOffer(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
        {
            
            let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.preLoginOffers
      //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
            print(apiUlr)
            print(postParameters)
            
            AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                JSONEncoding.default, headers: headers).responseJSON
                { response in
                    
                    let completion = self.dealWithDictResponse(response: response)
                    completionHandler(completion.0, completion.1)
            }
        }
    func postLoginOffer(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
        {
            
            let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.postLoginOffers
      //  let apiUlr = "http://online-uat.muzaini.com:89/api/1.0/amec/ipapkversion"
            print(apiUlr)
            print(postParameters)
            
            AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                JSONEncoding.default, headers: headers).responseJSON
                { response in
                    
                    let completion = self.dealWithDictResponse(response: response)
                    completionHandler(completion.0, completion.1)
            }
        }
    
    //States
    func stateListImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.stateList
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Cities
    func cityListImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.cityList
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    // Get Site Under Maintenance Id
    func SiteUnderMantImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.siteUnderManti
   //  let apiUlr = "http://online-uat.muzaini.com:82/api/SiteUnderMaintenance/getSiteUnderMain"
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    // Get Civil Id
    func civilIdDetailsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.getCivilDetail
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    // Update Civil Id
    func civilIdUpdateImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.updateCivilId
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //delete beneficiary
    func deleteBeneficiaryImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.deleteBeneficiary
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //login track
    func loginTrackImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.loginTrack
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Rate Calculator
    func rateCalculatorImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.rateCalculator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //TT Rate Calculator
    func ttRateCalculatorImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.ttRateCalculator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Profile pic update
    func profilePicytureImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.updateProfile
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Profile change password
    func profileChangePaswdImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.profileChangePassword
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Get profile details
    func profileDetailsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.getProfileDetails
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Update profile details
    func updateProfileDetailsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.updateProfileDetails
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Profile enable faceId
    func enableFaceidInProfileImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.enableBiometricProfile
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Profile Feedback
    func profileFeedbackImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.profileFeedback
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //Profile Configs
    func profileConfigsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.profileConfigs
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headersWithAuthorization).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    //ContactUs
    func contactUsImplimentation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.contactUs
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Check Biometric enabled or not
    func checkBiometricEnabledStatusImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.checkBiometricEnabled
        print(apiUlr)
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Login with biometric
    func loginWithBiometricImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.biometricLogin
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //verify With  biometric
    func verifyLoginbiometricImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.biometricVerifyLogin
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //verify security questions otp implementations
    func verifySecurityQuestnsOtpImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.verifySecrityQuestnsOtp
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //verify reset security questions
    func resetSecurityQuestnsImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.resetSecrityQuestns
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //FC Rate calculator
    func fcRateCalculatorImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
    {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.fcRateCalculator
        
        AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
            JSONEncoding.default, headers: headers).responseJSON
            { response in
                
                let completion = self.dealWithDictResponse(response: response)
                completionHandler(completion.0, completion.1)
        }
    }
    
    //Add Rate Alerts
       func addRateAlertImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.addRateAlert
          print(apiUlr,postParameters)
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headersWithAuthorization).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    //Get Rate Alerts
       func getRateAlertsImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.getRateAlert
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headersWithAuthorization).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    //Delete Rate Alert
       func deleteRateAlertImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
       {
           
           let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.deleteRateAlert
           
           AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
               JSONEncoding.default, headers: headersWithAuthorization).responseJSON
               { response in
                   
                   let completion = self.dealWithDictResponse(response: response)
                   completionHandler(completion.0, completion.1)
           }
       }
    
    //Occupation drop down list
          func occupationDrpDwnImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
          {
              
              let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.occupationDrpDwn
              
              AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                  JSONEncoding.default, headers: headers).responseJSON
                  { response in
                      
                      let completion = self.dealWithDictResponse(response: response)
                      completionHandler(completion.0, completion.1)
              }
          }
    
    
    //Bar chart
         func barChartImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
         {
             
             let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.barChartData
             
             AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                 JSONEncoding.default, headers: headersWithAuthorization).responseJSON
                 { response in
                     
                     let completion = self.dealWithDictResponse(response: response)
                     completionHandler(completion.0, completion.1)
             }
         }
      
      //Line chart
            func lineChartImplementation(headersTobePassed : HTTPHeaders,postParameters :[String:Any],completionHandler: @escaping (NSDictionary?, String?) -> ())
            {
                
                let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.lineChartData
                
                AF.request(apiUlr, method: .post, parameters: postParameters, encoding:
                    JSONEncoding.default, headers: headersWithAuthorization).responseJSON
                    { response in
                        
                        let completion = self.dealWithDictResponse(response: response)
                        completionHandler(completion.0, completion.1)
                }
            }
    
    
    
    //for speciality descipline api
    /*func specialityDesplineImplimentation(headersTobePassed :[String:String],completionHandler: @escaping (NSDictionary?, String?) -> ())
     {
     
     let apiUlr = PlayinUrls.baseUrl + PlayinUrls.illaliSpecialist
     
     Alamofire.request(apiUlr, method: .get, parameters: nil, encoding:
     JSONEncoding.default, headers: headersTobePassed).responseJSON
     { response in
     
     let completion = self.dealWithDictResponse(response: response)
     completionHandler(completion.0, completion.1)
     }
     }*/
    
    
    
    
    func dealWithDictResponse(response:AFDataResponse<Any>)->(NSDictionary?, String?)
    {
        var errorString:String = ""
       // var responseValue: NSDictionary?
        switch response.result {
        case .success(let value):
         //   responseValue = value as? NSDictionary
            if let statusCode = response.response?.statusCode
            {
                errorString = errorString + "Error Code: \(statusCode)"
            }
            if let responseDict = value as? NSDictionary
            {
                if let errorDescription = responseDict["error_description"] as? String
                {
                    errorString = errorString + "\nMessage: \(errorDescription)"
                }
                else if let errorDescription = responseDict["message"] as? String
                {
                    errorString = errorString + "\nMessage: \(errorDescription)"
                }
            }
            return (value as? NSDictionary, nil)
            
        case .failure(let error):
            print(error)
            // completion(nil)
            errorString = errorString + "\nMessage: \(error.localizedDescription)"
            /*     if response.error?._code == NSURLErrorNotConnectedToInternet{
             print("no internet")
             }*/
            errorString = error.localizedDescription
            return (nil, errorString)
            
        }
        
  //  return (responseValue, nil)
    }
    
}
