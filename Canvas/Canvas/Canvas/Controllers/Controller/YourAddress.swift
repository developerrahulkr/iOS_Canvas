//
//  YourAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit
import Alamofire

class YourAddress: UIViewController {
    
    //MARK: - ******************************************** OUTLETS *************************************************
    @IBOutlet weak var tableViewYourAddress: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    //MARK: - ****************************************** END OF OUTLETS ********************************************

    //MARK: - **************************************** LIFECYCLE METHODS *******************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewYourAddress.delegate = self
        tableViewYourAddress.dataSource = self
        tableViewYourAddress.register(UINib(nibName: "CellYourAddress", bundle: nil), forCellReuseIdentifier: "CellYourAddress")
//        tableViewYourAddress.register(UINib(nibName: "CellAddNewAddress", bundle: nil), forCellReuseIdentifier: "CellAddNewAddress")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
    //MARK: - **********************************END OF LIFECYCLE METHODS ********************************************

    //MARK: - **************************************** ALL ACTIONS **************************************************
    @IBAction func onClickedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickedAddBtn(_ sender: UIButton) {
        if FXbookingMaster.shared.deliveryType == 2 {
            let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            self.pushViewController(controller: BranchLocatorFirstVc.initiateController())
        }
    }
    //MARK: - **************************************END ALL ACTIONS *************************************************

    
}

//MARK: ******************************* Extensions for tableView Delegate and DataSource ***************************
extension YourAddress : UITableViewDelegate,UITableViewDataSource, YourAddressDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return FXbookingMaster.shared.deliveryType == 2 ? FXbookingMaster.shared.homeDataSource.count : FXbookingMaster.shared.branchDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellYourAddress") as! CellYourAddress
        cell.delegate = self
        cell.btnSelect.tag = indexPath.row
        if FXbookingMaster.shared.deliveryType == 2
        {
            cell.lblFullName.text = FXbookingMaster.shared.homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "Flat : \(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), Floor :  \(FXbookingMaster.shared.homeDataSource[indexPath.row].floor ?? ""), Building : \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), gada : \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""), Street : \(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), Block : \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), Area/City : \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), postal Code : \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
            cell.imgdefault.isHidden = !FXbookingMaster.shared.homeDataSource[indexPath.row].bIsDefault
            if FXbookingMaster.shared.selecytedhomeaddress == FXbookingMaster.shared.homeDataSource[indexPath.row].addressId{
                print("Select cell index : \(indexPath.row)")
                cell.ViewCellYourAddress.layer.borderWidth = 2
                cell.ViewCellYourAddress.layer.borderColor = #colorLiteral(red: 0.8272326589, green: 0, blue: 0.1346516907, alpha: 1)
            }else{
                cell.ViewCellYourAddress.layer.borderWidth = 1
                cell.ViewCellYourAddress.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
        else
        {
            cell.btnEdit.isHidden = true
            cell.imgdefault.isHidden = true
            cell.lblAddress.text = "\(FXbookingMaster.shared.branchDataSource[indexPath.row].branchAddress ?? ""), \(FXbookingMaster.shared.branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFullName.text = FXbookingMaster.shared.branchDataSource[indexPath.row].branchName
            if FXbookingMaster.shared.selecedbranchaddress == FXbookingMaster.shared.branchDataSource[indexPath.row].id{
                print("Select cell index : \(indexPath.row)")
                cell.ViewCellYourAddress.layer.borderWidth = 2
                cell.ViewCellYourAddress.layer.borderColor = #colorLiteral(red: 0.8272326589, green: 0, blue: 0.1346516907, alpha: 1)
            }else{
                cell.ViewCellYourAddress.layer.borderWidth = 1
                cell.ViewCellYourAddress.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
        return cell
    }
    
    
    //MARK: Function call on tap Update Address
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
    //MARK: FUNCTION call on tap Delete Address in CellYourAddress
    func deleteAddress(indexPath: Int)
    {
        if FXbookingMaster.shared.deliveryType == 2 {
            let alertView = UIAlertController(title: "", message: Global.shared.delete_confirmation, preferredStyle: .alert)
            let action = UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (alert) in
                self.fxBookingDeleteAddress(addressId: FXbookingMaster.shared.homeDataSource[indexPath].addressId ?? 0)
            })
            let action1 = UIAlertAction(title: Global.shared.cancelTxt, style: .default, handler: { (alert) in
            })
            alertView.addAction(action)
            alertView.addAction(action1)
            self.present(alertView, animated: true, completion: nil)
        }else{
            print("Delegate for Delete Branch Working \(FXbookingMaster.shared.branchDataSource[indexPath].id ?? 0) ")
            let alertView = UIAlertController(title: "", message: Global.shared.delete_confirmation, preferredStyle: .alert)
            let action = UIAlertAction(title: Global.shared.okTxt, style: .default, handler: {  [weak self] _ in
                guard let self = self else {return}
                self.deleteBranchAddressData(branchID: (FXbookingMaster.shared.branchDataSource[indexPath].id ?? 0))

            })
            let action1 = UIAlertAction(title: Global.shared.cancelTxt, style: .default, handler: { (alert) in
            })
            alertView.addAction(action)
            alertView.addAction(action1)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func selectCell(indexPath: Int) {
        
        print("index path : \(indexPath)")
        if FXbookingMaster.shared.deliveryType == 2 {
            FXbookingMaster.shared.selecytedhomeaddress = FXbookingMaster.shared.homeDataSource[indexPath].addressId
        }else{
            FXbookingMaster.shared.selecedbranchaddress = FXbookingMaster.shared.branchDataSource[indexPath].id
        }
        tableViewYourAddress.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK: - ************************************************** ALL API's **************************************************
   
    
    //    MARK: - Delete Address API
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

                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
    }
    
    func deleteBranchAddressData(branchID : Int){
            self.showSpinner(onView: self.view)

            let paramaterPasing: [String:Any] = ["registrationId" : Global.shared.afterLoginRegistrtnId!,
                                                 "branchId": branchID]
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            NetWorkDataManager.sharedInstance.deleteBranchAddress(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
                self?.removeSpinner()

                guard let self = self else {return}
                
                guard errString == nil else {
                    print(errString ?? "")
                    let finalError = errString?.components(separatedBy: ":")
                    print("error String : \(String(describing: finalError))")
                    return
                }
                let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        print("Status Code 200")
                        FXbookingMaster.shared.getUserBranchDetails { succes, error in
                            if (succes)
                            {
                                self.tableViewYourAddress.reloadData()
                            }
                        }
                    }else{
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
    }
    //    MARK: - *********************************** END OF ALL API's ********************************************
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100.0
    }
}
//MARK: *************************************** End of Extensions  *************************************************

