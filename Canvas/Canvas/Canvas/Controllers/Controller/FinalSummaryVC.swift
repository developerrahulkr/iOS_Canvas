//
//  FinalSummaryVC.swift
//  Al_MuzainiDummy
//
//  Created by apple on 07/10/22.
//

import UIKit
import Alamofire
class FinalSummaryVC: UIViewController {
    
    //MARK: - OUTLETS
    
    
    
    @IBOutlet var headerViewCurrency: UIView!
    @IBOutlet weak var viewBackgroundTableview: UIView!
    @IBOutlet weak var tableViewFinal: UITableView!
    @IBOutlet weak var viewCurrency: UIView!
    @IBOutlet weak var viewFCAmount: UIView!
    @IBOutlet weak var viewRate: UIView!
    @IBOutlet weak var viewLCAmount: UIView!
    var pdfString = ""

    var pdfUrl:NSURL!

    
    //MARK: - VARIABLES
        var fxBookingModel : FXBookingModel?
        

    
    
    
    
    //MARK: - LYFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callFXBookingDetailsAPI()
        
        viewCurrency.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewCurrency.layer.borderWidth = 1
        
        viewFCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewFCAmount.layer.borderWidth = 1
        
        viewRate.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewRate.layer.borderWidth = 1
        
        viewLCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewLCAmount.layer.borderWidth = 1
        
        tableViewFinal.delegate = self
        tableViewFinal.dataSource = self
        
        viewBackgroundTableview.layer.borderWidth = 1
        viewBackgroundTableview.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.734496363)
        viewBackgroundTableview.layer.cornerRadius = 10
        
        
        
        tableViewFinal.register(UINib(nibName: "CellStatus", bundle: nil), forCellReuseIdentifier: "CellStatus")
        
        tableViewFinal.register(UINib(nibName: "CellServiceOpted", bundle: nil), forCellReuseIdentifier: "CellServiceOpted")
        
        tableViewFinal.register(UINib(nibName: "CellCurrencyData", bundle: nil), forCellReuseIdentifier: "CellCurrencyData")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    //MARK: - ACTIONS
    
    
    @IBAction func onTapBack(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
//        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - FUNCTIONS
    
    
    func downloadTrnsctnPdf() {
        
        self.showSpinner(onView: self.view)
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "amfcBookingID": fxBookingModel?.fXBookingDetails?[0].amfcBookingID ?? 0,
                                             "txnRefNo": fxBookingModel?.txnRefNo ?? "",
                                             "languageCode": LocalizationSystem.sharedInstance.getLanguage()]

        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

        
        NetWorkDataManager.sharedInstance.fxVoucherPdfImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
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

    
    
    func callFXBookingDetailsAPI(){
        self.showSpinner(onView: self.view)
        let parameterPassing: [String:Any] = ["txnRefNo": FXbookingMaster.shared.txnRefNo,
                                              "registrationId":Global.shared.afterLoginRegistrtnId ?? ""]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.hitFXBookingDetails(headerToBePassed: headers, postParameter: parameterPassing){ responseData, errString in
            
            print(responseData)
            self.removeSpinner()
            
            guard errString == nil else {
                print(errString ?? "")
                self.removeSpinner()
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            print(statusMsg,mesageCode)
            
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200)  {
                    print("Successfully hit API FXBooking Details")
                    if let fXBooking = responseData?.value(forKey: "fXBooking") as? NSDictionary {
                        print(fXBooking)
                        print( fXBooking["txnRefNo"] )
                        
                        
                        
                      var  arrayDetails = fXBooking["fXBookingDetails"] as? NSDictionary
                        
                
              
                        
                        let media = fXBooking["fXBookingDetails"] as! Array<Any>
                                            var mediaurl = [FXBookingDetail]()
                                            for i in media{
                                                print(i)
                                                let resultNew = i as? [String:Any]
                                                let url = resultNew?["fcCurrencyCode"]  as! String
                                                mediaurl.append(FXBookingDetail.init(id: resultNew?["id"] as? Int,
                                                        amfcBookingID: resultNew?["amfcBookingID"] as? Int,
                                                        fcCurrencyCode: resultNew?["fcCurrencyCode"] as? String,
                                                        fcAmount: resultNew?["fcAmount"] as? Int,
                                                        lcAmount: resultNew?["lcAmount"] as? Double,
                                                        rate: resultNew?["rate"] as? Double,
                                                        currencyName: resultNew?["currencyName"] as? String,
                                                        countryCode: resultNew?["countryCode"] as? String,
                                                        createdDate: resultNew?["createdDate"] as? String,
                                                        updatedDate: resultNew?["updatedDate"] as? String))
                                            }
                        
                        
//                        var arrData = FXBookingDetail.init(id: arrayDetails?["id"] as? Int,
//                                                               amfcBookingID: arrayDetails?["amfcBookingID"] as? Int,
//                                                               type: arrayDetails?["type"] as? String,
//                                                               fcCurrencyCode:  arrayDetails?["fcCurrencyCode"] as? String,
//                                                               fcAmount: arrayDetails?["fcAmount"] as? Int,
//                                                               lcAmount: arrayDetails?["lcAmount"] as? Double,
//                                                               rate: arrayDetails?["rate"] as? Double,
//                                                               currencyName:  arrayDetails?["currencyName"] as? String,
//                                                               countryCode:  arrayDetails?["countryCode"] as? String,
//                                                               createdDate:  arrayDetails?["createdDate"] as? String,
//                                                               updatedDate:  arrayDetails?["updatedDate"] as? String)
                  
                        
                        
                        
                        var data =  FXBookingModel.init(id: fXBooking["id"] as? Int,
                                                        txnRefNo: fXBooking["txnRefNo"] as? String,
                                                        remID: fXBooking["remID"] as? String,
                                                        commAmount: fXBooking["commAmount"] as? Int,
                                                        netAmt: fXBooking["netAmt"] as? Double,
                                                        payMode: fXBooking["payMode"] as? Int,
                                                        soi: fXBooking["soi"] as? String,
                                                        pot: fXBooking["pot"] as? String,
                                                        remark: fXBooking["remark"] as? String,
                                                        entity: fXBooking["entity"] as? String,
                                                        promoCode: fXBooking["promoCode"] as? String,
                                                        amountInWords: fXBooking["amountInWords"] as? String,
                                                        ipAddress: fXBooking["ipAddress"] as? String,
                                                        statusVocher: fXBooking["statusVocher"] as? Int,
                                                        status: fXBooking["status"] as? Int,
                                                        registerationID: fXBooking["registerationID"] as? String,
                                                        deliveryType: fXBooking["deliveryType"] as? Int,
                                                        objectReferenceID: fXBooking["objectReferenceID"] as? String,
                                                        remitterFirstName: fXBooking["remitterFirstName"] as? String,
                                                        remitterMiddleName: fXBooking["remitterMiddleName"] as? String,
                                                        remitterLastName: fXBooking["remitterLastName"] as? String,
                                                        remitterAddress1: fXBooking["remitterAddress1"] as? String,
                                                        remitterAddress2: fXBooking["remitterAddress2"] as? String,
                                                        remitterNationality: ["remitterNationality"] as? String,
                                                        remitterDOB: fXBooking["remitterDOB"] as? String,
                                                        remitterPhone: fXBooking["remitterPhone"] as? String,
                                                        timeSlot: fXBooking["timeSlot"] as? String,
                                                        denomination: fXBooking["denomination"] as? String,
                                                        purposeOfTransfer: fXBooking["purposeOfTransfer"] as? String,
                                                        selectedDate: fXBooking["selectedDate"] as? String,
                                                        deliveryInsruction: fXBooking["deliveryInsruction"] as? String,
                                                        commissionDiscount: fXBooking["commissionDiscount"] as? String,
                                                        youPay: fXBooking["youPay"] as? String,
                                                        deliveryCharges: fXBooking["deliveryCharges"] as? String,
                                                        knetStatus: fXBooking["knetStatus"] as? Int,
                                                        fXBookingDetails: mediaurl)
                        
                        
                        
                        self.fxBookingModel = data
                        self.tableViewFinal.reloadData()
                    }else{
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }
    
    static func getMonthDayYearString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
        return  dateFormatter.string(from: userDOBDate)
    }
    
    static func getMonthDayYearWithoutSecndsString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
        return  dateFormatter.string(from: userDOBDate)
    }
}
    //MARK: - EXTENSIONS
    extension FinalSummaryVC: UITableViewDelegate,UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return 1
            }else if section == 1{
                return fxBookingModel?.fXBookingDetails?.count ?? 0
            }
            else if section == 2 {
                return 1
                
            }
            else {
                return 0
            }
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellServiceOpted", for: indexPath) as! CellServiceOpted
                var fullName = ""
                if let name = fxBookingModel?.remitterFirstName{
                    fullName = name
                       
                }
                if let nameMiddle = fxBookingModel?.remitterMiddleName{
                    fullName = fullName + " " + nameMiddle
                       
                }
                if let nameLast = fxBookingModel?.remitterLastName{
                    fullName = fullName + " " + nameLast
                       
                }
                cell.lblName.text = fullName
                if     fxBookingModel?.deliveryType == 1{
                       cell.lblDeliveryType.text = "Branch"
                }
                else{
                    cell.lblDeliveryType.text = "Home"
                }
                if let createdDate = fxBookingModel?.fXBookingDetails![0].createdDate{
                    
                        cell.lblDateTime.text = Date.getMonthDayYearString2(createdDate)
                }
                if let voucherNumber = fxBookingModel?.txnRefNo{
                       cell.lblVoucherNumber.text = String(voucherNumber)
                }
                
        
                return cell
            }
            else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellCurrencyData", for: indexPath) as! CellCurrencyData
                if let currencyCode = fxBookingModel?.fXBookingDetails?[indexPath.row].fcCurrencyCode{
                    cell.lblCurrencyCode.text = String(currencyCode)
                }
                if let FCAmount = fxBookingModel?.fXBookingDetails?[indexPath.row].fcAmount{
                    cell.lblFCAmount.text = String(FCAmount)
                }
                
                if let rate = fxBookingModel?.fXBookingDetails?[indexPath.row].rate{
                    cell.lblFinalTxt.text = String(rate)
                }
                if let currCode = fxBookingModel?.fXBookingDetails?[indexPath.row].fcCurrencyCode{
                    cell.lblCurrencyCode.text = String(currCode)
                }
                if let LCAmount = fxBookingModel?.fXBookingDetails?[indexPath.row].lcAmount{
                    cell.lblLCAmount.text = String(LCAmount)
                }
                if let countryImg = fxBookingModel?.fXBookingDetails?[indexPath.row].countryCode{
                    cell.imgFlag.image = UIImage(named: (countryImg.lowercased()) )
                }
                
                
                return cell
            }
            else if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellStatus", for: indexPath) as! CellStatus
                if let youPay = fxBookingModel?.youPay{
                    cell.lblLCValue.text = String(youPay)
                }
                if  fxBookingModel?.status != 1{
                    cell.viewSuccessFailure.borderWidth = 1
                    cell.viewSuccessFailure.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
                    cell.imgFailSuccess.image = UIImage(named: "failed")
                    cell.viewSuccessFailure.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.1669523732)
                    cell.lblSuccessFailure.text = "Cancelled" //217,58,50
                    cell.lblSuccessFailure.textColor = #colorLiteral(red: 0.8885897398, green: 0.317481935, blue: 0.2528121173, alpha: 1)
                }
                
                cell.delegate = self
                return cell
            }
            else {
                return UITableViewCell()
            }
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 1{
                return headerViewCurrency
            }
            else {
                return UIView()
                
            }
        }
        
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section != 1 {
                return 0.01
            }
            else {
                return 30.0
                
            }
        }
        
    }
    


//MARK: FXBooking Details Model
struct FXBookingModel: Codable {
    let id: Int?
    let txnRefNo, remID: String?
    let commAmount: Int?
    let netAmt: Double?
    let payMode: Int?
    let soi, pot, remark: String?
//    let cashierID: JSONNull?
    let entity, promoCode, amountInWords: String?
//    let loginSource, processID: JSONNull?
    let ipAddress: String?
    let statusVocher, status: Int?
    let registerationID: String?
    let deliveryType: Int?
    let objectReferenceID, remitterFirstName, remitterMiddleName, remitterLastName: String?
    let remitterAddress1, remitterAddress2, remitterNationality, remitterDOB: String?
    let remitterPhone, timeSlot, denomination, purposeOfTransfer: String?
    let selectedDate, deliveryInsruction, commissionDiscount, youPay: String?
    let deliveryCharges: String?
//    let fXBookingJSONData, knetApprovalNo: JSONNull?
    let knetStatus: Int?
//    let ttRefNo: JSONNull?
   let fXBookingDetails: [FXBookingDetail]?
}

// MARK: - FXBookingDetail
struct FXBookingDetail: Codable {
    let id, amfcBookingID: Int?
    let fcCurrencyCode: String?
    let fcAmount: Int?
    let lcAmount, rate: Double?
    let currencyName, countryCode, createdDate, updatedDate: String?
}

extension FinalSummaryVC: ActionDownloadOrMail{
    func navigateAction(buttonType: Int) {
        if buttonType == 0{
            downloadTrnsctnPdf()
        }else{

            let popOverVC = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "BenefEmailPopUpVc") as! BenefEmailPopUpVc
            popOverVC.isopenfromfx = true
            popOverVC.bookingid = fxBookingModel?.fXBookingDetails?[0].amfcBookingID ?? 0
            popOverVC.trancationid = fxBookingModel?.txnRefNo ?? ""
                          self.addChild(popOverVC)
                          popOverVC.view.frame = self.view.frame
                          self.view.addSubview(popOverVC.view)
                          popOverVC.didMove(toParent: self)
        }
    }
}
	
