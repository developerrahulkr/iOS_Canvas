//
//  TransctionsFullDetailsVc.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire


class TransctionsFullDetailsVc: UIViewController {
    
    @IBOutlet weak var lbl_lebnonMsg: UILabel!
    
    @IBOutlet weak var navHederLbl: UILabel!
    @IBOutlet weak var refernceIdLbl: UILabel!
    @IBOutlet weak var createdDateLbl: UILabel!
    @IBOutlet weak var acountLbl: UILabel!
    @IBOutlet weak var bankLbl: UILabel!
    @IBOutlet weak var branchLbl: UILabel!
    @IBOutlet weak var sourceCurncyLbl: UILabel!
    @IBOutlet weak var sourceTotalAmntLbl: UILabel!
    @IBOutlet weak var targetCurencyLbl: UILabel!
    @IBOutlet weak var targetTotalAmntLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    @IBOutlet weak var secndStackTopConstrt: NSLayoutConstraint!
    @IBOutlet weak var firstStackTopConstrt: NSLayoutConstraint!
    @IBOutlet weak var acntBrnchStckHeightConstrt: NSLayoutConstraint!
    @IBOutlet weak var acntbranchDetailsHeghtConstrt: NSLayoutConstraint!
    @IBOutlet weak var nameField: UILabel!
    
  @IBOutlet weak var bankNameLbl: UILabel!
  
    
    @IBOutlet weak var refernceIdField: UILabel!
    
    
    
    @IBOutlet weak var createdDateField: UILabel!
    
   
    
    @IBOutlet weak var acountField: UILabel!
    
    
    
    @IBOutlet weak var bankField: UILabel!
    
    
    
    @IBOutlet weak var branchField: UILabel!
    
    
    
    @IBOutlet weak var sourceCurencyField: UILabel!
    
    
    
    @IBOutlet weak var sourceTotalAmntField: UILabel!
    
   
    
    @IBOutlet weak var targetCurencyField: UILabel!
    
    
    
    @IBOutlet weak var targetTotalAmntField: UILabel!
    
   
    
    @IBOutlet weak var statusField: UILabel!
    
    @IBOutlet weak var statusImg: UIImageView!
    
  @IBOutlet weak var itemsView: UIView!
  @IBOutlet weak var statusView: UIView!
    
    
    @IBOutlet weak var mtcnKeyLbl: UILabel!
    
    @IBOutlet weak var mtcnValueLbl: UILabel!
    
    
    
    var pdfUrl:NSURL!
     
     var pdfString = ""
    
    var pdfNamee = "transaction.pdf"
    
    //Transaction details
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
        Global.shared.countrysChangeAccordingly = "Any"
        
        
        // Do any additional setup after loading the view.
      
        
        
        //pending
        if BeneficiaryDetails.shared.transctnStatusInt == 0 {
            
            self.statusImg.image = UIImage(named: "transPending")
            self.statusView.backgroundColor = ColorCodes.transctnPendingBckgrnd
            self.statusView.borderColor = ColorCodes.transctnPendingBorder
            self.statusView.borderWidth = 1
            self.statusView.cornerRadius = 5
            self.statusField.textColor = ColorCodes.transctnPendingBorder
          itemsView.isHidden = true
        }
            
            //sucess
        else if BeneficiaryDetails.shared.transctnStatusInt == 1 && BeneficiaryDetails.shared.isRetail == false {
            self.statusImg.image = UIImage(named: "transCorrect")
            self.statusView.backgroundColor = ColorCodes.transctnSucesBckgrnd
            self.statusView.borderColor = ColorCodes.transctnSucesBorder
            self.statusView.borderWidth = 1
            self.statusView.cornerRadius = 5
            self.statusField.textColor = ColorCodes.transctnSucesBorder
          itemsView.isHidden = false

        }
            
            //failed
        else if BeneficiaryDetails.shared.transctnStatusInt == 2 {
            self.statusImg.image = UIImage(named: "transCross")
            self.statusView.backgroundColor = ColorCodes.transctnFailBckgrnd
            self.statusView.borderColor = ColorCodes.transctnFailBorder
            self.statusView.borderWidth = 1
            self.statusView.cornerRadius = 5
            self.statusField.textColor = ColorCodes.transctnFailBorder
          itemsView.isHidden = true

        }
        //cancelled
        else if BeneficiaryDetails.shared.transctnStatusInt == 3 {
            self.statusImg.image = UIImage(named: "transCross")
            self.statusView.backgroundColor = ColorCodes.transctnFailBckgrnd
            self.statusView.borderColor = ColorCodes.transctnFailBorder
            self.statusView.borderWidth = 1
            self.statusView.cornerRadius = 5
            self.statusField.textColor = ColorCodes.transctnFailBorder
          itemsView.isHidden = true

        }
        else {
            self.statusImg.image = UIImage(named: "transCorrect")
            self.statusView.backgroundColor = ColorCodes.transctnSucesBckgrnd
            self.statusView.borderColor = ColorCodes.transctnSucesBorder
            self.statusView.borderWidth = 1
            self.statusView.cornerRadius = 5
            self.statusField.textColor = ColorCodes.transctnSucesBorder
          itemsView.isHidden = true

        }
        
        //pending
    /*    if BeneficiaryDetails.shared.transctnStatusInt == 0 {
            downloadVoucherBtnOtlt.isHidden = true
            sendTopConstrt.constant = 20
        }
            //success
        else if BeneficiaryDetails.shared.transctnStatusInt == 1 {
            downloadVoucherBtnOtlt.isHidden = false
            sendTopConstrt.constant = 95
        }
            //failed
        else if BeneficiaryDetails.shared.transctnStatusInt == 2 {
            downloadVoucherBtnOtlt.isHidden = true
            sendTopConstrt.constant = 20
        }*/
        
        self.nameField.isHidden = false
        
        DispatchQueue.main.async {
            self.assigningLabels()
        }
        
    }
    
    func assigningLabels() {
        self.acountField.text = BeneficiaryDetails.shared.accountNumber
            self.branchField.text = BeneficiaryDetails.shared.branchName
        self.navHederLbl.text = Global.shared.menuTransactions
        
         self.refernceIdLbl.text = Global.shared.voucherNumber
         self.createdDateLbl.text = Global.shared.transactionsCreatedDate
         self.acountLbl.text = Global.shared.accountNumberVoucher
         self.bankLbl.text = Global.shared.bankNameVoucher
         self.branchLbl.text = Global.shared.branchNameVoucher
        
         self.sourceCurncyLbl.text =  Global.shared.transactionsSourceCurrency
        
         self.sourceTotalAmntLbl.text = Global.shared.sourceAmntTxtt
         self.targetCurencyLbl.text = Global.shared.transactionsTargetCurrency
         self.targetTotalAmntLbl.text = Global.shared.targetAmntTxtt
        
         self.statusLbl.text = Global.shared.transactionsStatus
        
        
        
        self.refernceIdField.text = BeneficiaryDetails.shared.txnRef
        self.createdDateField.text = BeneficiaryDetails.shared.createdDatee
        self.lbl_lebnonMsg.text = BeneficiaryDetails.shared.voucherMsg
       
        
        
        
        self.sourceTotalAmntField.text = BeneficiaryDetails.shared.sourceTotalAmnt + " " + BeneficiaryDetails.shared.sourceCurrenyCode
        self.targetTotalAmntField.text = BeneficiaryDetails.shared.targetTotalAmnt + " " + BeneficiaryDetails.shared.targetCurencyCode
        self.statusField.text = BeneficiaryDetails.shared.transctnStatusText
        self.bankField.text = BeneficiaryDetails.shared.bankName
      let data = BeneficiaryDetails.shared
      let fullName = data.firstName + " " + data.middleName + " " + data.lastName
      self.bankNameLbl.text =  fullName
      self.nameField.text =  Global.shared.serviceOpted + ": " + data.beneficiaryTypeName
        
        
        
        
         self.sourceCurencyField.text = data.sourceCurrenyCode + " (KUWAIT)"
      //  let indexS = Global.shared.countryCodesData.firstIndex(of: data.countryCode)
      // let countryName = Global.shared.countryNameData[indexS ?? 0]
        
        
        self.targetCurencyField.text = data.targetCurencyCode + " (" + data.countryCode + ")"
        
        if data.beneficiaryType == 102 {
            self.mtcnKeyLbl.text = Global.shared.mtcnn
            self.mtcnValueLbl.text = BeneficiaryDetails.shared.mtcn
            firstStackTopConstrt.constant = 0
            acntBrnchStckHeightConstrt.constant = 0
            acntbranchDetailsHeghtConstrt.constant = 0
            secndStackTopConstrt.constant = -10
            
        }
        else {
            self.mtcnKeyLbl.text = Global.shared.ttNumbr
            self.mtcnValueLbl.text = BeneficiaryDetails.shared.ttRefNottn
            print("no change")
        }

      

    }
    
    @IBAction func bckMenuActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
//        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//        refreshAlert.view.tintColor = ColorCodes.newAppRed
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//           self.pushViewController(controller: LoginVc.initiateController())
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//              refreshAlert.dismiss(animated: true, completion: nil)
//
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
        
    }
    
   
    @IBAction func sendNowActn(_ sender: Any) {
     
         /*   let benificiaryType = BeneficiaryDetails.shared.beneficiaryType
                 if benificiaryType == 100 || benificiaryType == 101 {
                  self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController(),animated: false)
                 }
                 else {
                    Global.shared.fraudPopUpDirectWu = "Normal"
                 
                    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                 self.addChild(popOverVC)
                                 popOverVC.view.frame = self.view.frame
                                 self.view.addSubview(popOverVC.view)
                                 popOverVC.didMove(toParent: self)
               //   self.pushViewController(controller: BenefWuNewTrnsferVc.initiateController(), animated: false)
                    
                     
                 }*/
            downloadBeneficiaryPurpose()
          
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
        Global.shared.countrysChangeAccordingly = "Any"
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func sendMailBtnActn(_ sender: Any) {
      
           let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefEmailPopUpVc") as! BenefEmailPopUpVc
                self.addChild(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
       
    }
    
    
    //download pdf nothing but download voucher
    
    @IBAction func downloadPdfActn(_ sender: Any) {
       
                    downloadTrnsctnPdf()
            
    }
    
    
    // Mark: For getting pdf
    func downloadTrnsctnPdf() {
        
        self.showSpinner(onView: self.view)
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0,
                                             "txnRefNo": BeneficiaryDetails.shared.txnRef ?? "",
                                             "languageCode": LocalizationSystem.sharedInstance.getLanguage()]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

        
        NetWorkDataManager.sharedInstance.benefVoucherPdfImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                print(resonseTal!)
                
                self.pdfString = resonseTal?.value(forKey: "voucherPdf") as? String ?? ""
                
                do {
                    try self.savePdf()
                    self.loadPDFAndShare()
                } catch  {
                    print("FAiled to load PDF")
                }
                
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
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func savePdf() throws {
        let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let pdfDocURL = documentsURL.appendingPathComponent(pdfNamee)
        let pdfData = Data(base64Encoded: pdfString)
        try pdfData!.write(to: pdfDocURL)
        pdfUrl = pdfDocURL as NSURL
        
    }
    
    func loadPDFAndShare(){
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let pdfDocURL = documentsURL.appendingPathComponent(pdfNamee)
            
            //let document = NSData(contentsOf: pdfDocURL)
            
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [pdfDocURL], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView=self.view
            present(activityViewController, animated: true, completion: nil)
            print("document was not found")
        } catch  {
            print("document was not found")
        }
    }
    
    func downloadBeneficiaryPurpose() {
        
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            //test
            if errorString == nil
            {
               // print(resonseTal)
                self.removeSpinner()
               
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                    
                    if benList.count < 1 {
                        let alert = ViewControllerManager.displayAlert(message:  Global.shared.benefDatNotAvailble, title:APPLICATIONNAME)
                                       self.present(alert, animated: true, completion: nil)
                    }
                   
                   
                    else  {
                        
                        let isDisable = (benList[0] as AnyObject).value(forKey: "isDisable") as? Bool ?? false
                       if isDisable == true  {
                             let alert = ViewControllerManager.displayAlert(message:  Global.shared.repetFailedPendingTxt, title:APPLICATIONNAME)
                             self.present(alert, animated: true, completion: nil)
                         }
                        
                       else {
                            let benificiaryType = BeneficiaryDetails.shared.beneficiaryType
                                 if benificiaryType == 100 || benificiaryType == 101 {
                                    let disablee = BeneficiaryDetails.shared.enableOrDisable
                                    
                                    if disablee == false {
                                        self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController(),animated: false)

                                    }
                                    else {
                                        let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                              //    self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController(),animated: false)
                                 }
                                 else {
                                    
                                    let disablee = BeneficiaryDetails.shared.enableOrDisable
                                    
                                    if disablee == false {
                                        Global.shared.fraudPopUpDirectWu = "Normal"
                                     
                                        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                                     self.addChild(popOverVC)
                                                     popOverVC.view.frame = self.view.frame
                                                     self.view.addSubview(popOverVC.view)
                                                     popOverVC.didMove(toParent: self)

                                    }
                                    else {
                                        let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
                                        self.present(alert, animated: true, completion: nil)
                                        
                                    }
                                   
                               //   self.pushViewController(controller: BenefWuNewTrnsferVc.initiateController(), animated: false)
                                    
                                     
                                 }
                          
                        }
                }
                    }
                
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
                }
       
            
                
            else {
                            print(errorString!)
                       
                            self.removeSpinner()
                         
                        }

        }
    }
    
}
