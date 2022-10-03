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
    var homeDataSource : [CMBookingHomeAddress] = {
        let data = [CMBookingHomeAddress]()
        return data
    }()
    
    var branchDataSource : [CMBookingBranchAddress] = {
        let data = [CMBookingBranchAddress]()
        return data
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewYourAddress.delegate = self
        tableViewYourAddress.dataSource = self
        
        
        tableViewYourAddress.register(UINib(nibName: "CellYourAddress", bundle: nil), forCellReuseIdentifier: "CellYourAddress")
        tableViewYourAddress.register(UINib(nibName: "CellAddNewAddress", bundle: nil), forCellReuseIdentifier: "CellAddNewAddress")
        
        
        
        // Do any additional setup after loading the view.
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeDataSource.isEmpty {
            return branchDataSource.count
        }else{
            return homeDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellYourAddress") as! CellYourAddress
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.delegate = self
        if homeDataSource.isEmpty {
            cell.lblAddress.text = "\(branchDataSource[indexPath.row].branchAddress ?? ""), \(branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFullName.text = branchDataSource[indexPath.row].branchName
        }else{
            cell.lblFullName.text = homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "\(homeDataSource[indexPath.row].flat ?? ""), \(homeDataSource[indexPath.row].floor ?? ""), \(homeDataSource[indexPath.row].building ?? ""), \(homeDataSource[indexPath.row].gada ?? ""), \(homeDataSource[indexPath.row].street ?? ""), \(homeDataSource[indexPath.row].block ?? ""), \(homeDataSource[indexPath.row].areaCity ?? ""), \(homeDataSource[indexPath.row].postalCode ?? "")"
        }
        print("Home Address ::: ::: ::: ::\(homeDataSource)")
        print("Home Address ::: ::: ::: ::\(branchDataSource)")
        return cell
        
    }
    
    func updateAddress(tag: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        vc.baneficieryId = homeDataSource[tag].addressId
        navigationController?.pushViewController(vc, animated: true)
        
        vc.btnSaveAddress.setTitle("Update", for: .normal)
        //        vc.lblTitle.text = "Update Address"
    }
    
    func deleteAddress(indexPath: Int) {
        fxBookingDeleteAddress(addressId: homeDataSource[indexPath].addressId ?? 0)
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
                    self.navigationController?.popViewController(animated: true)
                    //                    self.navigationController?.popViewController(animated: true)
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
    }
}
