//
//  BeneficiarySecndTabVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BeneficiarySecndTabVc: BaseViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var beneficiaryTbleView: UITableView!
    @IBOutlet weak var benefCollectnView: UICollectionView!
    
    @IBOutlet weak var noRecordsFoundTxt: UILabel!
    
    var beneficiaryResponse = [Any]()
    var beneficaryFilteredResponse = [Any]()
    
    var deleteBenefId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        noRecordsFoundTxt.isHidden = true
        noRecordsFoundTxt.text =  Global.shared.noRecordsFoundTxt
        
        //    self.showSpinner(onView: self.view)
        
        //    self.removeSpinner()
        
        beneficiaryTbleView.rowHeight = 80
        
        self.beneficiaryResponse.removeAll()
        self.beneficaryFilteredResponse.removeAll()
        
    //    downloadBeneficiary()
        
        self.beneficaryFilteredResponse =  BeneficiaryDetails.shared.beneficaryCashFilteredResponse
        
        self.beneficiaryTbleView.reloadData()
        self.benefCollectnView.reloadData()
        
        if UserDefaults.exists(key: "enableListView") {
            
            if UserDefaults.standard.string(forKey: "enableListView")! == "list" {
                testLabel.text = "list"
                beneficiaryTbleView.isHidden = false
                benefCollectnView.isHidden = true
            }
            else {
                testLabel.text = "grid"
                beneficiaryTbleView.isHidden = true
                benefCollectnView.isHidden = false
            }
        }
        else {
            testLabel.text = "list"
            beneficiaryTbleView.isHidden = false
        }
        
        if self.beneficaryFilteredResponse.count < 1 {
            self.beneficiaryTbleView.isHidden = true
            self.benefCollectnView.isHidden = true
            self.noRecordsFoundTxt.isHidden = false
        }
        else {
            self.noRecordsFoundTxt.isHidden = true
            self.beneficiaryTbleView.isHidden = false
            self.benefCollectnView.isHidden = false
            
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        /*   bankTrnsfrTableView.rowHeight = 80
         
         // Do any additional setup after loading the view.
         downloadBeneficiary()*/
        
        
        if   Global.shared.fromListGrid == "grid" {
            self.beneficiaryTbleView.isHidden = true
            self.benefCollectnView.isHidden = false
            
        }
        if   Global.shared.fromListGrid == "list" {
            self.beneficiaryTbleView.isHidden = false
            self.benefCollectnView.isHidden = true
        }
        
        
    }
    
    // Mark: Downloading beneficiary data
    func downloadBeneficiary() {
        
        
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "disbursalMode": ""]
        
        
        /*   let headers: HTTPHeaders = [x
         "Content-Type": "application/json"
         ]*/
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        self.showLoader()
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            
            if errorString == nil
            {
                self.beneficaryFilteredResponse.removeAll()
                self.beneficiaryResponse.removeAll()
                self.removeLoader()
             //   print(resonseTal!)
                if let faqList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                 //   print(faqList)
                    self.beneficiaryResponse = faqList as! [Any]
                    for i in 0 ..< self.beneficiaryResponse.count {
                        
                        let eachObj = self.beneficiaryResponse[i] as?NSDictionary
                        
                        if let beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as?Int
                        {
                            if (beneficiaryType == 101)
                            {
                                // if let dataDict = eachObj {
                                self.beneficaryFilteredResponse.append(eachObj!)
                             //   print(self.beneficaryFilteredResponse)
                                
                                if self.beneficaryFilteredResponse.count < 1 {
                                    self.beneficiaryTbleView.isHidden = true
                                    self.benefCollectnView.isHidden = true
                                    self.noRecordsFoundTxt.isHidden = false
                                }
                                else {
                                    self.noRecordsFoundTxt.isHidden = true
                                    self.beneficiaryTbleView.isHidden = false
                                    self.benefCollectnView.isHidden = false
                                    
                                }
                                
                                //  }
                            }
                            else if self.beneficaryFilteredResponse.count < 1{
                                self.beneficiaryTbleView.isHidden = true
                                self.benefCollectnView.isHidden = true
                                self.noRecordsFoundTxt.isHidden = false
                            }
                            
                        }
                        
                    }
                }
                
                
                if   Global.shared.fromListGrid == "grid" {
                    self.beneficiaryTbleView.isHidden = true
                    self.benefCollectnView.isHidden = false
                    
                }
                if   Global.shared.fromListGrid == "list" {
                    self.beneficiaryTbleView.isHidden = false
                    self.benefCollectnView.isHidden = true
                }
                self.beneficiaryTbleView.reloadData()
                self.benefCollectnView.reloadData()
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                if statusCode ==  400 {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                    }
                    else if mesageCode == "R111"
                     {
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.messageCodeType(text: "R115"), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                     }
                    else{
                    
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
                
            }
            
            else
            {
                print(errorString!)
                self.removeLoader()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.beneficaryFilteredResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = beneficiaryTbleView.dequeueReusableCell(withIdentifier: "BeneficiarySecndTabCell")! as! BeneficiarySecndTabCell
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        if let isFavourite =  eachObj?.value(forKey: "isFavourite") as? Bool {
            if isFavourite == false {
                /*  cell.starBtnOtlt.setImage(Images.star, for: .normal)
                 cell.starBtnOtlt.tintColor = .darkGray*/
                cell.starBtnOtlt.isHidden = true
            }
            else {
                cell.starBtnOtlt.setImage(UIImage(named: "starRed"), for: .normal)
                cell.starBtnOtlt.tintColor = .red
                cell.starBtnOtlt.isHidden = false
            }
            
        }
        
        let randomColr = eachObj?.value(forKey: "randomColour") as? String ?? "#9df4c2-#e6fcf0"
        
        let colorrs = randomColr.components(separatedBy: "-")
        
        let firstColr = colorrs[0]
        let secndColr = colorrs[1]
        
        let newColorLbl = UIColor.colorFrom(hexString: firstColr)
        // let newColorLbl = UIColor(
        
        cell.iconNameLbl.borderColor = newColorLbl
        cell.iconNameLbl.textColor = newColorLbl
        cell.profileImg.borderColor = newColorLbl
        
        cell.iconNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
        
        
        let profileImage = eachObj?.value(forKey: "beneficiaryImage") as? String
        
        if profileImage == "" {
            //let namee = eachObj?.value(forKey: "firstName") as? String ?? ""
            
            cell.iconNameLbl.isHidden = false
            cell.iconNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
            
            cell.profileImg.isHidden = true
        }
        else if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
            let image2 = UIImage(data: decodedImageData)
            if image2 != nil {
                cell.profileImg.image = image2
                cell.iconNameLbl.isHidden = true
            }
            else if profileImage != nil {
                let image1 = profileImage?.base64ToImage()
                cell.profileImg.image = image1
                cell.iconNameLbl.isHidden = true
            }
            else {
               // let namee = eachObj?.value(forKey: "firstName") as? String ?? ""
                
                
                cell.iconNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
                
                cell.profileImg.isHidden = true
                
            }
            
        }
        /*   let namee1 = eachObj?.value(forKey: "firstName") as? String ?? ""
         let namee2 = eachObj?.value(forKey: "lastName") as? String ?? ""
         let finalNamees = namee1 + " " + namee2
         
         
         
         cell.titleLabel.text = finalNamees
         cell.dateLbl.text = "28-08-2020"
         cell.bankNameLbl.text = eachObj?.value(forKey: "bankName") as? String ?? ""*/
        
        let firstNameTxt  = eachObj?.value(forKey: "firstName") as? String ?? ""
        let middleNameTxt  = eachObj?.value(forKey: "middleName") as? String ?? ""
        let lastNameTxt  = eachObj?.value(forKey: "lastName") as? String ?? ""
        cell.titleLabel.text = firstNameTxt + " " + middleNameTxt + " " + lastNameTxt
        
        
       // let namee1 = eachObj?.value(forKey: "firstName") as? String ?? ""
       // let namee2 = eachObj?.value(forKey: "lastName") as? String ?? ""
        //let finalNamees = namee1 + " " + namee2
        //  cell.titleLabel.text = finalNamees
        cell.dateLbl.text = "28-08-2020"
        
        let acntNumbr = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        let curencyTxt = eachObj?.value(forKey: "currency") as? String ?? ""
        let bankNameTxt = eachObj?.value(forKey: "bankName") as? String ?? ""
        cell.bankNameLbl.text = bankNameTxt + "/" + acntNumbr + "/" + curencyTxt
        
        
        
        cell.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
        cell.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        cell.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
        cell.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
        cell.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
        cell.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
        cell.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
        cell.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        cell.benID = eachObj?.value(forKey: "benID") as? String ?? ""
        cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        cell.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        cell.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
        cell.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
        cell.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
        cell.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
        cell.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        cell.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
        cell.city = eachObj?.value(forKey: "city") as? String ?? ""
        cell.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
        cell.country = eachObj?.value(forKey: "country") as? String ?? ""
        cell.currency = eachObj?.value(forKey: "currency") as? String ?? ""
        cell.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
        cell.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
        cell.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
        cell.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
        cell.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
        cell.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
        cell.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
        cell.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
        cell.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
        cell.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
        cell.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
        cell.mobile = eachObj?.value(forKey: "mobileNo") as? String ?? ""
        cell.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
        cell.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
        cell.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
        cell.remID = eachObj?.value(forKey: "remID") as? String ?? ""
        cell.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
        cell.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
        cell.state = eachObj?.value(forKey: "state") as? String ?? ""
        cell.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
        cell.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
        cell.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Global.shared.benefCasBankWu = "Cash"
        
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        let benefId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        BeneficiaryDetails.shared.beneficiaryId = benefId
        
        BeneficiaryDetails.shared.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        BeneficiaryDetails.shared.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
        BeneficiaryDetails.shared.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
        BeneficiaryDetails.shared.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
        BeneficiaryDetails.shared.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
        BeneficiaryDetails.shared.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
        BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.benID = eachObj?.value(forKey: "benID") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        BeneficiaryDetails.shared.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
        BeneficiaryDetails.shared.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
        BeneficiaryDetails.shared.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
        BeneficiaryDetails.shared.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
        BeneficiaryDetails.shared.city = eachObj?.value(forKey: "city") as? String ?? ""
        BeneficiaryDetails.shared.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
        BeneficiaryDetails.shared.country = eachObj?.value(forKey: "country") as? String ?? ""
        BeneficiaryDetails.shared.currency = eachObj?.value(forKey: "currency") as? String ?? ""
        BeneficiaryDetails.shared.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
        BeneficiaryDetails.shared.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
        BeneficiaryDetails.shared.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
        BeneficiaryDetails.shared.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
        BeneficiaryDetails.shared.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
        BeneficiaryDetails.shared.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
        BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
        BeneficiaryDetails.shared.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
        BeneficiaryDetails.shared.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
        BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
        BeneficiaryDetails.shared.mobile = eachObj?.value(forKey: "mobile") as? String ?? ""
        BeneficiaryDetails.shared.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
        BeneficiaryDetails.shared.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
        BeneficiaryDetails.shared.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
        BeneficiaryDetails.shared.remID = eachObj?.value(forKey: "remID")  as? String ?? ""
        BeneficiaryDetails.shared.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
        BeneficiaryDetails.shared.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
        BeneficiaryDetails.shared.state = eachObj?.value(forKey: "state") as? String ?? ""
        BeneficiaryDetails.shared.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
        BeneficiaryDetails.shared.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
        
        BeneficiaryDetails.shared.quickSend = "Details"
        
        
        /*     let vc = self.storyboard?.instantiateViewController(identifier: "BeneficiaryBankCashDetailsVc") as! BeneficiaryBankCashDetailsVc
         self.navigationController?.pushViewController(vc, animated: true)*/
        let disablee = eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        if disablee == false {
            self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController(), animated: true)
        }
        else {
            let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func starBtnActn(_ sender: Any) {
    }
    
    
    @IBAction func editBtnActn(_ sender: Any) {
        self.pushViewController(controller: BenefCashEditVc.initiateController(), animated: true)
        
    }
    
    /*   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
     let cell = beneficiaryTbleView.dequeueReusableCell(withIdentifier: "BeneficiarySecndTabCell")! as! BeneficiarySecndTabCell
     let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
     
     cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
     if editingStyle == .delete {
     self.deleteBenefId = cell.beneficiaryId
     
     deleteBeneficiary()
     }
     }*/
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    
    
    {
        let cell = beneficiaryTbleView.dequeueReusableCell(withIdentifier: "BeneficiarySecndTabCell")! as! BeneficiarySecndTabCell
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        
        cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        // Write action code for the trash
        let EditAction = UIContextualAction(style: .normal, title: Global.shared.editTxt, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Edit action ...")
            
            
            BeneficiaryDetails.shared.beneficiaryImg = eachObj?.value(forKey: "beneficiaryImage") as? String ?? ""
            BeneficiaryDetails.shared.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
            BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
            BeneficiaryDetails.shared.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
            BeneficiaryDetails.shared.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
            BeneficiaryDetails.shared.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
            BeneficiaryDetails.shared.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
            BeneficiaryDetails.shared.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
            BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
            BeneficiaryDetails.shared.benID = eachObj?.value(forKey: "benID") as? String ?? ""
            BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            BeneficiaryDetails.shared.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
            BeneficiaryDetails.shared.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
            BeneficiaryDetails.shared.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
            BeneficiaryDetails.shared.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
            BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
            BeneficiaryDetails.shared.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
            BeneficiaryDetails.shared.city = eachObj?.value(forKey: "city") as? String ?? ""
            BeneficiaryDetails.shared.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
            BeneficiaryDetails.shared.country = eachObj?.value(forKey: "country") as? String ?? ""
            BeneficiaryDetails.shared.currency = eachObj?.value(forKey: "currency") as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
            BeneficiaryDetails.shared.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
            BeneficiaryDetails.shared.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
            BeneficiaryDetails.shared.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
            BeneficiaryDetails.shared.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
            BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
            BeneficiaryDetails.shared.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
            BeneficiaryDetails.shared.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
            BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
            BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
            BeneficiaryDetails.shared.mobile = eachObj?.value(forKey: "mobile") as? String ?? ""
            BeneficiaryDetails.shared.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
            BeneficiaryDetails.shared.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
            BeneficiaryDetails.shared.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
            BeneficiaryDetails.shared.remID = eachObj?.value(forKey: "remID")  as? String ?? ""
            BeneficiaryDetails.shared.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
            BeneficiaryDetails.shared.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
            BeneficiaryDetails.shared.state = eachObj?.value(forKey: "state") as? String ?? ""
            BeneficiaryDetails.shared.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
            BeneficiaryDetails.shared.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
            BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
            self.pushViewController(controller: BenefBankEditVc.initiateController(),animated: true)
            
            
            success(true)
        })
        EditAction.backgroundColor = .red
        EditAction.image = UIImage(named: "benefEdit")
        
        
        
        
        
        /*    // Write action code for the Flag
         let DeleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
         print("Delete action ...")
         
         
         self.deleteBenefId = cell.beneficiaryId
         
         self.deleteBeneficiary()
         
         success(true)
         })
         DeleteAction.backgroundColor = .red
         DeleteAction.image = UIImage(named: "benefDelete")*/
        
        return UISwipeActionsConfiguration(actions: [EditAction])
    }
    
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        
        let cell = beneficiaryTbleView.dequeueReusableCell(withIdentifier: "BeneficiarySecndTabCell")! as! BeneficiarySecndTabCell
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        let isFavourite =  eachObj?.value(forKey: "isFavourite") as? Bool
        let closeAction = UIContextualAction(style: .normal, title: Global.shared.favBenfTxt, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Favourite ...")
            
            cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            if isFavourite == false {
                
                cell.isFav = true
                
                
                
                
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": cell.beneficiaryId,
                        "isFavourite": cell.isFav
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        //   print(resonseTal)
                        
                        
                        //   self.showSpinner(onView: self.beneficiaryTbleView)
                        //    self.viewDidLoad()
                        
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                        
                         self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        self.removeLoader()
                        self.removeSpinner()
                        /*  let finalError = errorString?.components(separatedBy: ":")
                         let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)*/
                        if errorString == "Response could not be serialized, input data was nil or zero length." {

                            Global.shared.timeoUtOrNot = "no"
                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
                            //                            let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                            refreshAlert.view.tintColor = ColorCodes.newAppRed
//                            refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                self.pushViewController(controller: LoginVc.initiateController())
//                            }))
//
//                            self.present(refreshAlert, animated: true, completion: nil)
                        }
                        
                        else {
                            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                }
                
                
            }
            else {
                //  cell.starBtnOtlt.setImage(UIImage(named: "starRed"), for: .normal)
                //    cell.starBtnOtlt.tintColor = .darkGray
                cell.isFav = false
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": cell.beneficiaryId,
                        "isFavourite": cell.isFav
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]
                 */
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        //   self.showSpinner(onView: self.beneficiaryTbleView)
                        //   self.viewDidLoad()
                        
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                        
                          self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        self.removeLoader()
                        self.removeSpinner()
                        /*  let finalError = errorString?.components(separatedBy: ":")
                         let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)*/
                        if errorString == "Response could not be serialized, input data was nil or zero length." {
                            Global.shared.timeoUtOrNot = "no"
                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                            let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                            refreshAlert.view.tintColor = ColorCodes.newAppRed
//                            refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                self.pushViewController(controller: LoginVc.initiateController())
//                            }))
//
//                            self.present(refreshAlert, animated: true, completion: nil)
                        }
                        
                        else {
                            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                }
            }
            success(true)
        })
        
        if isFavourite == false {
            closeAction.image = UIImage(named: "benefStar")
        }
        else {
            closeAction.image = UIImage(named: "benefUnfavourite")
        }
        closeAction.backgroundColor = .red
        //    closeAction.image = UIImage(named: "benefStar")
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    func deleteBeneficiary() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "beneficiaryId": self.deleteBenefId]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.deleteBeneficiaryImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                //    print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        self.viewWillAppear(true)
                    }
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                    if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                
                
            }
            
            else
            {
                print(errorString!)
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beneficaryFilteredResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = benefCollectnView.dequeueReusableCell(withReuseIdentifier: "BenefSecndTabCollectnCell", for: indexPath) as! BenefSecndTabCollectnCell
        
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        cell.imgNameLbl.layer.cornerRadius = cell.imgNameLbl.frame.size.width / 2;
        cell.imgNameLbl.clipsToBounds = true
        
        cell.imgBenef.layer.cornerRadius = cell.imgBenef.frame.size.width / 2;
        cell.imgBenef.clipsToBounds = true
        
        
        let randomColr = eachObj?.value(forKey: "randomColour") as? String ?? "#9df4c2-#e6fcf0"
        
        let colorrs = randomColr.components(separatedBy: "-")
        
        let firstColr = colorrs[0]
        let secndColr = colorrs[1]
        
        let newColorLbl = UIColor.colorFrom(hexString: firstColr)
        // let newColorLbl = UIColor(
        
        cell.imgNameLbl.borderColor = newColorLbl
        cell.imgNameLbl.textColor = newColorLbl
        cell.imgBenef.borderColor = newColorLbl
        
        cell.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
        
        
        let profileImage = eachObj?.value(forKey: "beneficiaryImage") as? String
        if profileImage == "" {
            //let namee = eachObj?.value(forKey: "firstName") as? String ?? ""
            
            cell.imgNameLbl.isHidden = false
            cell.imgNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
            
            cell.imgBenef.isHidden = true
        }
        else if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
            let image2 = UIImage(data: decodedImageData)
            if image2 != nil {
                cell.imgBenef.image = image2
                cell.imgNameLbl.isHidden = true
            }
            else if profileImage != nil {
                let image1 = profileImage?.base64ToImage()
                cell.imgBenef.image = image1
                cell.imgNameLbl.isHidden = true
            }
            else {
              //  let namee = eachObj?.value(forKey: "firstName") as? String ?? ""
                
                
                cell.imgNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
                
                cell.imgBenef.isHidden = true
                
            }
            
        }
        
        
        if let isFavourite =  eachObj?.value(forKey: "isFavourite") as? Bool {
            if isFavourite == false {
                cell.starBtnOtlt.isHidden = true
                
            }
            else {
                cell.starBtnOtlt.isHidden = false
            }
            
        }
        
        cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        
        let firstNameTxt  = eachObj?.value(forKey: "firstName") as? String ?? ""
        let middleNameTxt  = eachObj?.value(forKey: "middleName") as? String ?? ""
        let lastNameTxt  = eachObj?.value(forKey: "lastName") as? String ?? ""
        cell.nameLbl.text = firstNameTxt + " " + middleNameTxt + " " + lastNameTxt
        
        
        
        //  cell.nameLbl.text = eachObj?.value(forKey: "firstName") as? String ?? ""
        cell.currencyLbl.text = eachObj?.value(forKey: "currency") as? String ?? ""
        cell.bankLbl.text = eachObj?.value(forKey: "bankName") as? String ?? ""
        
        
        cell.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
        cell.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        cell.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
        cell.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
        cell.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
        cell.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
        cell.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
        cell.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        cell.benID = eachObj?.value(forKey: "benID") as? String ?? ""
        cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        cell.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        cell.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
        cell.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
        cell.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
        cell.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
        cell.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        cell.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
        cell.city = eachObj?.value(forKey: "city") as? String ?? ""
        cell.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
        cell.country = eachObj?.value(forKey: "country") as? String ?? ""
        cell.currency = eachObj?.value(forKey: "currency") as? String ?? ""
        cell.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
        cell.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
        cell.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
        cell.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
        cell.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
        cell.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
        cell.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
        cell.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
        cell.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
        cell.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
        cell.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
        cell.mobile = eachObj?.value(forKey: "mobileNo") as? String ?? ""
        cell.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
        cell.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
        cell.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
        cell.remID = eachObj?.value(forKey: "remID") as? String ?? ""
        cell.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
        cell.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
        cell.state = eachObj?.value(forKey: "state") as? String ?? ""
        cell.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
        cell.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
        cell.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
        
        cell.editBtnOtlt.addTarget(self, action: #selector(editBtnnActnn(sender:)), for: .touchUpInside)
        cell.editBtnOtlt.params["beneficiaryImage"] = eachObj?.value(forKey: "beneficiaryImage") as? String ?? ""
        cell.editBtnOtlt.params["beneficiaryId"] = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        cell.editBtnOtlt.params["isFavourite"] =  eachObj?.value(forKey: "isFavourite") as? Bool ?? false
        cell.editBtnOtlt.params["isDisable"] =  eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        cell.editBtnOtlt.params["firstName"] = eachObj?.value(forKey: "firstName") as? String ?? ""
        cell.editBtnOtlt.params["currency"] = eachObj?.value(forKey: "currency") as? String ?? ""
        cell.editBtnOtlt.params["bankName"] = eachObj?.value(forKey: "bankName") as? String ?? ""
        
        
        cell.editBtnOtlt.params["abaRouteCode"] = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
        cell.editBtnOtlt.params["accountNumber"] = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        cell.editBtnOtlt.params["address1"] = eachObj?.value(forKey: "address1") as? String ?? ""
        cell.editBtnOtlt.params["address2"] = eachObj?.value(forKey: "address2") as? String ?? ""
        cell.editBtnOtlt.params["agentID"] = eachObj?.value(forKey: "agentID") as? String ?? ""
        cell.editBtnOtlt.params["agentName"] = eachObj?.value(forKey: "agentName") as? String ?? ""
        cell.editBtnOtlt.params["bankCode"] = eachObj?.value(forKey: "bankCode") as? String ?? ""
        cell.editBtnOtlt.params["bankName"] = eachObj?.value(forKey: "bankName") as? String ?? ""
        cell.editBtnOtlt.params["benID"] = eachObj?.value(forKey: "benID") as? String ?? ""
        
        cell.editBtnOtlt.params["beneficiaryType"] = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        cell.editBtnOtlt.params["branchAddress1"] = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
        cell.editBtnOtlt.params["branchAddress2"] = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
        cell.editBtnOtlt.params["branchCity"] = eachObj?.value(forKey: "branchCity") as? String ?? ""
        cell.editBtnOtlt.params["branchCode"] = eachObj?.value(forKey: "branchCode") as? String ?? ""
        cell.editBtnOtlt.params["branchName"] = eachObj?.value(forKey: "branchName") as? String ?? ""
        cell.editBtnOtlt.params["branchState"] = eachObj?.value(forKey: "branchState") as? String ?? ""
        cell.editBtnOtlt.params["city"] = eachObj?.value(forKey: "city") as? String ?? ""
        cell.editBtnOtlt.params["cnicno"] = eachObj?.value(forKey: "cnicno") as? String ?? ""
        cell.editBtnOtlt.params["country"] = eachObj?.value(forKey: "country") as? String ?? ""
        cell.editBtnOtlt.params["currency"] = eachObj?.value(forKey: "currency") as? String ?? ""
        cell.editBtnOtlt.params["defaultPurposeCode"] = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
        cell.editBtnOtlt.params["defaultPurposeName"] = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
        cell.editBtnOtlt.params["disbursalMode"] = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
        cell.editBtnOtlt.params["disbursalModeName"] = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
        cell.editBtnOtlt.params["fcMaxAmount"] = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
        cell.editBtnOtlt.params["fcMinAmount"] = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
        cell.editBtnOtlt.params["firstName"] = eachObj?.value(forKey: "firstName") as? String ?? ""
        cell.editBtnOtlt.params["ibanCode"] = eachObj?.value(forKey: "ibanCode") as? String ?? ""
        cell.editBtnOtlt.params["ifscCode"] = eachObj?.value(forKey: "ifscCode") as? String ?? ""
        cell.editBtnOtlt.params["lastName"] = eachObj?.value(forKey: "lastName") as? String ?? ""
        cell.editBtnOtlt.params["middleName"] = eachObj?.value(forKey: "middleName") as? String ?? ""
        cell.editBtnOtlt.params["mobileNo"] = eachObj?.value(forKey: "mobileNo") as? String ?? ""
        cell.editBtnOtlt.params["nationality"] = eachObj?.value(forKey: "nationality") as? String ?? ""
        cell.editBtnOtlt.params["postCode"] = eachObj?.value(forKey: "postCode") as? String ?? ""
        cell.editBtnOtlt.params["referenceId"] = eachObj?.value(forKey: "referenceId") as? String ?? ""
        cell.editBtnOtlt.params["remID"] = eachObj?.value(forKey: "remID") as? String ?? ""
        cell.editBtnOtlt.params["remarks"] = eachObj?.value(forKey: "remarks") as? String ?? ""
        cell.editBtnOtlt.params["sourceOfIncome"] = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
        cell.editBtnOtlt.params["state"] = eachObj?.value(forKey: "state") as? String ?? ""
        cell.editBtnOtlt.params["swiftCode"] = eachObj?.value(forKey: "swiftCode") as? String ?? ""
        cell.editBtnOtlt.params["telePhone"] = eachObj?.value(forKey: "telePhone") as? String ?? ""
        cell.editBtnOtlt.params["txnRef"] = eachObj?.value(forKey: "txnRef") as? String ?? ""
        
        return cell
        
        
        
        
    }
    
    
    @objc func editBtnnActnn(sender: PassableUIButton){
        
        
        let refreshAlert = UIAlertController(title: "", message: Global.shared.selectOptionTxt, preferredStyle: UIAlertController.Style.actionSheet)
        
        let favourite = sender.params["isFavourite"] ?? false
        if favourite as! Bool == true {
            refreshAlert.addAction(UIAlertAction(title: Global.shared.unfavBenefTxt, style: .default, handler: { (action: UIAlertAction!) in
                //   self.showSpinner(onView: self.view)
                
                self.showLoader()
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "isFavourite": false
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        self.removeLoader()
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                           self.downloadBeneficiary()
                        }
                        
                        
                        
                    }
                    else
                    {
                        print(errorString!)
                        self.removeLoader()
                        self.removeSpinner()
                        /*  let finalError = errorString?.components(separatedBy: ":")
                         let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)*/
                        if errorString == "Response could not be serialized, input data was nil or zero length." {
                            Global.shared.timeoUtOrNot = "no"
                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                            let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                            refreshAlert.view.tintColor = ColorCodes.newAppRed
//                            refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                self.pushViewController(controller: LoginVc.initiateController())
//                            }))
//
//                            self.present(refreshAlert, animated: true, completion: nil)
                        }
                        
                        else {
                            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                }
            }))
        }
        else {
            
            refreshAlert.addAction(UIAlertAction(title: Global.shared.favBenfTxt, style: .default, handler: { (action: UIAlertAction!) in
                //  self.showSpinner(onView: self.view)
                self.showLoader()
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "isFavourite": true
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        self.removeLoader()
                        // print(resonseTal)
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                           self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        self.removeLoader()
                        self.removeSpinner()
                        /*  let finalError = errorString?.components(separatedBy: ":")
                         let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)*/
                        if errorString == "Response could not be serialized, input data was nil or zero length." {
                            Global.shared.timeoUtOrNot = "no"
                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                            let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                            refreshAlert.view.tintColor = ColorCodes.newAppRed
//                            refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                self.pushViewController(controller: LoginVc.initiateController())
//                            }))
//
//                            self.present(refreshAlert, animated: true, completion: nil)
                        }
                        
                        else {
                            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                }
            }))
        }
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.editTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            BeneficiaryDetails.shared.beneficiaryImg = sender.params["beneficiaryImage"] as? String ?? ""
            BeneficiaryDetails.shared.abaRouteCode = sender.params["abaRouteCode"] as? String ?? ""
            BeneficiaryDetails.shared.accountNumber = sender.params["accountNumber"] as? String ?? ""
            BeneficiaryDetails.shared.address1 = sender.params["address1"] as? String ?? ""
            BeneficiaryDetails.shared.address2 = sender.params["address2"] as? String ?? ""
            BeneficiaryDetails.shared.agentID = sender.params["agentID"] as? String ?? ""
            BeneficiaryDetails.shared.agentName = sender.params["agentName"] as? String ?? ""
            BeneficiaryDetails.shared.bankCode = sender.params["bankCode"] as? String ?? ""
            BeneficiaryDetails.shared.bankName = sender.params["bankName"] as? String ?? ""
            BeneficiaryDetails.shared.benID = sender.params["benID"] as? String ?? ""
            BeneficiaryDetails.shared.beneficiaryId = sender.params["beneficiaryId"] as? Int ?? 0
            BeneficiaryDetails.shared.beneficiaryType = sender.params["beneficiaryType"] as? Int ?? 0
            BeneficiaryDetails.shared.branchAddress1 = sender.params["branchAddress1"] as? String ?? ""
            BeneficiaryDetails.shared.branchAddress2 = sender.params["branchAddress2"] as? String ?? ""
            BeneficiaryDetails.shared.branchCity = sender.params["branchCity"] as? String ?? ""
            BeneficiaryDetails.shared.branchCode = sender.params["branchCode"] as? String ?? ""
            BeneficiaryDetails.shared.branchName = sender.params["branchName"] as? String ?? ""
            BeneficiaryDetails.shared.branchState = sender.params["branchState"] as? String ?? ""
            BeneficiaryDetails.shared.city = sender.params["city"] as? String ?? ""
            BeneficiaryDetails.shared.cnicno = sender.params["cnicno"] as? String ?? ""
            BeneficiaryDetails.shared.country = sender.params["country"] as? String ?? ""
            BeneficiaryDetails.shared.currency = sender.params["currency"] as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeCode = sender.params["defaultPurposeCode"] as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeName = sender.params["defaultPurposeName"] as? String ?? ""
            BeneficiaryDetails.shared.disbursalMode = sender.params["disbursalMode"] as? String ?? ""
            BeneficiaryDetails.shared.disbursalModeName = sender.params["disbursalModeName"] as? String ?? ""
            BeneficiaryDetails.shared.fcMaxAmount = sender.params["fcMaxAmount"] as? String ?? ""
            BeneficiaryDetails.shared.fcMinAmount = sender.params["fcMinAmount"] as? String ?? ""
            BeneficiaryDetails.shared.firstName = sender.params["firstName"] as? String ?? ""
            BeneficiaryDetails.shared.ibanCode = sender.params["ibanCode"] as? String ?? ""
            BeneficiaryDetails.shared.ifscCode = sender.params["ifscCode"] as? String ?? ""
            BeneficiaryDetails.shared.lastName = sender.params["lastName"] as? String ?? ""
            BeneficiaryDetails.shared.middleName = sender.params["middleName"] as? String ?? ""
            BeneficiaryDetails.shared.mobile = sender.params["mobileNo"] as? String ?? ""
            BeneficiaryDetails.shared.nationality = sender.params["nationality"] as? String ?? ""
            BeneficiaryDetails.shared.postCode = sender.params["postCode"] as? String ?? ""
            BeneficiaryDetails.shared.referenceId = sender.params["referenceId"] as? String ?? ""
            BeneficiaryDetails.shared.remID = sender.params["remID"] as? String ?? ""
            BeneficiaryDetails.shared.remarks = sender.params["remarks"] as? String ?? ""
            BeneficiaryDetails.shared.sourceOfIncome = sender.params["sourceOfIncome"] as? String ?? ""
            BeneficiaryDetails.shared.state = sender.params["state"] as? String ?? ""
            BeneficiaryDetails.shared.swiftCode = sender.params["swiftCode"] as? String ?? ""
            BeneficiaryDetails.shared.telePhone = sender.params["telePhone"] as? String ?? ""
            BeneficiaryDetails.shared.txnRef = sender.params["txnRef"] as? String ?? ""
            
            
            let benificiaryType = sender.params["beneficiaryType"] ?? 0
            print(benificiaryType)
            if benificiaryType as! Int == 100 {
                self.pushViewController(controller: BenefBankEditVc.initiateController())
                
            }
            else   if benificiaryType as! Int == 101 {
                self.pushViewController(controller: BenefCashEditVc.initiateController())
                
            }
            else {
                self.pushViewController(controller: BenefWuEditVc.initiateController(),animated: false)
                
            }
            
            
            
            
            //   refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        let disablee = sender.params["isDisable"] ?? false
        if disablee as! Bool == true {
            refreshAlert.addAction(UIAlertAction(title: Global.shared.enableBenefTxt , style: .default, handler: { (action: UIAlertAction!) in
                //   self.showSpinner(onView: self.view)
                self.showLoader()
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "disable": false
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.enableDisableBenefImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        self.removeLoader()
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{

                            self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        
                    }
                }
            }))
        }
        else {
            
            refreshAlert.addAction(UIAlertAction(title: Global.shared.disableBenefTxt, style: .default, handler: { (action: UIAlertAction!) in
                //  self.showSpinner(onView: self.view)
                self.showLoader()
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "disable": true
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.enableDisableBenefImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        self.removeLoader()
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{

                            self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        
                    }
                }
            }))
        }
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.cancelTxt, style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        
        if let popoverPresentationController = refreshAlert.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = sender.bounds
        }
        self.present(refreshAlert, animated: true, completion: nil)
               
        
      //  present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Global.shared.benefCasBankWu = "Bank"
        let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
        
        //  let benefId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        //   BeneficiaryDetails.shared.beneficiaryId = benefId
        
        /*    if let beneficiaryDetails = eachObj?.value(forKey: "beneficiaryDetails") as? String {
         
         print(beneficiaryDetails)
         
         let dataObj = Global.shared.convertToDictionary(text: beneficiaryDetails)
         if let dataDict = dataObj as NSDictionary? {*/
        BeneficiaryDetails.shared.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        BeneficiaryDetails.shared.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
        BeneficiaryDetails.shared.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
        BeneficiaryDetails.shared.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
        BeneficiaryDetails.shared.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
        BeneficiaryDetails.shared.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
        BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.benID = eachObj?.value(forKey: "benID") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        BeneficiaryDetails.shared.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
        BeneficiaryDetails.shared.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
        BeneficiaryDetails.shared.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
        BeneficiaryDetails.shared.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
        BeneficiaryDetails.shared.city = eachObj?.value(forKey: "city") as? String ?? ""
        BeneficiaryDetails.shared.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
        BeneficiaryDetails.shared.country = eachObj?.value(forKey: "country") as? String ?? ""
        BeneficiaryDetails.shared.currency = eachObj?.value(forKey: "currency") as? String ?? ""
        BeneficiaryDetails.shared.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
        BeneficiaryDetails.shared.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
        BeneficiaryDetails.shared.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
        BeneficiaryDetails.shared.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
        BeneficiaryDetails.shared.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
        BeneficiaryDetails.shared.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
        BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
        BeneficiaryDetails.shared.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
        BeneficiaryDetails.shared.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
        BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
        BeneficiaryDetails.shared.mobile = eachObj?.value(forKey: "mobile") as? String ?? ""
        BeneficiaryDetails.shared.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
        BeneficiaryDetails.shared.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
        BeneficiaryDetails.shared.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
        BeneficiaryDetails.shared.remID = eachObj?.value(forKey: "remID")  as? String ?? ""
        BeneficiaryDetails.shared.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
        BeneficiaryDetails.shared.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
        BeneficiaryDetails.shared.state = eachObj?.value(forKey: "state") as? String ?? ""
        BeneficiaryDetails.shared.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
        BeneficiaryDetails.shared.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
        
        //    }
        //    }
        BeneficiaryDetails.shared.quickSend = "Details"
        
        let disablee = eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        if disablee == false {
            self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController())
            
        }
        else {
            let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
        /*  let vc = self.storyboard?.instantiateViewController(identifier: "BenefBankCashNewTransferVc") as! BenefBankCashNewTransferVc
         self.navigationController?.pushViewController(vc, animated: true)*/
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 20), height: CGFloat(150))
   }
    
}
