//
//  TransactionsByDateVc.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class TransactionsByDateVc: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fromDateLbl: UILabel!
    
    @IBOutlet weak var fromDateField: UILabel!
    
    @IBOutlet weak var toDateLbl: UILabel!
    
    @IBOutlet weak var toDateField: UILabel!
    
    @IBOutlet weak var transctnTbleView: UITableView!
    
    
    @IBOutlet weak var downloadBtnOtltt: UIButton!
    
    @IBOutlet weak var downloadPdfBtnOtlt: UIButton!
    
    @IBOutlet weak var downloadXlsBtnOtlt: UIButton!
    
    @IBOutlet weak var noRecordsFoundTxt: UILabel!
    
    
    var expandOneClick = true
    
    var transactionFilterType = 0
    var filterNameData = [String]()
    var filterValueData = [String]()
    
    
    var periodNameData = [String]()
    var periodValueData = [String]()
    var pickerPeriodData = [[String: String]]()
    
    var periodType = 0
    
    var fromDateValue:String!
    var toDateValue:String!
    
    var pdfUrl:NSURL!
    var excelUrl:NSURL!
    
    var pdfString = ""
    var excelString = ""
    
    var beneficiaryResponse = [Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        noRecordsFoundTxt.isHidden = true
        noRecordsFoundTxt.text =  Global.shared.noRecordsFoundTxt
        configureCells()
        self.downloadPdfBtnOtlt.isHidden = true
                                 self.downloadXlsBtnOtlt.isHidden = true
        
        transctnTbleView.rowHeight = 120
        fromDateValue = nil
        toDateValue = nil
      //  downloadBenefConfig()
        
        self.transctnTbleView.isHidden = true
        self.noRecordsFoundTxt.isHidden = false
        
        assigningLabels()
    }
    
    func assigningLabels() {
        self.fromDateLbl.text = Global.shared.transactionsFromDate
        self.toDateLbl.text = Global.shared.transactionsToDate
    }
    
  func configureCells() {
       let nib = UINib(nibName: "TransctionPeriodCell", bundle: Bundle.main)
       transctnTbleView.register(nib, forCellReuseIdentifier: TransctionPeriodCell.identifier)

     }
    @IBAction func fromDateActn(_ sender: Any) {
        
        DatePickerDialog().show(Global.shared.transactionsFromDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.fromDateField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.fromDateValue = formatter.string(from: dt)
                
                //     self.fromDateReqLbl.isHidden = true
                
               
                
                if self.fromDateField.text == ""  || self.toDateField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateValue > self.toDateValue {
                    self.fromDateField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadTransactnFilterDetails()
                }
            }
        }
        
        
    }
    
    @IBAction func toDateActn(_ sender: Any) {
        
        DatePickerDialog().show(Global.shared.transactionsToDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.toDateField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.toDateValue = formatter.string(from: dt)
                
                
                //    self.toDateReqLbl.isHidden = true
                
                if self.fromDateField.text == ""  || self.toDateField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateValue > self.toDateValue {
                    self.toDateField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadTransactnFilterDetails()
                }
                
            }
        }
    }
    
  /*  func downloadBenefConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let identityTypes = resonseTal?.value(forKey: "transactionFilterTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: identityTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            self.filterNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            self.filterValueData.append(type)
                        }
                    }
                }
                
                if let periodType = resonseTal?.value(forKey: "transactionPeriods") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: periodType)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            self.periodNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            self.periodValueData.append(type)
                        }
                    }
                }
                
                for i in 0..<self.periodNameData.count {
                    self.pickerPeriodData.append(["value": self.periodValueData[i], "display": self.periodNameData[i]])
                }
                
                self.transactionFilterType = Int(self.filterValueData[0]) ?? 1
                
             //   self.downloadTransactnFilterDetails()
            }
                
            else
            {
                            print(errorString!)
                           
                            self.removeSpinner()
                         
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
                                refreshAlert.view.tintColor = ColorCodes.newAppRed
                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
                                   self.pushViewController(controller: LoginVc.initiateController())
                                }))
                                
                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }
                    
        }
        
    }
    */
    func downloadTransactnFilterDetails() {
        
        self.beneficiaryResponse.removeAll()
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "filterType": 1,
                                             "fromDate": fromDateValue!,
                                             "toDate": toDateValue!,
                                             "period": periodType]
        
        
    /*    let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        self.showSpinner(onView: self.view)
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefTransctnFilterImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.removeSpinner()
            if errorString == nil
            {
                
                
                print(resonseTal!)
                if let transactionHistory = resonseTal?.value(forKey: "transactionHistory") as? NSArray {
                    print(transactionHistory)
                    /*  UserDefaults.standard.set(transactionHistory, forKey: "TransactionHistoryLocal")
                     let tableData  =  UserDefaults.standard.object(forKey: "TransactionHistoryLocal") ?? []
                     print(tableData)*/
                    
                    
                    
                    self.beneficiaryResponse = transactionHistory as! [Any]
                    if self.beneficiaryResponse.count < 1 {
                        self.transctnTbleView.isHidden = true
                        self.noRecordsFoundTxt.isHidden = false
                    }
                    else {
                        self.noRecordsFoundTxt.isHidden = true
                        self.transctnTbleView.isHidden = false
                        
                    }
                    
                    /*    let newV:[Any] = transactionHistory as! [Any]
                     print(newV)
                     
                     let transactnData = NSKeyedArchiver.archivedData(withRootObject: newV)
                     UserDefaults.standard.set(transactnData, forKey: "TransactionHistoryLocal")*/
                    
                }
                self.transctnTbleView.reloadData()
                //   self.loadPlaces()
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
                         
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                   self.pushViewController(controller: LoginVc.initiateController())
//                                }))
//
//                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

        }
        
    }
    
    func loadTransactionLocalData(){
        let transactnData = UserDefaults.standard.object(forKey: "TransactionHistoryLocal") as? NSData
        
        if let transactnData = transactnData {
            let transctnArray = NSKeyedUnarchiver.unarchiveObject(with: transactnData as Data)
            
         //   print(transctnArray)
            
            self.beneficiaryResponse = transctnArray as! [Any]
            self.transctnTbleView.reloadData()
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beneficiaryResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: TransctionPeriodCell.identifier)! as! TransctionPeriodCell
      let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
        cell.btn_transaction.tag = indexPath.row
        cell.btn_transaction.addTarget(self, action: #selector(TransStatusActn(sender:)), for: .touchUpInside)
      cell.setupData(eachObj)
//        let cell = transctnTbleView.dequeueReusableCell(withIdentifier: "TransctnByDateCell")! as! TransctnByDateCell
//        let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
//
//
//        cell.benfId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
//        cell.nameLbl.text = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
//
//        var newCurencyData = "10"
//                     if let value = eachObj?["totalLCAmount"] as? Int {
//                         newCurencyData = String(value)
//                     }else if let value = eachObj?["totalLCAmount"] as? String {
//                         newCurencyData = value
//                     }
//                     else if let value = eachObj?["totalLCAmount"] as? Double {
//                         newCurencyData = String(value)
//                     }
//
//                     cell.amntLbl.text = newCurencyData
//
//
//      //  cell.amntLbl.text = String(eachObj?.value(forKey: "totalLCAmount") as? Int ?? 0)
//        let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
//        let finalDate = newDate.components(separatedBy: "T")
//        let dateN = finalDate[0]
//        let fullDate = dateN.components(separatedBy: "-")
//        let yearN = fullDate[0]
//        let monthN = fullDate[1]
//        let finalDateN = fullDate[2]
//
//        let displayDate = finalDateN + "-" + monthN + "-" + yearN
//        cell.dateLbl.text = displayDate
//
//        let sourceCurency = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
//        let targetCurency = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
//        cell.accountNumbrLbl.text = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
//
//        let finalCurency = sourceCurency + ">" + targetCurency
//
//     //   cell.curencyLbl.text = finalCurency
//         cell.curencyLbl.text = eachObj?.value(forKey: "bankName") as? String ?? ""
//
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    @objc func TransStatusActn(sender: UIButton?){
        
        let eachObj = self.beneficiaryResponse[sender!.tag] as? NSDictionary
        
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        BeneficiaryDetails.shared.mtcn = eachObj?.value(forKey: "mtcn") as? String ?? ""
        BeneficiaryDetails.shared.ttRefNottn = eachObj?.value(forKey: "ttRefNo") as? String ?? ""
    
        let lcAmnt =  eachObj?.value(forKey: "lcAmount") as? String  ?? "0"
        let doubleLcAmnt = Double(lcAmnt)
        BeneficiaryDetails.shared.lcAmntQuickSend = doubleLcAmnt
        BeneficiaryDetails.shared.quickSend = "Quick"
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        BeneficiaryDetails.shared.isRetail = eachObj?.value(forKey: "isRetail") as? Bool ?? false
        BeneficiaryDetails.shared.remitterEmail = eachObj?.value(forKey: "remitterEmail") as? String ?? ""
        
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
        BeneficiaryDetails.shared.sourceCurrenyCode = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.targetCurencyCode = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryTypeName = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
        BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
               BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "beneficiaryMiddleName") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "beneficiaryLastName") as? String ?? ""
        BeneficiaryDetails.shared.voucherMsg = eachObj?.value(forKey: "voucherMessage") as? String ?? ""
 
        BeneficiaryDetails.shared.sourceTotalAmnt = eachObj?["totalLCAmount"] as? String ?? ""
        
        BeneficiaryDetails.shared.targetTotalAmnt =  eachObj?["fcAmount"] as? String ?? ""
        
        BeneficiaryDetails.shared.countryCode = eachObj?.value(forKey: "beneficiaryCountry") as? String ?? ""
        BeneficiaryDetails.shared.enableOrDisable = eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
        
        if newDate.contains(".") {
         BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
        }
        else {
            BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearWithoutSecndsString(newDate)
        }
        BeneficiaryDetails.shared.transctnStatusText = eachObj?.value(forKey: "statusName") as? String ?? ""
        BeneficiaryDetails.shared.transctnStatusInt = eachObj?.value(forKey: "status") as? Int ?? 0
        
        BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        
        let txnNo = eachObj?.value(forKey: "txnRefNo") as! String
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = [
            "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
            "txnNo":txnNo
        ]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.transactionEnquiryImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal)
                self.removeSpinner()
                
            let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200 {
                        BeneficiaryDetails.shared.transactionStatus = resonseTal?.value(forKey: "transactionStatus") as? String ?? ""
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionStatusController") as! TransactionStatusController
                        self.present(vc, animated: true, completion: nil)
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
              //  Global.shared.methodName = CanvasUrls.ttRateCalculator
              //  NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: finalError?[0] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
        let status = eachObj?.value(forKey: "status") as? Int ?? 0
        if status == 1
        {
           
            return 120
        }
        else{
            return 90
        }
        
    }
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 67
  }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
        
        
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        BeneficiaryDetails.shared.mtcn = eachObj?.value(forKey: "mtcn") as? String ?? ""
        BeneficiaryDetails.shared.ttRefNottn = eachObj?.value(forKey: "ttRefNo") as? String ?? ""
        
    /*    let lcAmntt = eachObj?.value(forKey: "lcAmount") as? String ?? "0"
        BeneficiaryDetails.shared.lcAmntQuickSend = Int(lcAmntt)*/
        
        let lcAmnt =  eachObj?.value(forKey: "lcAmount") as? String  ?? "0"
        let doubleLcAmnt = Double(lcAmnt)
        BeneficiaryDetails.shared.lcAmntQuickSend = doubleLcAmnt
        
     //   BeneficiaryDetails.shared.lcAmntQuickSend = eachObj?.value(forKey: "lcAmount") as? Int ?? 0
        BeneficiaryDetails.shared.quickSend = "Quick"
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        BeneficiaryDetails.shared.isRetail = eachObj?.value(forKey: "isRetail") as? Bool ?? false
        BeneficiaryDetails.shared.remitterEmail = eachObj?.value(forKey: "remitterEmail") as? String ?? ""
        
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
        BeneficiaryDetails.shared.sourceCurrenyCode = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.targetCurencyCode = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryTypeName = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
       BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
               BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "beneficiaryMiddleName") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "beneficiaryLastName") as? String ?? ""
        BeneficiaryDetails.shared.voucherMsg = eachObj?.value(forKey: "voucherMessage") as? String ?? ""
     /*   var newCurencyData = "10"
             if let value = eachObj?["totalLCAmount"] as? Int {
                 newCurencyData = String(value)
             }else if let value = eachObj?["totalLCAmount"] as? String {
                 newCurencyData = value
             }
             else if let value = eachObj?["totalLCAmount"] as? Double {
                 newCurencyData = String(value)
             }*/
             
           //  let finalCurency = newCurencyData + " " + curencyName
             
             
             //   let finalCurency = String(eachObj?.value(forKey: "totalLCAmount") as? Int ?? 10) + " " + curencyName
           //  BeneficiaryDetails.shared.sourceTotalAmnt = newCurencyData
        BeneficiaryDetails.shared.sourceTotalAmnt = eachObj?["totalLCAmount"] as? String ?? ""
        
        
   //     BeneficiaryDetails.shared.sourceTotalAmnt = String(eachObj?.value(forKey: "totalLCAmount") as? Int ?? 0)
        
     /*   var newCurencyTarget = "10"
        if let value = eachObj?["fcAmount"] as? Int {
            newCurencyTarget = String(value)
        }else if let value = eachObj?["fcAmount"] as? String {
            newCurencyTarget = value
        }
        else if let value = eachObj?["fcAmount"] as? Double {
            newCurencyTarget = String(value)
        }*/
        
         BeneficiaryDetails.shared.targetTotalAmnt =  eachObj?["fcAmount"] as? String ?? ""
        
       BeneficiaryDetails.shared.countryCode = eachObj?.value(forKey: "beneficiaryCountry") as? String ?? ""
        BeneficiaryDetails.shared.enableOrDisable = eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        
    //    BeneficiaryDetails.shared.targetTotalAmnt = eachObj?.value(forKey: "fcAmount") as? String ?? ""
        
      let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
        
        if newDate.contains(".") {
         BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
        }
        else {
            BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearWithoutSecndsString(newDate)
        }
        //  BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
        
        BeneficiaryDetails.shared.transctnStatusText = eachObj?.value(forKey: "statusName") as? String ?? ""
        BeneficiaryDetails.shared.transctnStatusInt = eachObj?.value(forKey: "status") as? Int ?? 0
        
        BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
       self.pushViewController(controller: TransctionsFullDetailsVc.initiateController(), animated: true)
    }
    
    @IBAction func downloadBtnActn(_ sender: Any) {
        if(expandOneClick == true) {
                          
                   self.downloadPdfBtnOtlt.isHidden = false
                   self.downloadXlsBtnOtlt.isHidden = false
                          
                      } else {
                          self.downloadPdfBtnOtlt.isHidden = true
                          self.downloadXlsBtnOtlt.isHidden = true
                          
                      }
                      
                      expandOneClick = !expandOneClick
      }
      
      @IBAction func pdfActn(_ sender: Any) {
        downloadTrnsctnPdf()
      }
      
      
      @IBAction func xlsActn(_ sender: Any) {
        downloadTrnsctnExcel()
      }
    
    // Mark: For getting pdf data
     func downloadTrnsctnPdf() {
        self.showSpinner(onView: self.view)
              let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                                   "filterType": 1,
                                                   "fromDate": fromDateValue!,
                                                   "toDate": toDateValue!,
                                                   "period": periodType,
                                                   "downloadFormat": 1]
              
              
           /*   let headers: HTTPHeaders = [
                  "Content-Type": "application/json"
              ]*/
              
              let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
              
              NetWorkDataManager.sharedInstance.benefTransctnPdfImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                  
                  if errorString == nil
                  {
                      
                      print(resonseTal!)
                      self.pdfString = resonseTal?.value(forKey: "transactionPdf") as? String ?? ""
                      
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
          
    // Mark: for getting excel data
          func downloadTrnsctnExcel() {
            self.showSpinner(onView: self.view)
              
              let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                                   "filterType": 1,
                                                   "fromDate": fromDateValue!,
                                                   "toDate": toDateValue!,
                                                   "period": periodType,
                                                   "downloadFormat": 2]
              
              
          /*    let headers: HTTPHeaders = [
                  "Content-Type": "application/json"
              ]*/
              
              let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
              
              NetWorkDataManager.sharedInstance.benefTransctnPdfImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                  
                  if errorString == nil
                  {
                      
                      print(resonseTal!)
                      
                      self.excelString = resonseTal?.value(forKey: "transactionExcel") as? String ?? ""
                      do {
                          try self.saveExcel()
                          //   self.loadExcelAndShare()
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
          
    // Mark: for saving pdf
          func savePdf() throws {
            self.removeSpinner()
              let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
              let pdfDocURL = documentsURL.appendingPathComponent("transaction.pdf")
              let pdfData = Data(base64Encoded: pdfString)
              try pdfData!.write(to: pdfDocURL)
              pdfUrl = pdfDocURL as NSURL
          }
          
          func loadPDFAndShare(){
              do {
                  let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                  let pdfDocURL = documentsURL.appendingPathComponent("transaction.pdf")
                  
                  let document = NSData(contentsOf: pdfDocURL)
                  let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [document!], applicationActivities: nil)
                  activityViewController.popoverPresentationController?.sourceView=self.view
                  present(activityViewController, animated: true, completion: nil)
                  print("document was not found")
              } catch  {
                  print("document was not found")
              }
          }
          
          
          func saveExcel() throws {
            self.removeSpinner()
              let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
              let pdfDocURL = documentsURL.appendingPathComponent("./categories.xlsx")
              let pdfData = Data(base64Encoded: excelString)
              try pdfData!.write(to: pdfDocURL)
              excelUrl = pdfDocURL as NSURL
              
            self.pushViewController(controller: PdfVc.initiateController(), animated: false)
          
              //   Global.shared.pdfUrl = pdfUrl
              Global.shared.pdfUrl = excelUrl
              
              
              
              /*      let url = excelUrl
               
               let urlRequest = NSURLRequest(url: url! as URL)
               
               NSURLConnection.sendAsynchronousRequest(urlRequest as URLRequest, queue: OperationQueue.main, completionHandler: {
               response, data, error in
               
               if error != nil {
               print("There was an error")
               
               } else {
               print(data)
               }
               })*/
              
              
          }
          
          func loadExcelAndShare(){
              do {
                  let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                  let pdfDocURL = documentsURL.appendingPathComponent("./categories.xlsx")
                  
                  let document = NSData(contentsOf: pdfDocURL)
                  let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [document!], applicationActivities: nil)
                  activityViewController.popoverPresentationController?.sourceView=self.view
                  present(activityViewController, animated: true, completion: nil)
                  print("document was not found")
              } catch  {
                  print("document was not found")
              }
          }
        
    }
