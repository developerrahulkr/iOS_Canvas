//
//  TransctionsByPeriodVc.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class TransctionsByPeriodVc: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var oneMonthBtnOtlt: UIButton!
    
    @IBOutlet weak var threeMonthBtnOtlt: UIButton!
    
    @IBOutlet weak var sixMonthBtnOtlt: UIButton!
    
    @IBOutlet weak var oneYearBtnOtlt: UIButton!
    
    @IBOutlet weak var periodTbleView: UITableView!
    
    
    
    @IBOutlet weak var downloadBtnOtlt: UIButton!
    
    @IBOutlet weak var pdfBtnOtlt: UIButton!
    
    
    @IBOutlet weak var xlsBtnOtlt: UIButton!
    
    @IBOutlet weak var noRecrdsFoundTxt: UILabel!
    
    var expandOneClick = true
    
    
    var transactionFilterType = 0
    var filterNameData = [String]()
    var filterValueData = [String]()
    
    
    var periodNameData = [String]()
    var periodValueData = [String]()
    
    var periodType = 0
    
    var fromDateValue:String!
    var toDateValue:String!
    
    var pdfUrl:NSURL!
    var excelUrl:NSURL!
    
    var pdfString = ""
    var excelString = ""
    
    var beneficiaryResponse = [Any]()
    
    var oneMnth = Global.shared.oneMonthTxt
    var threeMnth = Global.shared.threeMonthTxt
    var sixMnth = Global.shared.sixMonthTxt
    var oneYear = Global.shared.oneYearTxt
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        noRecrdsFoundTxt.isHidden = true
        configureCells()
        noRecrdsFoundTxt.text =  Global.shared.noRecordsFoundTxt
        self.pdfBtnOtlt.isHidden = true
        self.xlsBtnOtlt.isHidden = true
        
        periodTbleView.rowHeight = 67
        fromDateValue = nil
        toDateValue = nil
       // downloadBenefConfig()
        self.periodType = 30
        downloadTransactnFilterDetails()
        
        oneMonthBtnOtlt.setTitle(oneMnth, for: .normal)
        threeMonthBtnOtlt.setTitle(threeMnth, for: .normal)
        sixMonthBtnOtlt.setTitle(sixMnth, for: .normal)
        oneYearBtnOtlt.setTitle(oneYear, for: .normal)
        
        
        oneMonthBtnOtlt.layer.cornerRadius = oneMonthBtnOtlt.frame.height / 2
        threeMonthBtnOtlt.layer.cornerRadius = threeMonthBtnOtlt.frame.height / 2
        sixMonthBtnOtlt.layer.cornerRadius = sixMonthBtnOtlt.frame.height / 2
        oneYearBtnOtlt.layer.cornerRadius = oneYearBtnOtlt.frame.height / 2
        
        
        oneMonthBtnOtlt.borderColor = ColorCodes.newAppRed
        threeMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        sixMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        oneYearBtnOtlt.borderColor = ColorCodes.newAppGray
        
        oneMonthBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
        threeMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        sixMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        oneYearBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
    }
    
    func configureCells() {
      let nib = UINib(nibName: "TransctionPeriodCell", bundle: Bundle.main)
      periodTbleView.register(nib, forCellReuseIdentifier: TransctionPeriodCell.identifier)

    }
    
    @IBAction func oneMonthBtnActn(_ sender: Any) {
        self.periodType = 30
        
        oneMonthBtnOtlt.borderColor = ColorCodes.newAppRed
        threeMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        sixMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        oneYearBtnOtlt.borderColor = ColorCodes.newAppGray
        
        
        oneMonthBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
        threeMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        sixMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        oneYearBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
      
        
        downloadTransactnFilterDetails()
        
    }
    
    
    @IBAction func threeMonthBtnActn(_ sender: Any) {
        self.periodType = 90
        
        oneMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        threeMonthBtnOtlt.borderColor = ColorCodes.newAppRed
        sixMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        oneYearBtnOtlt.borderColor = ColorCodes.newAppGray
        
        oneMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        threeMonthBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
        sixMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        oneYearBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        
        downloadTransactnFilterDetails()
        
    }
    
    
    @IBAction func sixMonthBtnActn(_ sender: Any) {
        self.periodType = 180
        
        oneMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        threeMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        sixMonthBtnOtlt.borderColor = ColorCodes.newAppRed
        oneYearBtnOtlt.borderColor = ColorCodes.newAppGray
        
        oneMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        threeMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        sixMonthBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
        oneYearBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        
        downloadTransactnFilterDetails()
        
    }
    
    @IBAction func oneYearBtnActn(_ sender: Any) {
        self.periodType = 365
        
        oneMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        threeMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        sixMonthBtnOtlt.borderColor = ColorCodes.newAppGray
        oneYearBtnOtlt.borderColor = ColorCodes.newAppRed
        
        oneMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        threeMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        sixMonthBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
        oneYearBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
        
        downloadTransactnFilterDetails()
        
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
                
                self.periodType = Int("\(self.periodValueData[0])") ?? 30
                self.transactionFilterType = Int(self.filterValueData[1]) ?? 2
                
                self.downloadTransactnFilterDetails()
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
        
    }*/
    
    func downloadTransactnFilterDetails() {

        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "filterType": 2,
                                             "fromDate": fromDateValue,
                                             "toDate": toDateValue,
                                             "period": periodType, "recordCount":0]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
      self.showSpinner(onView: self.view)
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefTransctnFilterImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
              self.beneficiaryResponse.removeAll()
              self.removeSpinner()

                print(resonseTal!)
                if let transactionHistory = resonseTal?.value(forKey: "transactionHistory") as? NSArray {
                    print(transactionHistory)
                    /*  UserDefaults.standard.set(transactionHistory, forKey: "TransactionHistoryLocal")
                     let tableData  =  UserDefaults.standard.object(forKey: "TransactionHistoryLocal") ?? []
                     print(tableData)*/
                    
                    
                    
                    self.beneficiaryResponse = transactionHistory as! [Any]
                    
                    /*    let newV:[Any] = transactionHistory as! [Any]
                     print(newV)
                     
                     let transactnData = NSKeyedArchiver.archivedData(withRootObject: newV)
                     UserDefaults.standard.set(transactnData, forKey: "TransactionHistoryLocal")*/
                    
                    if self.beneficiaryResponse.count < 1 {
                        self.periodTbleView.isHidden = true
                        self.noRecrdsFoundTxt.isHidden = false
                    }
                    else {
                        self.noRecrdsFoundTxt.isHidden = true
                        self.periodTbleView.isHidden = false
                        
                    }
                    
                }
                self.periodTbleView.reloadData()
                //   self.loadPlaces()
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
            
            print(transctnArray)
            
            self.beneficiaryResponse = transctnArray as! [Any]
            self.periodTbleView.reloadData()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beneficiaryResponse.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TransctionPeriodCell.identifier)! as! TransctionPeriodCell
    let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
    cell.setupData(eachObj)

//    let cell = periodTbleView.dequeueReusableCell(withIdentifier: "TransctnByPeriodCell")! as! TransctnByPeriodCell
//    let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
//
//
//    cell.benfId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
//    cell.nameLbl.text = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
//
//    /*
//
//     beneficiaryFirstName = ALI;
//     beneficiaryId = 14;
//     beneficiaryLastName = MOHSIN;
//     beneficiaryMiddleName = AHMAD;
//     beneficiaryTypeName = "Western Union";
//     createdDate = "2020-11-13T15:13:03.7612709";
//     sourceCurrenyCode = KWD;
//
//
//
//     */
//    var newCurencyData = "10"
//    if let value = eachObj?["totalLCAmount"] as? Int {
//      newCurencyData = String(value)
//    }else if let value = eachObj?["totalLCAmount"] as? String {
//      newCurencyData = value
//    }
//    else if let value = eachObj?["totalLCAmount"] as? Double {
//      newCurencyData = String(value)
//    }
//
//    cell.amntLbl.text = newCurencyData
//    let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
//    cell.dateLbl.text = Date.getMonthDayYearString(newDate)
//
//    let sourceCurency = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
//    let targetCurency = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
//    cell.accountNumbrLbl.text = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
//
//    let finalCurency = sourceCurency + ">" + targetCurency
//
//    cell.curencyLbl.text = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
//
//    cell.selectionStyle = UITableViewCell.SelectionStyle.none
//
    return cell
  }
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension

  }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let eachObj = self.beneficiaryResponse[indexPath.row] as?NSDictionary
        
        
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        BeneficiaryDetails.shared.mtcn = eachObj?.value(forKey: "mtcn") as? String ?? ""
        BeneficiaryDetails.shared.ttRefNottn = eachObj?.value(forKey: "ttRefNo") as? String ?? ""
        
        
    /*    let lcAmntt = eachObj?.value(forKey: "lcAmount") as? String ?? "0"
        BeneficiaryDetails.shared.lcAmntQuickSend = Int(lcAmntt)*/
        
        let lcAmnt =  eachObj?.value(forKey: "lcAmount") as? String  ?? "0.0"
        let doubleLcAmnt = Double(lcAmnt)
        BeneficiaryDetails.shared.lcAmntQuickSend = doubleLcAmnt ?? 0.0
        
        
      //  BeneficiaryDetails.shared.lcAmntQuickSend = eachObj?.value(forKey: "lcAmount") as? Int ?? 0
        BeneficiaryDetails.shared.quickSend = "Quick"
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        
        BeneficiaryDetails.shared.remitterEmail = eachObj?.value(forKey: "remitterEmail") as? String ?? ""
        
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
        BeneficiaryDetails.shared.sourceCurrenyCode = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
         BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        BeneficiaryDetails.shared.targetCurencyCode = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryTypeName = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
        BeneficiaryDetails.shared.isRetail = eachObj?.value(forKey: "isRetail") as? Bool ?? false

      BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
          BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "beneficiaryMiddleName") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "beneficiaryLastName") as? String ?? ""
        BeneficiaryDetails.shared.voucherMsg = eachObj?.value(forKey: "voucherMessage") as? String ?? ""
        BeneficiaryDetails.shared.enableOrDisable = eachObj?.value(forKey: "isDisable") as? Bool ?? false
              
           
         
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
        BeneficiaryDetails.shared.sourceTotalAmnt = eachObj?["totalLCAmount"] as? String ?? ""
        
        
     //   BeneficiaryDetails.shared.sourceTotalAmnt = String(eachObj?.value(forKey: "totalLCAmount") as? Int ?? 0)
        
    /*  var newCurencyTarget = "10"
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
       
        BeneficiaryDetails.shared.transctnStatusText = eachObj?.value(forKey: "statusName") as? String ?? ""
        BeneficiaryDetails.shared.transctnStatusInt = eachObj?.value(forKey: "status") as? Int ?? 0
        
        let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
        if newDate.contains(".") {
         BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
        }
        else {
            BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearWithoutSecndsString(newDate)
        }
      self.pushViewController(controller: TransctionsFullDetailsVc.initiateController())
        
    }
    
    @IBAction func downloadBtnActn(_ sender: Any) {
        if(expandOneClick == true) {
                   
            self.pdfBtnOtlt.isHidden = false
            self.xlsBtnOtlt.isHidden = false
                   
               } else {
                   self.pdfBtnOtlt.isHidden = true
                   self.xlsBtnOtlt.isHidden = true
                   
               }
               
               expandOneClick = !expandOneClick
        
      }
      
      @IBAction func pdfActn(_ sender: Any) {
        downloadTrnsctnPdf()
      }
      
      
      @IBAction func xlsActn(_ sender: Any) {
        downloadTrnsctnExcel()
      }
    
    
    // Mark: getting pdf data
    func downloadTrnsctnPdf() {
          
        self.showSpinner(onView: self.view)
          let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                               "filterType": 2,
                                               "fromDate": fromDateValue,
                                               "toDate": toDateValue,
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
      
    // Mark: getting excel data
      func downloadTrnsctnExcel() {
        self.showSpinner(onView: self.view)
          let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                               "filterType": 2,
                                               "fromDate": fromDateValue,
                                               "toDate": toDateValue,
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
      
    // Mark: saving pdf
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
          
          let pdfviewController: PdfVc = .initiateController()
          self.pushViewController(controller: pdfviewController)
       
          //   Global.shared.pdfUrl = pdfUrl
          Global.shared.pdfUrl = excelUrl
         
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
