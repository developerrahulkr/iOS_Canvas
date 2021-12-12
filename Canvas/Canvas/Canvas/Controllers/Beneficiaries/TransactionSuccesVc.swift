//
//  TransactionSuccesVc.swift
//  Canvas
//
//  Created by urmila reddy on 14/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class TransactionSuccesVc: UIViewController {
    //refer another screen to update labels
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    
    @IBOutlet weak var lbl_lebnonMsg: UILabel!
    @IBOutlet weak var secndStackTopConstrt: NSLayoutConstraint!
    @IBOutlet weak var firstStackTopConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var acntBrnchStckHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var acntbranchDetailsHeghtConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var bankNameLbl: UILabel!
    
    @IBOutlet weak var refernceIdLbl: UILabel!
    
    @IBOutlet weak var refernceIdField: UILabel!
    
    @IBOutlet weak var createdDateLbl: UILabel!
    
    @IBOutlet weak var createdDateField: UILabel!
    
    @IBOutlet weak var acountLbl: UILabel!
    
    @IBOutlet weak var acountField: UILabel!
    
    @IBOutlet weak var bankLbl: UILabel!
    
    @IBOutlet weak var bankField: UILabel!
    
    @IBOutlet weak var branchLbl: UILabel!
    
    @IBOutlet weak var branchField: UILabel!
    
    @IBOutlet weak var sourceCurncyLbl: UILabel!
    
    @IBOutlet weak var sourceCurencyField: UILabel!
    
    @IBOutlet weak var sourceTotalAmntLbl: UILabel!
    
    @IBOutlet weak var sourceTotalAmntField: UILabel!
    
    @IBOutlet weak var targetCurencyLbl: UILabel!
    
    @IBOutlet weak var targetCurencyField: UILabel!
    
    @IBOutlet weak var targetTotalAmntLbl: UILabel!
    
    @IBOutlet weak var targetTotalAmntField: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var statusField: UILabel!
    
    @IBOutlet weak var statusImg: UIImageView!
    
    @IBOutlet weak var itemsView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    
    
    @IBOutlet weak var mtcnKeyLbl: UILabel!
    
    @IBOutlet weak var mtcnValueLbl: UILabel!
    var pdfUrl:NSURL!
    
    var pdfString = ""
    
    var pdfNamee = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Global.shared.refreshOrNot = "yes"
        navHeaderLbl.text = Global.shared.navTxtForPayment
        downloadTransactnStatus()
        assigningLabels()
        
        self.nameField.isHidden = false
    }
    
    func assigningLabels() {
       
        //  self.nameField.text = BeneficiaryDetails.shared.firstName
        //  trnsctnIdField.text = "34567897890"
        //   downloadVoucherBtnOtlt.setTitle(Global.shared.transactionsDownloadVoucher, for: .normal)
        //     shareVoucherBtnOtlt.setTitle("Share Voucher", for: .normal)
        
     //   self.navHeaderLbl.text = Global.shared.menuTransactions
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
       // self.lbl_lebnonMsg.text = "abc"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.hidesBottomBarWhenPushed = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.hidesBottomBarWhenPushed = false
    }
    
    /*  @IBAction func bckBtnActn(_ sender: Any) {
     self.navigationController?.popToRootViewController(animated: true)
     
     
     
     //   self.navigationController?.popViewController(animated: true)
     
     }*/
    
    // Mark: Downloading transaction status
    func downloadTransactnStatus() {
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "txnRefNo": BeneficiaryDetails.shared.txnRefNo!, "isRetail": false]
        
        /*
         let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        print(paramaterPasing)
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefTrnsctnStatusImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                if let transctnHistory = resonseTal?.value(forKey: "transactionHistory") as? NSArray {
                    print(transctnHistory)
                    
                    if let transctnHistry = transctnHistory[0] as? NSDictionary
                    {
                    BeneficiaryDetails.shared.txnRef = transctnHistry["txnRefNo"] as? String ?? ""
                    BeneficiaryDetails.shared.beneficiaryId = transctnHistry["beneficiaryId"] as? Int ?? 00
                    BeneficiaryDetails.shared.branchName =  transctnHistry["branchName"] as? String ?? ""
                    self.branchField.text = BeneficiaryDetails.shared.branchName
                    
                    BeneficiaryDetails.shared.accountNumber = transctnHistry["accountNumber"] as? String ?? ""
                    self.acountField.text = BeneficiaryDetails.shared.accountNumber
                    
                    BeneficiaryDetails.shared.remitterEmail = transctnHistry["remitterEmail"] as? String ?? ""
                    BeneficiaryDetails.shared.sourceCurrenyCode = transctnHistry["sourceCurrenyCode"] as? String ?? ""
                    BeneficiaryDetails.shared.targetCurencyCode = transctnHistry["targetCurrenyCode"] as? String ?? ""
                    
                    //undo below lines for decimals
                 /*   var newCurencyData = "10"
                    if let value = transctnHistry["totalLCAmount"] as? Int {
                        newCurencyData = String(value)
                    }else if let value = transctnHistry["totalLCAmount"] as? String {
                        newCurencyData = value
                    }
                    else if let value = transctnHistry["totalLCAmount"] as? Double {
                        newCurencyData = String(value)
                    }
                    BeneficiaryDetails.shared.sourceTotalAmnt = newCurencyData*/
                    
                    BeneficiaryDetails.shared.sourceTotalAmnt = transctnHistry["totalLCAmount"] as? String
                    
                 // BeneficiaryDetails.shared.targetTotalAmnt = transctnHistry["fcAmount"] as? String ?? ""
                    BeneficiaryDetails.shared.transctnStatusText = transctnHistry["statusName"] as? String ?? ""
                    BeneficiaryDetails.shared.bankName = transctnHistry["bankName"] as? String ?? ""
                    
                    
                    //undo below line later
               /*   let targetAmnt = transctnHistry["fcAmount"] as? Int ?? 0
                    BeneficiaryDetails.shared.targetTotalAmnt = String(targetAmnt)*/
                    
                    BeneficiaryDetails.shared.targetTotalAmnt = transctnHistry["fcAmount"] as? String ?? ""
                    self.refernceIdField.text = BeneficiaryDetails.shared.txnRef
            
                    //   self.createdDateField.text = BeneficiaryDetails.shared.createdDatee
                    //   self.sourceCurencyField.text = BeneficiaryDetails.shared.sourceCurrenyCode
                    //   self.targetCurencyField.text = BeneficiaryDetails.shared.targetCurencyCode
                    self.sourceTotalAmntField.text = BeneficiaryDetails.shared.sourceTotalAmnt + " " + BeneficiaryDetails.shared.sourceCurrenyCode
                    self.targetTotalAmntField.text = BeneficiaryDetails.shared.targetTotalAmnt + " " + BeneficiaryDetails.shared.targetCurencyCode
                    self.statusField.text = BeneficiaryDetails.shared.transctnStatusText
                    self.bankField.text = BeneficiaryDetails.shared.bankName
                    self.lbl_lebnonMsg.text = transctnHistry["voucherMessage"] as? String ?? ""
                    
                    
                    let statusType = transctnHistry["status"] as? Int ?? 0
                    
                    BeneficiaryDetails.shared.transctnStatusInt = statusType
                    
                    //pending
                    if statusType == 0 {
                        
                        self.statusImg.image = UIImage(named: "transPending")
                        self.statusView.backgroundColor = ColorCodes.transctnPendingBckgrnd
                        self.statusView.borderColor = ColorCodes.transctnPendingBorder
                        self.statusView.borderWidth = 1
                        self.statusView.cornerRadius = 5
                        self.statusField.textColor = ColorCodes.transctnPendingBorder
                        self.itemsView.isHidden = true
                    }
                        
                        //sucess
                    else if statusType == 1 {
                        self.statusImg.image = UIImage(named: "transCorrect")
                        self.statusView.backgroundColor = ColorCodes.transctnSucesBckgrnd
                        self.statusView.borderColor = ColorCodes.transctnSucesBorder
                        self.statusView.borderWidth = 1
                        self.statusView.cornerRadius = 5
                        self.statusField.textColor = ColorCodes.transctnSucesBorder
                        self.itemsView.isHidden = false
                    }
                        
                        //failed
                    else if statusType == 2 {
                        self.statusImg.image = UIImage(named: "transCross")
                        self.statusView.backgroundColor = ColorCodes.transctnFailBckgrnd
                        self.statusView.borderColor = ColorCodes.transctnFailBorder
                        self.statusView.borderWidth = 1
                        self.statusView.cornerRadius = 5
                        self.statusField.textColor = ColorCodes.transctnFailBorder
                        self.itemsView.isHidden = true
                    }
                    //     self.trnsctnIdField.text = transctnHistry["txnRefNo"] as? String ?? ""
                    BeneficiaryDetails.shared.beneficiaryType = transctnHistry["beneficiaryType"] as? Int ?? 0
                    if BeneficiaryDetails.shared.beneficiaryType == 102 {
                        self.mtcnKeyLbl.text = Global.shared.mtcnn
                        self.mtcnValueLbl.text = transctnHistry["mtcn"] as? String ?? ""
                        self.firstStackTopConstrt.constant = 0
                        self.acntBrnchStckHeightConstrt.constant = 0
                        self.acntbranchDetailsHeghtConstrt.constant = 0
                        self.secndStackTopConstrt.constant = -10
                        
                    }
                    else {
                        self.mtcnKeyLbl.text = Global.shared.ttNumbr
                        self.mtcnValueLbl.text = transctnHistry["ttRefNo"] as? String ?? ""
                        print("no change")
                    }
                    BeneficiaryDetails.shared.firstName = transctnHistry["beneficiaryFirstName"] as? String ?? ""
                    BeneficiaryDetails.shared.middleName = transctnHistry["beneficiaryMiddleName"] as? String ?? ""
                    BeneficiaryDetails.shared.lastName =  transctnHistry["beneficiaryLastName"] as? String ?? ""
                    BeneficiaryDetails.shared.accountNumber = transctnHistry["accountNumber"] as? String ?? ""
                    BeneficiaryDetails.shared.branchName =  transctnHistry["branchName"] as? String ?? ""
                    
                    
                    let data = BeneficiaryDetails.shared
                    /*let fullName = data.firstName + " " + data.middleName + " " + data.lastName
                    self.bankNameLbl.text =  fullName*/
                    
                    let firstName = BeneficiaryDetails.shared.firstName +  " " + BeneficiaryDetails.shared.middleName
                    let lastName = BeneficiaryDetails.shared.lastName ?? ""
                    self.bankNameLbl.text = firstName + " " + lastName
                    
                    
                    data.beneficiaryTypeName = transctnHistry["beneficiaryTypeName"] as? String ?? ""
                    self.nameField.text = Global.shared.serviceOpted + ": " +  data.beneficiaryTypeName
                    
                    let newDate = transctnHistry["createdDate"] as? String ?? ""
                    BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
                    self.createdDateField.text = BeneficiaryDetails.shared.createdDatee
                    
                    data.countryCode = transctnHistry["beneficiaryCountry"] as? String ?? ""
                    self.sourceCurencyField.text = data.sourceCurrenyCode + " (KUWAIT)"
                    
                    let indexS = Global.shared.countryCodesData.firstIndex(of: data.countryCode)
                    let countryName = Global.shared.countryNameData[indexS ?? 0]
                    
                    self.targetCurencyField.text = data.targetCurencyCode + " (" + countryName + ")"
                    
                    self.acountField.text = BeneficiaryDetails.shared.accountNumber
                        self.branchField.text = BeneficiaryDetails.shared.branchName
                    
                    let newDateWithoutTime = Date.getMonthDayYearWithoutTime(newDate) ?? ""
                    
                    
                    
                 let pdfname1 = data.beneficiaryTypeName + "-" + BeneficiaryDetails.shared.txnRef
                    let pdfname2 = "-" + newDateWithoutTime + ".pdf"
                    
                    self.pdfNamee = pdfname1 + pdfname2
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
    
    // Mark: Downloading transaction pdf
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
    
    // Mark: Saving and downloading pdf
    
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
            
           // let document = NSData(contentsOf: pdfDocURL)
            
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [pdfDocURL], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView=self.view
            present(activityViewController, animated: true, completion: nil)
            print("document was not found")
        } catch  {
            print("document was not found")
        }
    }
    
    
    /*  @IBAction func downloadVoucherActn(_ sender: Any) {
     
     downloadTrnsctnPdf()
     }
     
     @IBAction func shareVoucherActn(_ sender: Any) {
     let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefEmailPopUpVc") as! BenefEmailPopUpVc
     self.addChild(popOverVC)
     popOverVC.view.frame = self.view.frame
     self.view.addSubview(popOverVC.view)
     popOverVC.didMove(toParent: self)
     }
     
     
     
     @IBAction func doneBtnActn(_ sender: Any) {
     let vc = self.storyboard?.instantiateViewController(identifier: "CustomTabBarVc") as! CustomTabBarVc
     vc.modalPresentationStyle = .fullScreen
     self.present(vc, animated: true, completion: nil)
     }*/
    
    
  @IBAction func sendNowActn(_ sender: Any) {
    let benificiaryType = BeneficiaryDetails.shared.beneficiaryType
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
     // self.pushViewController(controller: BenefWuNewTrnsferVc.initiateController(),animated: false)
      
    }
    
    
  }
    @IBAction func sendMailBtnActn(_ sender: Any) {
        if BeneficiaryDetails.shared.transctnStatusInt == 0 {
            
            let alert = ViewControllerManager.displayAlert(message: "Share Voucher option is available only for successful transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            //success
        else if BeneficiaryDetails.shared.transctnStatusInt == 1 {
            let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefEmailPopUpVc") as! BenefEmailPopUpVc
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
            //failed
        else if BeneficiaryDetails.shared.transctnStatusInt == 2 {
            let alert = ViewControllerManager.displayAlert(message: "Share Voucher option is available only for successful transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func downloadPdfActn(_ sender: Any) {
        if BeneficiaryDetails.shared.transctnStatusInt == 0 {
            
            let alert = ViewControllerManager.displayAlert(message: "Download voucher option is available only for successful transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            //success
        else if BeneficiaryDetails.shared.transctnStatusInt == 1 {
            downloadTrnsctnPdf()
        }
            //failed
        else if BeneficiaryDetails.shared.transctnStatusInt == 2 {
            let alert = ViewControllerManager.displayAlert(message: "Download voucher option is available only for successful transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    @IBAction func bckMenuActn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
}
