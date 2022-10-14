//
//  AddNewAddressVC.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit
import Alamofire

class AddNewAddressVC: UIViewController {
    //MARK: - OUTLETS
    
    @IBOutlet weak var TFFullName: UITextField!
    @IBOutlet weak var TFFalt: UITextField!
    @IBOutlet weak var TFFloor: UITextField!
    @IBOutlet weak var TFBuilding: UITextField!
    @IBOutlet weak var TFGada: UITextField!
    @IBOutlet weak var TFStreet: UITextField!
    @IBOutlet weak var TFBlock: UITextField!
    @IBOutlet weak var TFAreaCity: UITextField!
    @IBOutlet weak var TFPostalCode: UITextField!
    @IBOutlet weak var TFPhoneNumber: UITextField!
    @IBOutlet var headerAddAdderss: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCCancel: UIButton!
    @IBOutlet weak var btnSaveAddress: UIButton!
    var homeAddressObj : CMBookingHomeAddress?
    var isopenforedit = false
    
    @IBOutlet weak var tableViewAddAddress: UITableView!
    @IBOutlet weak var btnDefaultAddress: UIButton!
//    var unchecked = true
    var bIsDefault = false
    
    
    //MARK: - VARIABLES
    
    var fullName:String?
    var flat:String?
    var floor:String?
    var gada:String?
    var street:String?
    var block:String?
    var building:String?
    
    
    //MARK: - LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        btnCCancel.layer.cornerRadius = 3
        btnSaveAddress.layer.cornerRadius = 3
        TFFullName.TFDesign()
        TFFalt.TFDesign()
        TFFloor.TFDesign()
        TFBuilding.TFDesign()
        TFGada.TFDesign()
        TFStreet.TFDesign()
        TFBlock.TFDesign()
        TFAreaCity.TFDesign()
        TFPostalCode.TFDesign()
        TFPhoneNumber.TFDesign()
        tableViewAddAddress.delegate = self
        tableViewAddAddress.dataSource = self
        
        if(isopenforedit)
        {
            TFFullName.text = homeAddressObj?.firstName
            TFFalt.text = homeAddressObj?.flat
            TFFloor.text = homeAddressObj?.floor
            TFBuilding.text = homeAddressObj?.building
            TFGada.text  = homeAddressObj?.gada
            TFStreet.text = homeAddressObj?.street
            TFBlock.text = homeAddressObj?.block
            TFAreaCity.text = homeAddressObj?.areaCity
            TFPostalCode.text = homeAddressObj?.postalCode
            TFPhoneNumber.text = homeAddressObj?.phoneNumber
            bIsDefault = ((homeAddressObj?.bIsDefault) != nil)
            if(bIsDefault)
            {
                btnDefaultAddress.setImage( UIImage(named:"checkboxActive"), for: .normal)

            }
            else
            {
                btnDefaultAddress.setImage(UIImage(named:"checkboxNormal"), for: .normal)

            }

        }
        else
        {
            TFFullName.text = Global.shared.firstNameTxt + " " + Global.shared.lastNameTxt
        }
            
    }
    override func viewWillDisappear(_ animated: Bool) {
        //        lblTitle.text = "Add New Address"
        btnSaveAddress.setTitle("Save Address", for: .normal)
    }
    
    //MARK: - ACTIONS
    
    
    @IBAction func onTapAddLocation(_ sender: Any) {
        
        print("Add Location")
        
    }
    
    
    
    
    @IBAction func onClickedSaveData(_ sender: UIButton)
    {
        if validation()
        {
            _ = isopenforedit ? homeUpdateAddressFunc() : AddAddress()
        }
    }
    
    @IBAction func taponbackbtn(sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onClickedCancelBtn(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - FUNCTIONS
    func validation ()-> Bool{
        fullName = TFFullName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        flat = TFFalt.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        gada = TFGada.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        block = TFBlock.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        building = TFBuilding.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        floor = TFFloor.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        street = TFStreet.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(fullName?.count ?? 0 == 0){
            
            createAlert(title: "", message: "Fullname is required")
            
            return false
        }
        else if(flat?.count ?? 0 == 0){
            createAlert(title: "", message: Global.shared.lbl_fx_1)
            
            return false
        }
        else if(floor?.count ?? 0 == 0){
            
            createAlert(title: "", message: Global.shared.lbl_fx_2)
            
            return false
            
        }
        else if(building?.count == 0){
            createAlert(title: "", message: Global.shared.lbl_fx_3)
            return false
            
        }
        else if(gada?.count ?? 0 == 0){
            
            createAlert(title: "", message: Global.shared.lbl_fx_4)
            return false
        }
        else if(street?.count ?? 0 == 0){
            createAlert(title: "", message: Global.shared.lbl_fx_5)
            return false
        }
        else if(block?.count ?? 0 == 0){
            
            createAlert(title: "", message: Global.shared.lbl_fx_6)
            return false
        }
        
        return true
    }
    
    
    
    
    
    
}
//MARK: - EXTENSIONS
extension AddNewAddressVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerAddAdderss
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 630
    }
    
    
    //    MARK: - Add Home Address
    
    func AddAddress() {
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "firstName" : self.TFFullName.text ?? "",
                                             "flat" : self.TFFalt.text ?? "",
                                             "floor" : self.TFFloor.text ?? "",
                                             "building" : self.TFBuilding.text ?? "",
                                             "gada" : self.TFGada.text ?? "",
                                             "street" : self.TFStreet.text ?? "",
                                             "block" : self.TFBlock.text ?? "",
                                             "areaCity": self.TFAreaCity.text ?? "",
                                             "postalCode" : self.TFPostalCode.text ?? "",
                                             "phoneNumber" : self.TFPhoneNumber.text ?? "",
                                             "bIsDefault" : self.bIsDefault
                    
                            ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.AddAddressFunc(headersTobePassed: headers, postParameters: paramaterPasing) { responseData, errString in
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
                    
                    //                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    //                        self.present(alert, animated: true, completion: nil)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func onTapDefaultAddress(_ sender: Any)
    {
        if(bIsDefault)
        {
            btnDefaultAddress.setImage(UIImage(named:"checkboxNormal"), for: .normal)
            bIsDefault = false
        }
        else
        {
            btnDefaultAddress.setImage( UIImage(named:"checkboxActive"), for: .normal)
            bIsDefault = true
        }
    }
    
    //    MARK: - Update Home Address
    
    func homeUpdateAddressFunc() {
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "addressId" : homeAddressObj?.addressId,
                                             "firstName" : TFFullName.text ?? "",
                                             "flat": TFFalt.text ?? "",
                                             "floor" : TFFloor.text ?? "",
                                             "building" : TFBuilding.text ?? "",
                                             "gada" : TFGada.text ?? "" ,
                                             "street" : TFStreet.text ?? "",
                                             "block" : TFBlock.text ?? "",
                                             "areaCity" : TFAreaCity.text ?? "",
                                             "postalCode" : TFPostalCode.text ?? "",
                                             "phoneNumber" : TFPhoneNumber.text ?? "",
                                             "bIsDefault" : self.bIsDefault
                                            ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        
        NetWorkDataManager.sharedInstance.updateHomeAddress(headersTobePassed: headers, postParameters: paramaterPasing){responseData,errString in
            self.removeSpinner()
            print(responseData)
            guard errString == nil else {
                print(errString ?? "")
                self.removeSpinner()
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: errString ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            print(statusMsg,mesageCode)
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200)  {
                    self.navigationController?.popViewController(animated: true)
                    
                    //                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    //                        self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
}

extension UITextField{
    func TFDesign(){
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.cornerRadius = 5
    }
    
    
}

extension UIViewController{
    func createAlert (title:String, message:String)
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
        })
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}




