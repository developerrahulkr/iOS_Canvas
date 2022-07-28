//
//  CustomTabBarVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class CustomTabBarVc: UITabBarController {
    
    @IBOutlet weak var myTabBar: UITabBar!
    var purposeList: [BeneficiaryPurposeData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //     self.showSpinner(onView: self.view)
        
        downloadBenefConfig()
        downloadProfileConfig()
        
        
        
        
        //   myTabBar.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: false)
        setTabBarItems()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSelectedTabbarItemBackgroundColor()
        
        
    }
    func setupSelectedTabbarItemBackgroundColor() {
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: ColorCodes.tabBottomColor, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
        tabBar.frame.size.width = self.view.frame.width + 4
        tabBar.frame.origin.x = -2
    }
    func setTabBarItems(){
        
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "dashboardTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //        myTabBarItem1.selectedImage = UIImage(named: "dashboardSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.title = Global.shared.menuDashboard
        
        
        //   myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "beneficiariesTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //        myTabBarItem2.selectedImage = UIImage(named: "beneficiariesSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.title = Global.shared.menuBeneficiary
        //   myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "transactionTabImg")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //        myTabBarItem3.selectedImage = UIImage(named: "transactionSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.title = Global.shared.menuTransactions
        //  myTabBarItem3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "profileTab")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //        myTabBarItem4.selectedImage = UIImage(named: "profileSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.title = Global.shared.profileTab
        
    }
    /* override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
     
     if myTabBar.selectedItem == self.tabBar.items?[0] {
     viewDidLoad()
     }
     //     self.showSpinner(onView: self.view)
     }*/
    
    /*  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
     let tabBarIndex = tabBarController.selectedIndex
     if tabBarIndex == 0 {
     
     viewDidLoad()
     
     
     }
     }*/
    
    // Mark: Downloading beneficiary configuratiions
    func downloadBenefConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        /*     let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                // print(resonseTal!)
                if let beneficiaryIDTypes = resonseTal?.value(forKey: "beneficiaryIDTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: beneficiaryIDTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            BeneficiaryDetails.shared.beneficiaryIDTypesNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            BeneficiaryDetails.shared.beneficiaryIDTypesValueData.append(type)
                        }
                    }
                }
                if let beneficiaryIDTypes = resonseTal?.value(forKey: "beneficiaryRelationship") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: beneficiaryIDTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            BeneficiaryDetails.shared.beneficiaryRltnNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            BeneficiaryDetails.shared.beneficiaryRltnValueData.append(type)
                        }
                    }
                }
                
                
                if let bankAccountTypes = resonseTal?.value(forKey: "bankAccountTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: bankAccountTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            BeneficiaryDetails.shared.bankAccountTypesNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            BeneficiaryDetails.shared.bankAccountTypesValueData.append(type)
                        }
                    }
                }
                if let visaSendToOwnTypes = resonseTal?.value(forKey: "visaDirectSendToOwnCardList") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: visaSendToOwnTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            BeneficiaryDetails.shared.visaSendToOwnTypesNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            BeneficiaryDetails.shared.visaSendToOwnTypesValueData.append(type)
                        }
                    }
                }
                
                if let wuPurposes = resonseTal?.value(forKey: "wuPurposeOfTransfer") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: wuPurposes)
                    
                    
                    /*  for dataObj in newObj! {
                     if let name = dataObj["name"] as? String{
                     BeneficiaryDetails.shared.bankAccountTypesNameData.append(name)
                     }
                     if let type = dataObj["value"] as? String{
                     BeneficiaryDetails.shared.bankAccountTypesValueData.append(type)
                     }
                     }*/
                    
                    BeneficiaryDetails.shared.purposeList = BeneficiaryPurposeData.getPickerData(newObj!)
                    
                }
                
                for i in 0..<BeneficiaryDetails.shared.beneficiaryIDTypesNameData.count {
                    BeneficiaryDetails.shared.pickerbeneficiaryIDTypesData.append(["value": BeneficiaryDetails.shared.beneficiaryIDTypesValueData[i], "display": BeneficiaryDetails.shared.beneficiaryIDTypesNameData[i]])
                }
                for i in 0..<BeneficiaryDetails.shared.beneficiaryRltnNameData.count {
                    BeneficiaryDetails.shared.pickerbeneficiaryRltnData.append(["value": BeneficiaryDetails.shared.beneficiaryRltnValueData[i], "display": BeneficiaryDetails.shared.beneficiaryRltnNameData[i]])
                }
                
                for i in 0..<BeneficiaryDetails.shared.bankAccountTypesNameData.count {
                    BeneficiaryDetails.shared.pickerbankAccountTypesData.append(["value": BeneficiaryDetails.shared.bankAccountTypesValueData[i], "display": BeneficiaryDetails.shared.bankAccountTypesNameData[i]])
                }
                for i in 0..<BeneficiaryDetails.shared.visaSendToOwnTypesNameData.count {
                    BeneficiaryDetails.shared.pickervisaSendToOwnTypesData.append(["value": BeneficiaryDetails.shared.visaSendToOwnTypesValueData[i], "display": BeneficiaryDetails.shared.visaSendToOwnTypesNameData[i]])
                }
                if let fieldLengths = resonseTal?.value(forKey: "visaDirectBeneficiary") as? String {
                    let newObj = Global.shared.convertToDictionary(text: fieldLengths)
                    if let dataDict = newObj as NSDictionary? {
                        print(dataDict)
                        
                        if let visaDirectBeneficiary = dataDict.value(forKey: "visadirect_beneficiary") as? NSDictionary {
                            
                            if let Nationality = visaDirectBeneficiary.value(forKey: "Nationality") as? NSDictionary {
                                BeneficiaryDetails.shared.Visa_Nationality_is_required = Nationality["is_required"] as? Bool ?? false
                                
                            }
                            if let Address1 = visaDirectBeneficiary.value(forKey: "Address1") as? NSDictionary {
                                BeneficiaryDetails.shared.visa_Address1_is_required = Address1["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.visa_Address1_field_accept = Address1["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.visa_Address1_max_length = Address1["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.visa_Address1_min_length = Address1["min_length"] as? Int ?? 0
                                
                            }
                            
                            if let cardNumber = visaDirectBeneficiary.value(forKey: "CardNumber") as? NSDictionary {
                                BeneficiaryDetails.shared.visa_CardNumber_is_required = cardNumber["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.visa_CardNumber_field_accept = cardNumber["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.visa_CardNumber_max_length = cardNumber["max_length"] as? Int ?? 16
                                BeneficiaryDetails.shared.visa_CardNumber_min_length = cardNumber["min_length"] as? Int ?? 0
                                
                            }
                            if let SentToOwnCard = visaDirectBeneficiary.value(forKey: "SentToOwnCard") as? NSDictionary {
                                BeneficiaryDetails.shared.visa_SentToOwnCard_is_required = SentToOwnCard["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.visa_SentToOwnCard_field_accept = SentToOwnCard["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.visa_SentToOwnCard_max_length = SentToOwnCard["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.visa_SentToOwnCard_min_length = SentToOwnCard["min_length"] as? Int ?? 0
                                
                            }
                            
                        }
                        
                        
                    }
                }
                if let fieldLengths = resonseTal?.value(forKey: "beneficiaryFieldLengths") as? String {
                    let newObj = Global.shared.convertToDictionary(text: fieldLengths)
                    if let dataDict = newObj as NSDictionary? {
                        print(dataDict)
                        if let bankBeneficiary = dataDict.value(forKey: "bank_beneficiary") as? NSDictionary {
                            if let firstName = bankBeneficiary.value(forKey: "FirstName") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_FirstName_is_required = firstName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_FirstName_field_accept = firstName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_FirstName_max_length = firstName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_FirstName_min_length = firstName["min_length"] as? Int ?? 0
                                
                            }
                            if let LastName = bankBeneficiary.value(forKey: "LastName") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_LastName_is_required = LastName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_LastName_field_accept = LastName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_LastName_max_length = LastName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_LastName_min_length = LastName["min_length"] as? Int ?? 0
                                
                            }
                            if let MiddleName = bankBeneficiary.value(forKey: "MiddleName") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_MiddleName_is_required = MiddleName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_MiddleName_field_accept = MiddleName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_MiddleName_max_length = MiddleName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_MiddleName_min_length = MiddleName["min_length"] as? Int ?? 0
                                
                            }
                            if let Mobile = bankBeneficiary.value(forKey: "Mobile") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Mobile_is_required = Mobile["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_Mobile_field_accept = Mobile["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_Mobile_max_length = Mobile["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_Mobile_min_length = Mobile["min_length"] as? Int ?? 0
                                
                            }
                            if let Telephone = bankBeneficiary.value(forKey: "Telephone") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Telephone_is_required = Telephone["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_Telephone_field_accept = Telephone["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_Telephone_max_length = Telephone["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_Telephone_min_length = Telephone["min_length"] as? Int ?? 0
                                
                            }
                            if let Nationality = bankBeneficiary.value(forKey: "Nationality") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Nationality_is_required = Nationality["is_required"] as? Bool ?? false
                                
                            }
                            if let Address1 = bankBeneficiary.value(forKey: "Address1") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Address1_is_required = Address1["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_Address1_field_accept = Address1["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_Address1_max_length = Address1["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_Address1_min_length = Address1["min_length"] as? Int ?? 0
                                
                            }
                            if let Address2 = bankBeneficiary.value(forKey: "Address2") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Address2_is_required = Address2["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_Address2_field_accept = Address2["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_Address2_max_length = Address2["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_Address2_min_length = Address2["min_length"] as? Int ?? 0
                                
                            }
                            if let District = bankBeneficiary.value(forKey: "District") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_District_is_required = District["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_District_field_accept = District["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_District_max_length = District["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_District_min_length = District["min_length"] as? Int ?? 0
                                
                            }
                            if let City = bankBeneficiary.value(forKey: "City") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_City_is_required = City["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_City_field_accept = City["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_City_max_length = City["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_City_min_length = City["min_length"] as? Int ?? 0
                                
                            }
                            if let State = bankBeneficiary.value(forKey: "State") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_State_is_required = State["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_State_field_accept = State["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_State_max_length = State["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_State_min_length = State["min_length"] as? Int ?? 0
                                
                            }
                            if let PostCode = bankBeneficiary.value(forKey: "PostCode") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_PostCode_is_required = PostCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_PostCode_field_accept = PostCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_PostCode_max_length = PostCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_PostCode_min_length = PostCode["min_length"] as? Int ?? 0
                                
                            }
                            if let Country = bankBeneficiary.value(forKey: "Country") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Country_is_required = Country["is_required"] as? Bool ?? false
                                
                            }
                            if let Currency = bankBeneficiary.value(forKey: "Currency") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Currency_is_required = Currency["is_required"] as? Bool ?? false
                                
                            }
                            if let BeneficiaryIdType = bankBeneficiary.value(forKey: "BeneficiaryIdType") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BeneficiaryIdType_is_required = BeneficiaryIdType["is_required"] as? Bool ?? false
                                
                                
                            }
                            if let BeneficiaryIdNumber = bankBeneficiary.value(forKey: "BeneficiaryIdNumber") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_is_required = BeneficiaryIdNumber["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_field_accept = BeneficiaryIdNumber["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_max_length = BeneficiaryIdNumber["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_min_length = BeneficiaryIdNumber["min_length"] as? Int ?? 0
                                
                            }
                            if let BeneficiaryRelationship = bankBeneficiary.value(forKey: "BeneficiaryRelationship") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BeneficiaryRelationship_is_required = BeneficiaryRelationship["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BeneficiaryRelationship_field_accept = BeneficiaryRelationship["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BeneficiaryRelationship_max_length = BeneficiaryRelationship["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BeneficiaryRelationship_min_length = BeneficiaryRelationship["min_length"] as? Int ?? 0
                                
                            }
                            if let BankName = bankBeneficiary.value(forKey: "BankName") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BankName_is_required = BankName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BankName_field_accept = BankName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BankName_max_length = BankName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BankName_min_length = BankName["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchName = bankBeneficiary.value(forKey: "BranchName") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BranchName_is_required = BranchName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BranchName_field_accept = BranchName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BranchName_max_length = BranchName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BranchName_min_length = BranchName["min_length"] as? Int ?? 0
                                
                            }
                            if let AccountType = bankBeneficiary.value(forKey: "AccountType") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_AccountType_is_required = AccountType["is_required"] as? Bool ?? false
                                
                            }
                            if let IFSCCode = bankBeneficiary.value(forKey: "IFSCCode") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_IFSCCode_is_required = IFSCCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_IFSCCode_field_accept = IFSCCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_IFSCCode_max_length = IFSCCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_IFSCCode_min_length = IFSCCode["min_length"] as? Int ?? 0
                                
                            }
                            if let SWIFTCode = bankBeneficiary.value(forKey: "SWIFTCode") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_SWIFTCode_is_required = SWIFTCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_SWIFTCode_field_accept = SWIFTCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_SWIFTCode_max_length = SWIFTCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_SWIFTCode_min_length = SWIFTCode["min_length"] as? Int ?? 0
                                
                            }
                            if let CNICNO = bankBeneficiary.value(forKey: "CNICNO") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_CNICNO_is_required = CNICNO["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_CNICNO_field_accept = CNICNO["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_CNICNO_max_length = CNICNO["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_CNICNO_min_length = CNICNO["min_length"] as? Int ?? 0
                                
                            }
                            if let IBANCode = bankBeneficiary.value(forKey: "IBANCode") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_IBANCode_is_required = IBANCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_IBANCode_field_accept = IBANCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_IBANCode_max_length = IBANCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_IBANCode_min_length = IBANCode["min_length"] as? Int ?? 0
                                
                            }
                            if let AccountNumber = bankBeneficiary.value(forKey: "AccountNumber") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_AccountNumber_is_required = AccountNumber["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_AccountNumber_field_accept = AccountNumber["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_AccountNumber_max_length = AccountNumber["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_AccountNumber_min_length = AccountNumber["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchAddress1 = bankBeneficiary.value(forKey: "BranchAddress1") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BranchAddress1_is_required = BranchAddress1["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BranchAddress1_field_accept = BranchAddress1["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BranchAddress1_max_length = BranchAddress1["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BranchAddress1_min_length = BranchAddress1["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchAddress2 = bankBeneficiary.value(forKey: "BranchAddress2") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BranchAddress2_is_required = BranchAddress2["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BranchAddress2_field_accept = BranchAddress2["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BranchAddress2_max_length = BranchAddress2["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BranchAddress2_min_length = BranchAddress2["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchCode = bankBeneficiary.value(forKey: "BranchCode") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_BranchCode_is_required = BranchCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_BranchCode_field_accept = BranchCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_BranchCode_max_length = BranchCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_BranchCode_min_length = BranchCode["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchCode = bankBeneficiary.value(forKey: "Remarks") as? NSDictionary {
                                BeneficiaryDetails.shared.bank_Remarks_is_required = BranchCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.bank_Remarks_field_accept = BranchCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.bank_Remarks_max_length = BranchCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.bank_Remarks_min_length = BranchCode["min_length"] as? Int ?? 0
                                
                            }
                        }
                        
                        
                        
                        if let cashBeneficiary = dataDict.value(forKey: "cash_beneficiary") as? NSDictionary {
                            if let FirstName = cashBeneficiary.value(forKey: "FirstName") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_FirstName_is_required = FirstName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_FirstName_field_accept = FirstName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_FirstName_max_length = FirstName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_FirstName_min_length = FirstName["min_length"] as? Int ?? 0
                                
                            }
                            if let FirstName = cashBeneficiary.value(forKey: "Remarks") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Remarks_is_required = FirstName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_Remarks_field_accept = FirstName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_Remarks_max_length = FirstName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_Remarks_min_length = FirstName["min_length"] as? Int ?? 0
                                
                            }
                            if let LastName = cashBeneficiary.value(forKey: "LastName") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_LastName_is_required = LastName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_LastName_field_accept = LastName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_LastName_max_length = LastName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_LastName_min_length = LastName["min_length"] as? Int ?? 0
                                
                            }
                            if let MiddleName = cashBeneficiary.value(forKey: "MiddleName") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_MiddleName_is_required = MiddleName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_MiddleName_field_accept = MiddleName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_MiddleName_max_length = MiddleName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_MiddleName_min_length = MiddleName["min_length"] as? Int ?? 0
                                
                            }
                            if let Mobile = cashBeneficiary.value(forKey: "Mobile") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Mobile_is_required = Mobile["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_Mobile_field_accept = Mobile["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_Mobile_max_length = Mobile["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_Mobile_min_length = Mobile["min_length"] as? Int ?? 0
                                
                            }
                            if let Telephone = cashBeneficiary.value(forKey: "Telephone") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Telephone_is_required = Telephone["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_Telephone_field_accept = Telephone["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_Telephone_max_length = Telephone["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_Telephone_min_length = Telephone["min_length"] as? Int ?? 0
                                
                            }
                            if let Nationality = cashBeneficiary.value(forKey: "Nationality") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Nationality_is_required = Nationality["is_required"] as? Bool ?? false
                                
                                
                            }
                            if let Address1 = cashBeneficiary.value(forKey: "Address1") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Address1_is_required = Address1["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_Address1_field_accept = Address1["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_Address1_max_length = Address1["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_Address1_min_length = Address1["min_length"] as? Int ?? 0
                                
                            }
                            if let Address2 = cashBeneficiary.value(forKey: "Address2") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Address2_is_required = Address2["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_Address2_field_accept = Address2["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_Address2_max_length = Address2["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_Address2_min_length = Address2["min_length"] as? Int ?? 0
                                
                            }
                            if let District = cashBeneficiary.value(forKey: "District") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_District_is_required = District["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_District_field_accept = District["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_District_max_length = District["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_District_min_length = District["min_length"] as? Int ?? 0
                                
                            }
                            if let City = cashBeneficiary.value(forKey: "City") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_City_is_required = City["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_City_field_accept = City["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_City_max_length = City["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_City_min_length = City["min_length"] as? Int ?? 0
                                
                            }
                            if let State = cashBeneficiary.value(forKey: "State") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_State_is_required = State["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_State_field_accept = State["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_State_max_length = State["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_State_min_length = State["min_length"] as? Int ?? 0
                                
                            }
                            if let PostCode = cashBeneficiary.value(forKey: "PostCode") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_PostCode_is_required = PostCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_PostCode_field_accept = PostCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_PostCode_max_length = PostCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_PostCode_min_length = PostCode["min_length"] as? Int ?? 0
                                
                            }
                            if let Country = cashBeneficiary.value(forKey: "Country") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Country_is_required = Country["is_required"] as? Bool ?? false
                                
                            }
                            if let Currency = cashBeneficiary.value(forKey: "Currency") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_Currency_is_required = Currency["is_required"] as? Bool ?? false
                                
                            }
                            if let AccountNumber = cashBeneficiary.value(forKey: "AccountNumber") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_AccountNumber_is_required = AccountNumber["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_AccountNumber_field_accept = AccountNumber["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_AccountNumber_max_length = AccountNumber["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_AccountNumber_min_length = AccountNumber["min_length"] as? Int ?? 0
                                
                            }
                            if let BeneficiaryIdType = cashBeneficiary.value(forKey: "BeneficiaryIdType") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BeneficiaryIdType_is_required = BeneficiaryIdType["is_required"] as? Bool ?? false
                                
                            }
                            if let BeneficiaryIdNumber = cashBeneficiary.value(forKey: "BeneficiaryIdNumber") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_is_required = BeneficiaryIdNumber["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_field_accept = BeneficiaryIdNumber["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_max_length = BeneficiaryIdNumber["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_min_length = BeneficiaryIdNumber["min_length"] as? Int ?? 0
                                
                            }
                            if let BeneficiaryRelationship = cashBeneficiary.value(forKey: "BeneficiaryRelationship") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BeneficiaryRelationship_is_required = BeneficiaryRelationship["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BeneficiaryRelationship_field_accept = BeneficiaryRelationship["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BeneficiaryRelationship_max_length = BeneficiaryRelationship["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BeneficiaryRelationship_min_length = BeneficiaryRelationship["min_length"] as? Int ?? 0
                                
                            }
                            if let BankName = cashBeneficiary.value(forKey: "BankName") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BankName_is_required = BankName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BankName_field_accept = BankName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BankName_max_length = BankName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BankName_min_length = BankName["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchName = cashBeneficiary.value(forKey: "BranchName") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BranchName_is_required = BranchName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BranchName_field_accept = BranchName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BranchName_max_length = BranchName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BranchName_min_length = BranchName["min_length"] as? Int ?? 0
                                
                            }
                            if let AccountType = cashBeneficiary.value(forKey: "AccountType") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_AccountType_is_required = AccountType["is_required"] as? Bool ?? false
                                
                                
                            }
                            if let IFSCCode = cashBeneficiary.value(forKey: "IFSCCode") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_IFSCCode_is_required = IFSCCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_IFSCCode_field_accept = IFSCCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_IFSCCode_max_length = IFSCCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_IFSCCode_min_length = IFSCCode["min_length"] as? Int ?? 0
                                
                            }
                            if let SWIFTCode = cashBeneficiary.value(forKey: "SWIFTCode") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_SWIFTCode_is_required = SWIFTCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_SWIFTCode_field_accept = SWIFTCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_SWIFTCode_max_length = SWIFTCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_SWIFTCode_min_length = SWIFTCode["min_length"] as? Int ?? 0
                                
                            }
                            if let CNICNO = cashBeneficiary.value(forKey: "CNICNO") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_CNICNO_is_required = CNICNO["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_CNICNO_field_accept = CNICNO["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_CNICNO_max_length = CNICNO["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_CNICNO_min_length = CNICNO["min_length"] as? Int ?? 0
                                
                            }
                            if let IBANCode = cashBeneficiary.value(forKey: "IBANCode") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_IBANCode_is_required = IBANCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_IBANCode_field_accept = IBANCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_IBANCode_max_length = IBANCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_IBANCode_min_length = IBANCode["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchAddress1 = cashBeneficiary.value(forKey: "BranchAddress1") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BranchAddress1_is_required = BranchAddress1["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BranchAddress1_field_accept = BranchAddress1["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BranchAddress1_max_length = BranchAddress1["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BranchAddress1_min_length = BranchAddress1["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchAddress2 = cashBeneficiary.value(forKey: "BranchAddress2") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BranchAddress2_is_required = BranchAddress2["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BranchAddress2_field_accept = BranchAddress2["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BranchAddress2_max_length = BranchAddress2["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BranchAddress2_min_length = BranchAddress2["min_length"] as? Int ?? 0
                                
                            }
                            if let BranchCode = cashBeneficiary.value(forKey: "BranchCode") as? NSDictionary {
                                BeneficiaryDetails.shared.cash_BranchCode_is_required = BranchCode["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.cash_BranchCode_field_accept = BranchCode["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.cash_BranchCode_max_length = BranchCode["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.cash_BranchCode_min_length = BranchCode["min_length"] as? Int ?? 0
                                
                            }
                        }
                        if let wuBeneficiary = dataDict.value(forKey: "wu_beneficiary") as? NSDictionary {
                            if let FirstName = wuBeneficiary.value(forKey: "FirstName") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_FirstName_is_required = FirstName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.wu_FirstName_field_accept = FirstName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.wu_FirstName_max_length = FirstName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.wu_FirstName_min_length = FirstName["min_length"] as? Int ?? 0
                                
                            }
                            if let LastName = wuBeneficiary.value(forKey: "LastName") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_LastName_is_required = LastName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.wu_LastName_field_accept = LastName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.wu_LastName_max_length = LastName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.wu_LastName_min_length = LastName["min_length"] as? Int ?? 0
                                
                            }
                            if let MiddleName = wuBeneficiary.value(forKey: "MiddleName") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_MiddleName_is_required = MiddleName["is_required"] as? Bool ?? false
                                BeneficiaryDetails.shared.wu_MiddleName_field_accept = MiddleName["field_accept"] as? String ?? "any"
                                BeneficiaryDetails.shared.wu_MiddleName_max_length = MiddleName["max_length"] as? Int ?? 15
                                BeneficiaryDetails.shared.wu_MiddleName_min_length = MiddleName["min_length"] as? Int ?? 0
                                
                            }
                            if let City = wuBeneficiary.value(forKey: "City") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_City_is_required = City["is_required"] as? Bool ?? false
                                
                            }
                            if let State = wuBeneficiary.value(forKey: "State") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_State_is_required = State["is_required"] as? Bool ?? false
                                
                            }
                            if let Country = wuBeneficiary.value(forKey: "Country") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_Country_is_required = Country["is_required"] as? Bool ?? false
                                
                            }
                            if let Currency = wuBeneficiary.value(forKey: "Currency") as? NSDictionary {
                                BeneficiaryDetails.shared.wu_Currency_is_required = Currency["is_required"] as? Bool ?? false
                                
                            }
                            
                        }
                        
                        
                    }
                }
                
            }
            
            else
            {
                print(errorString!)
                
                self.removeSpinner()
                /*  let finalError = errorString?.components(separatedBy: ":")
                 let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                 self.present(alert, animated: true, completion: nil)*/
                if errorString == "Response could not be serialized, input data was nil or zero length." {
                    Global.shared.timeoUtOrNot = "no"
                    self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                    let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                    refreshAlert.view.tintColor = ColorCodes.newAppRed
//                    refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                        self.pushViewController(controller: LoginVc.initiateController())
//                    }))
//
//                    self.present(refreshAlert, animated: true, completion: nil)
                }
                
                else {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
            
        }
        
    }
    
    // Mark: Getting profile configurations
    
    func downloadProfileConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.profileConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal!)
                if let fieldLengths = resonseTal?.value(forKey: "fieldLengths") as? String {
                    let newObj = Global.shared.convertToDictionary(text: fieldLengths)
                    if let dataDict = newObj as NSDictionary? {
                        print(dataDict)
                        if let newUser = dataDict.value(forKey: "new_account_setup") as? NSDictionary {
                            if let IdentityType = newUser.value(forKey: "IdentityType") as? NSDictionary {
                                ProfileDetails.shared.new_identityType_is_required = IdentityType["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityId = newUser.value(forKey: "IdentityId") as? NSDictionary {
                                ProfileDetails.shared.new_identityId_is_required = IdentityId["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_identityId_field_accept = IdentityId["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_identityId_max_length = IdentityId["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_identityId_min_length = IdentityId["min_length"] as? Int ?? 0
                                
                            }
                            if let IdentityIssueDate = newUser.value(forKey: "IdentityIssueDate") as? NSDictionary {
                                ProfileDetails.shared.new_identityIssueDate_is_required = IdentityIssueDate["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityExpiryDate = newUser.value(forKey: "IdentityExpiryDate") as? NSDictionary {
                                ProfileDetails.shared.new_identityExpiryDate_is_required = IdentityExpiryDate["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityCountryIssue = newUser.value(forKey: "IdentityCountryIssue") as? NSDictionary {
                                ProfileDetails.shared.new_identityCountryIssue_is_required = IdentityCountryIssue["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityPlaseIssue = newUser.value(forKey: "IdentityPlaseIssue") as? NSDictionary {
                                ProfileDetails.shared.new_identityPlaseIssue_is_required = IdentityPlaseIssue["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_identityPlaseIssue_field_accept = IdentityPlaseIssue["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_identityPlaseIssue_max_length = IdentityPlaseIssue["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_identityPlaseIssue_min_length = IdentityPlaseIssue["min_length"] as? Int ?? 0
                                
                            }
                            if let PreferredLanguage = newUser.value(forKey: "PreferredLanguage") as? NSDictionary {
                                ProfileDetails.shared.new_preferredLanguage_is_required = PreferredLanguage["is_required"] as? Bool ?? false
                                
                            }
                            if let Salutation = newUser.value(forKey: "Answer") as? NSDictionary {
                                ProfileDetails.shared.new_salutation_is_required = Salutation["is_required"] as? Bool ?? false
                                
                            }
                            if let FirstName = newUser.value(forKey: "FirstName") as? NSDictionary {
                                ProfileDetails.shared.new_firstName_is_required = FirstName["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_firstName_field_accept = FirstName["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_firstName_max_length = FirstName["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_firstName_min_length = FirstName["min_length"] as? Int ?? 0
                                
                            }
                            if let MiddleName = newUser.value(forKey: "MiddleName") as? NSDictionary {
                                ProfileDetails.shared.new_middleName_is_required = MiddleName["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_middleName_field_accept = MiddleName["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_middleName_max_length = MiddleName["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_middleName_min_length = MiddleName["min_length"] as? Int ?? 0
                                
                            }
                            if let LastName = newUser.value(forKey: "LastName") as? NSDictionary {
                                ProfileDetails.shared.new_lastName_is_required = LastName["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_lastName_field_accept = LastName["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_lastName_max_length = LastName["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_lastName_min_length = LastName["min_length"] as? Int ?? 0
                                
                            }
                            if let Nationality = newUser.value(forKey: "Nationality") as? NSDictionary {
                                ProfileDetails.shared.new_nationality_is_required = Nationality["is_required"] as? Bool ?? false
                                
                            }
                            if let DateOfBirth = newUser.value(forKey: "DateOfBirth") as? NSDictionary {
                                ProfileDetails.shared.new_dob_is_required = DateOfBirth["is_required"] as? Bool ?? false
                                
                            }
                            if let PlaceOfBirth = newUser.value(forKey: "PlaceOfBirth") as? NSDictionary {
                                ProfileDetails.shared.new_placeOfBirth_is_required = PlaceOfBirth["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_placeOfBirth_field_accept = PlaceOfBirth["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_placeOfBirth_max_length = PlaceOfBirth["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_placeOfBirth_min_length = PlaceOfBirth["min_length"] as? Int ?? 0
                                
                            }
                            if let Mobile = newUser.value(forKey: "Mobile") as? NSDictionary {
                                ProfileDetails.shared.new_mobileNumber_is_required = Mobile["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_mobileNumber_field_accept = Mobile["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_mobileNumber_max_length = Mobile["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_mobileNumber_min_length = Mobile["min_length"] as? Int ?? 0
                                
                            }
                            if let Telephone = newUser.value(forKey: "Telephone") as? NSDictionary {
                                ProfileDetails.shared.new_telephone_is_required = Telephone["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_telephone_field_accept = Telephone["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_telephone_max_length = Telephone["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_telephone_min_length = Telephone["min_length"] as? Int ?? 0
                                
                            }
                            if let emailID = newUser.value(forKey: "EmailID") as? NSDictionary {
                                ProfileDetails.shared.new_emailId_is_required = emailID["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_emailId_field_accept = emailID["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_emailId_max_length = emailID["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_emailId_min_length = emailID["min_length"] as? Int ?? 0
                                
                            }
                            if let SecondaryEmail = newUser.value(forKey: "SecondaryEmail") as? NSDictionary {
                                ProfileDetails.shared.new_secndryEmailId_is_required = SecondaryEmail["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_secndryEmailId_field_accept = SecondaryEmail["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_secndryEmailId_max_length = SecondaryEmail["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_secndryEmailId_min_length = SecondaryEmail["min_length"] as? Int ?? 0
                                
                            }
                            if let ResidentType = newUser.value(forKey: "ResidentType") as? NSDictionary {
                                ProfileDetails.shared.new_residentType_is_required = ResidentType["is_required"] as? Bool ?? false
                                
                            }
                            if let Flat = newUser.value(forKey: "Flat") as? NSDictionary {
                                ProfileDetails.shared.new_flat_is_required = Flat["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_flat_field_accept = Flat["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_flat_max_length = Flat["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_flat_min_length = Flat["min_length"] as? Int ?? 0
                                
                            }
                            if let Floor = newUser.value(forKey: "Floor") as? NSDictionary {
                                ProfileDetails.shared.new_floor_is_required = Floor["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_floor_field_accept = Floor["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_floor_max_length = Floor["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_floor_min_length = Floor["min_length"] as? Int ?? 0
                                
                            }
                            if let Building = newUser.value(forKey: "Building") as? NSDictionary {
                                ProfileDetails.shared.new_building_is_required = Building["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_building_field_accept = Building["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_building_max_length = Building["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_building_min_length = Building["min_length"] as? Int ?? 0
                                
                            }
                            if let Gada = newUser.value(forKey: "Gada") as? NSDictionary {
                                ProfileDetails.shared.new_gada_is_required = Gada["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_gada_field_accept = Gada["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_gada_max_length = Gada["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_gada_min_length = Gada["min_length"] as? Int ?? 0
                                
                            }
                            if let Street = newUser.value(forKey: "Street") as? NSDictionary {
                                ProfileDetails.shared.new_street_is_required = Street["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_street_field_accept = Street["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_street_max_length = Street["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_street_min_length = Street["min_length"] as? Int ?? 0
                                
                            }
                            if let Block = newUser.value(forKey: "Block") as? NSDictionary {
                                ProfileDetails.shared.new_block_is_required = Block["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_block_field_accept = Block["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_block_max_length = Block["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_block_min_length = Block["min_length"] as? Int ?? 0
                                
                            }
                            if let City = newUser.value(forKey: "City") as? NSDictionary {
                                ProfileDetails.shared.new_areaCity_is_required = City["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_areaCity_field_accept = City["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_areaCity_max_length = City["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_areaCity_min_length = City["min_length"] as? Int ?? 0
                                
                            }
                            if let ZipCode = newUser.value(forKey: "ZipCode") as? NSDictionary {
                                ProfileDetails.shared.new_zipCode_is_required = ZipCode["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_zipCode_field_accept = ZipCode["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_zipCode_max_length = ZipCode["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_zipCode_min_length = ZipCode["min_length"] as? Int ?? 0
                                
                            }
                            if let State = newUser.value(forKey: "State") as? NSDictionary {
                                ProfileDetails.shared.new_state_is_required = State["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_state_field_accept = State["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_state_max_length = State["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_state_min_length = State["min_length"] as? Int ?? 0
                                
                            }
                            if let Country = newUser.value(forKey: "Country") as? NSDictionary {
                                ProfileDetails.shared.new_countryCode_is_required = Country["is_required"] as? Bool ?? false
                                
                            }
                            if let RemitterCategory = newUser.value(forKey: "RemitterCategory") as? NSDictionary {
                                ProfileDetails.shared.new_remitterCategory_is_required = RemitterCategory["is_required"] as? Bool ?? false
                                
                            }
                            if let PoliticalScope = newUser.value(forKey: "PoliticalScope") as? NSDictionary {
                                ProfileDetails.shared.new_politicalScope_is_required = PoliticalScope["is_required"] as? Bool ?? false
                                
                            }
                            if let PEPPosition = newUser.value(forKey: "PEPPosition") as? NSDictionary {
                                ProfileDetails.shared.new_PEPPosition_is_required = PEPPosition["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_PEPPosition_field_accept = PEPPosition["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_PEPPosition_max_length = PEPPosition["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_PEPPosition_min_length = PEPPosition["min_length"] as? Int ?? 0
                                
                            }
                            /*  if let answer = newUser.value(forKey: "Answer") as? NSDictionary {
                             Global.shared.new_politicalExposedPerson_is_required = answer["is_required"] as? Bool ?? false
                             
                             }*/
                            if let RelationshipPEP = newUser.value(forKey: "RelationshipPEP") as? NSDictionary {
                                ProfileDetails.shared.new_RelationshipPEP_is_required = RelationshipPEP["is_required"] as? Bool ?? false
                                
                            }
                            if let Occupation = newUser.value(forKey: "Occupation") as? NSDictionary {
                                ProfileDetails.shared.new_occupation_is_required = Occupation["is_required"] as? Bool ?? false
                                
                            }
                            if let EmployerName = newUser.value(forKey: "EmployerName") as? NSDictionary {
                                ProfileDetails.shared.new_employerName_is_required = EmployerName["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_employerName_field_accept = EmployerName["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_employerName_max_length = EmployerName["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_employerName_min_length = EmployerName["min_length"] as? Int ?? 0
                                
                            }
                            if let EmployeeID = newUser.value(forKey: "EmployeeID") as? NSDictionary {
                                ProfileDetails.shared.new_employerID_is_required = EmployeeID["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_employerID_field_accept = EmployeeID["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_employerID_max_length = EmployeeID["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_employerID_min_length = EmployeeID["min_length"] as? Int ?? 0
                                
                            }
                            if let EmployerLocation = newUser.value(forKey: "EmployerLocation") as? NSDictionary {
                                ProfileDetails.shared.new_employerLocation_is_required = EmployerLocation["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_employerLocation_field_accept = EmployerLocation["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_employerLocation_max_length = EmployerLocation["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_employerLocation_min_length = EmployerLocation["min_length"] as? Int ?? 0
                                
                            }
                            if let Designation = newUser.value(forKey: "Designation") as? NSDictionary {
                                ProfileDetails.shared.new_employerDesigntn_is_required = Designation["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_employerDesigntn_field_accept = Designation["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_employerDesigntn_max_length = Designation["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_employerDesigntn_min_length = Designation["min_length"] as? Int ?? 0
                                
                            }
                            if let Salary = newUser.value(forKey: "Salary") as? NSDictionary {
                                ProfileDetails.shared.new_salary_is_required = Salary["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_salary_field_accept = Salary["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_salary_max_length = Salary["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_salary_min_length = Salary["min_length"] as? Int ?? 0
                                
                            }
                            if let OtherIncome = newUser.value(forKey: "OtherIncome") as? NSDictionary {
                                ProfileDetails.shared.new_otherIncome_is_required = OtherIncome["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_otherIncome_field_accept = OtherIncome["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_otherIncome_max_length = OtherIncome["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_otherIncome_min_length = OtherIncome["min_length"] as? Int ?? 0
                                
                            }
                            if let TypeOfService = newUser.value(forKey: "TypeOfService") as? NSDictionary {
                                ProfileDetails.shared.new_typeOfService_is_required = TypeOfService["is_required"] as? Bool ?? false
                                
                            }
                            if let Purpose = newUser.value(forKey: "Purpose") as? NSDictionary {
                                ProfileDetails.shared.new_purposeOfTransfer_is_required = Purpose["is_required"] as? Bool ?? false
                                
                            }
                            if let ExpectedTransationMonth = newUser.value(forKey: "ExpectedTransationMonth") as? NSDictionary {
                                ProfileDetails.shared.new_expectedTransctnPerMonth_is_required = ExpectedTransationMonth["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_expectedTransctnPerMonth_field_accept = ExpectedTransationMonth["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_expectedTransctnPerMonth_max_length = ExpectedTransationMonth["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_expectedTransctnPerMonth_min_length = ExpectedTransationMonth["min_length"] as? Int ?? 0
                                
                            }
                            if let ExpectedTransationYear = newUser.value(forKey: "ExpectedTransationYear") as? NSDictionary {
                                ProfileDetails.shared.new_expectedTransctnPerYear_is_required = ExpectedTransationYear["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_expectedTransctnPerYear_field_accept = ExpectedTransationYear["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_expectedTransctnPerYear_max_length = ExpectedTransationYear["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_expectedTransctnPerYear_min_length = ExpectedTransationYear["min_length"] as? Int ?? 0
                                
                            }
                            if let TransationValueMonth = newUser.value(forKey: "TransationValueMonth") as? NSDictionary {
                                ProfileDetails.shared.new_trnsctnValuePerMonth_is_required = TransationValueMonth["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_trnsctnValuePerMonth_field_accept = TransationValueMonth["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_trnsctnValuePerMonth_max_length = TransationValueMonth["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_trnsctnValuePerMonth_min_length = TransationValueMonth["min_length"] as? Int ?? 0
                                
                            }
                            if let TransationValueYear = newUser.value(forKey: "TransationValueYear") as? NSDictionary {
                                ProfileDetails.shared.new_trnsctnValuePerYear_is_required = TransationValueYear["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_trnsctnValuePerYear_field_accept = TransationValueYear["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_trnsctnValuePerYear_max_length = TransationValueYear["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_trnsctnValuePerYear_min_length = TransationValueYear["min_length"] as? Int ?? 0
                                
                            }
                            if let CountOfExpectedTxn = newUser.value(forKey: "CountOfExpectedTxn") as? NSDictionary {
                                ProfileDetails.shared.new_CountOfExpectedTxn_is_required = CountOfExpectedTxn["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_CountOfExpectedTxn_field_accept = CountOfExpectedTxn["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_CountOfExpectedTxn_max_length = CountOfExpectedTxn["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_CountOfExpectedTxn_min_length = CountOfExpectedTxn["min_length"] as? Int ?? 0
                                
                            }
                            if let ValueForExpectedTxn = newUser.value(forKey: "ValueForExpectedTxn") as? NSDictionary {
                                ProfileDetails.shared.new_ValueForExpectedTxn_is_required = ValueForExpectedTxn["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_ValueForExpectedTxn_field_accept = ValueForExpectedTxn["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_ValueForExpectedTxn_max_length = ValueForExpectedTxn["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_ValueForExpectedTxn_min_length = ValueForExpectedTxn["min_length"] as? Int ?? 0
                                
                            }
                            if let SourceOfIncome = newUser.value(forKey: "SourceOfIncome") as? NSDictionary {
                                ProfileDetails.shared.new_sourceOfIncome_is_required = SourceOfIncome["is_required"] as? Bool ?? false
                                
                            }
                            if let AverageYearIncome = newUser.value(forKey: "AverageYearIncome") as? NSDictionary {
                                ProfileDetails.shared.new_avgYearlyIncome_is_required = AverageYearIncome["is_required"] as? Bool ?? false
                                ProfileDetails.shared.new_avgYearlyIncome_field_accept = AverageYearIncome["field_accept"] as? String ?? "any"
                                ProfileDetails.shared.new_avgYearlyIncome_max_length = AverageYearIncome["max_length"] as? Int ?? 0
                                ProfileDetails.shared.new_avgYearlyIncome_min_length = AverageYearIncome["min_length"] as? Int ?? 0
                                
                            }
                        }
                    }
                }
                
                self.removeSpinner()
                
            }
            
            else
            {
                print(errorString!)
                
                self.removeSpinner()
                
                if errorString == "Response could not be serialized, input data was nil or zero length." {
                    Global.shared.timeoUtOrNot = "no"
                    self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                    let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                    refreshAlert.view.tintColor = ColorCodes.newAppRed
//                    refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                        self.pushViewController(controller: LoginVc.initiateController())
//                    }))
//
//                    self.present(refreshAlert, animated: true, completion: nil)
                }
                
                else {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
            
            
        }
    }
    
    
   
}

extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
class APIManager {
    
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        if let authToken = UserDefaults.standard.string(forKey: "auth_token") {
            headers["Authorization"] = "Token" + " " + authToken
        }
        
        return headers
    }
}
