//
//  YourAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit
import Alamofire

class YourAddress: UIViewController {
    
    
    @IBOutlet weak var tableViewYourAddress: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
//    var homeDataSource : [CMBookingHomeAddress] = {
//        let data = [CMBookingHomeAddress]()
//        return data
//    }()
//
//    var branchDataSource : [CMBookingBranchAddress] = {
//        let data = [CMBookingBranchAddress]()
//        return data
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewYourAddress.delegate = self
        tableViewYourAddress.dataSource = self
        tableViewYourAddress.register(UINib(nibName: "CellYourAddress", bundle: nil), forCellReuseIdentifier: "CellYourAddress")
        tableViewYourAddress.register(UINib(nibName: "CellAddNewAddress", bundle: nil), forCellReuseIdentifier: "CellAddNewAddress")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        FXbookingMaster.shared.getHomeData { succes, error in
            if (succes)
            {
                self.tableViewYourAddress.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        btnAdd.layer.cornerRadius = btnAdd.bounds.height / 2
    }
    
    @IBAction func onClickedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickedAddBtn(_ sender: UIButton) {
        let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension YourAddress : UITableViewDelegate,UITableViewDataSource, YourAddressDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return FXbookingMaster.shared.deliveryType == 2 ? FXbookingMaster.shared.homeDataSource.count : FXbookingMaster.shared.branchDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellYourAddress") as! CellYourAddress
        cell.delegate = self
        if FXbookingMaster.shared.deliveryType == 2
        {
            cell.lblFullName.text = FXbookingMaster.shared.homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "\(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].floor ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
            cell.imgdefault.isHidden = !FXbookingMaster.shared.homeDataSource[indexPath.row].bIsDefault
        }
        else
        {
            cell.lblAddress.text = "\(FXbookingMaster.shared.branchDataSource[indexPath.row].branchAddress ?? ""), \(FXbookingMaster.shared.branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFullName.text = FXbookingMaster.shared.branchDataSource[indexPath.row].branchName
        }
        return cell
    }
    
    func updateAddress(tag: Int)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        vc.btnSaveAddress.setTitle("Update", for: .normal)
        vc.titelText = 1
//        vc.lblTitle.text = "Update Address"
        vc.homeAddressObj = FXbookingMaster.shared.homeDataSource[tag]
        vc.isopenforedit = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func deleteAddress(indexPath: Int)
    {
        let alertView = UIAlertController(title: "", message: Global.shared.delete_confirmation, preferredStyle: .alert)
        let action = UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (alert) in
            self.fxBookingDeleteAddress(addressId: FXbookingMaster.shared.homeDataSource[indexPath].addressId ?? 0)
        })
        let action1 = UIAlertAction(title: Global.shared.cancelTxt, style: .default, handler: { (alert) in
        })
        alertView.addAction(action)
        alertView.addAction(action1)
        self.present(alertView, animated: true, completion: nil)
    }
    
    
    func fxBookingDeleteAddress(addressId : Int){
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "addressId" : addressId]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.deleteHomeAddressAPI(headersToBePassed: headers, postParameter: paramaterPasing) {responseData,
            errString in
            self.removeSpinner()
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
                    FXbookingMaster.shared.getHomeData { succes, error in
                        if (succes)
                        {
                            self.tableViewYourAddress.reloadData()
                        }
                    }
//                    self.navigationController?.popViewController(animated: true)
                    //                    self.navigationController?.popViewController(animated: true)
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100.0
    }
}
