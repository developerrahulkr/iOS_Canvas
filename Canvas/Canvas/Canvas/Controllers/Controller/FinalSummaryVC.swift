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
    
    
    
    //MARK: - VARIABLES
    var fxBookingModel : CMFXBookingModel!
    
    
    
    
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
    //MARK: - ACTIONS
    
    @IBAction func onClickedBAckBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK: - FUNCTIONS
    
    
    
    func callFXBookingDetailsAPI(){
                self.showSpinner(onView: self.view)
        let parameterPassing: [String:Any] = ["txnRefNo": "222010420000053",
                                             "registrationId":Global.shared.afterLoginRegistrtnId ?? ""]
//                                              "registrationId": "6f016d46-2cfd-44f5-86bc-f259df57209d" ?? ""]
        
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
                       
                        if let id = fXBooking["id"]{
                            self.fxBookingModel
                            self.fxBookingModel?.id = id as? Int
                        }
                        
                        
//                        CMFXBookingModel.init(id: id
                    
                        
                        
                        
//                        self.fxBookingModel.txnRefNo = fXBooking["txnRefNo"] as? String
//                        self.fxBookingModel.remID = fXBooking["remID"] as? String
//                        self.fxBookingModel.commAmount = fXBooking["commAmount"] as? Int
//                        self.fxBookingModel.id = fXBooking["netAmt"] as? Int
//                        self.fxBookingModel.id = fXBooking["payMode"] as? Int
//                        self.fxBookingModel.id = fXBooking["pot"] as? String
//                        self.fxBookingModel.id = fXBooking["soi"] as? String
//                        self.fxBookingModel.id = fXBooking["remark"] as? String
////                        self.fxBookingModel.id = fXBooking["cashierID"] as? Int
//                        self.fxBookingModel.id = fXBooking["entity"] as? String
//                        self.fxBookingModel.id = fXBooking["promoCode"] as? String
//                        self.fxBookingModel.id = fXBooking["amountInWords"] as? String
////                        self.fxBookingModel.id = fXBooking["loginSource"] as? Int
////                        self.fxBookingModel.id = fXBooking["processId"] as? Int
//                        self.fxBookingModel.id = fXBooking["ipAddress"] as? String
//                        self.fxBookingModel.id = fXBooking["statusVocher"] as? Int
//                        self.fxBookingModel.id = fXBooking["status"] as? Int
//                        self.fxBookingModel.id = fXBooking["registerationID"] as? String
//                        self.fxBookingModel.id = fXBooking["deliveryType"] as? Int
//                        self.fxBookingModel.id = fXBooking["objectReferenceID"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterFirstName"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterMiddleName"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterLastName"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterAddress1"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterAddress2"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterNationality"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterDOB"] as? String
//                        self.fxBookingModel.id = fXBooking["remitterPhone"] as? String
//                        self.fxBookingModel.id = fXBooking["timeSlot"] as? String
//                        self.fxBookingModel.id = fXBooking["denomination"] as? String
//                        self.fxBookingModel.id = fXBooking["purposeOfTransfer"] as? String
//                        self.fxBookingModel.id = fXBooking["selectedDate"] as? String
//                        self.fxBookingModel.id = fXBooking["deliveryInsruction"] as? String
//                        self.fxBookingModel.id = fXBooking["commissionDiscount"] as? String
//                        self.fxBookingModel.id = fXBooking["youPay"] as? String
//                        self.fxBookingModel.id = fXBooking["deliveryCharges"] as? String
////                        self.fxBookingModel.id = fXBooking["jsonData"] as? Int
////                        self.fxBookingModel.id = fXBooking["knetApprovalNo"] as? Int
//                        self.fxBookingModel.id = fXBooking["knetStatus"] as? Int
////                        self.fxBookingModel.id = fXBooking["ttRefNo"] as? Int
//
//
//                        self.fxBookingModel.id = fXBooking["id"] as? Int
//                        self.fxBookingModel.id = fXBooking["id"] as? Int
//                        self.fxBookingModel.id = fXBooking["id"] as? Int
//                        self.fxBookingModel.id = fXBooking["id"] as? Int

                        
                    }
                    
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
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
                return 3
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
                return cell
            }
            else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellCurrencyData", for: indexPath) as! CellCurrencyData
                return cell
            }
            else if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellStatus", for: indexPath) as! CellStatus
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
struct modelFXBookingDetails: Codable {
    var status: Bool?
    var statusCodes: Int?
    var statusMessage, messageCode: String?
//    let fXBooking: FXBooking?
}

// MARK: - FXBooking
struct CMFXBookingModel: Codable {
    var id: Int?
//    var txnRefNo, remID: String?
//    var commAmount: Int?
//    var netAmt: Double?
//    var payMode: Int?
//    var soi, pot, remark: String?
////    let cashierID: JSONNull?
//    var entity, promoCode, amountInWords: String?
////    let loginSource, processID: JSONNull?
//    var ipAddress: String?
//    var statusVocher, status: Int?
//    var registerationID: String?
//    var deliveryType: Int?
//    var objectReferenceID, remitterFirstName, remitterMiddleName, remitterLastName: String?
//    var remitterAddress1, remitterAddress2, remitterNationality, remitterDOB: String?
//    var remitterPhone, timeSlot, denomination, purposeOfTransfer: String?
//    var selectedDate, deliveryInsruction, commissionDiscount, youPay: String?
//    var deliveryCharges: String?
////    let fXBookingJSONData, knetApprovalNo: JSONNull?
//    var knetStatus: Int?
////    let ttRefNo: JSONNull?
//    var fXBookingDetails: [FXBookingDetail]?

}

// MARK: - FXBookingDetail
struct FXBookingDetail: Codable {
    var id, amfcBookingID: Int?
    var type, fcCurrencyCode: String?
    var fcAmount: Int?
    var lcAmount, rate: Double?
    var currencyName, countryCode, createdDate, updatedDate: String?
}

