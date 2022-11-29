//
//  FXbookingMaster.swift
//  Canvas
//
//  Created by apple on 01/11/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import Foundation
import Alamofire

class FXbookingMaster {
    struct Static
        {
            static var shared: FXbookingMaster?
        }
        class var shared: FXbookingMaster
        {
            if Static.shared == nil
            {
                Static.shared = FXbookingMaster()
            }
            return Static.shared!
        }

        func dispose()
        {
            FXbookingMaster.Static.shared = nil
            print("Disposed Singleton instance")
        }
    
    //MARK: - VARIABLES
    var iscomefromtab = false
    var deliveryType  = 2
    var selecytedhomeaddress : Int?
    var selecedbranchaddress : Int?
    var selecteddateslot = ""
    var selectedtimeslot = ""
    var deliveryinstruction = ""
    var selectedpurpose = ""
    var deminations = ""
    var netamount = ""
    var fxsessionid : String = ""
    var selectedhomeaddress1name = ""
    var selectedhomeaddress2name = ""
    var selectedbranchaddress1name = ""
    var selectedbranchaddress2name = ""
    var deliveryCharges : Double = 0.0
    var commision : Double = 0.0

    var txnRefNo = ""
    lazy var dataSource : [CMSummery] = {
        let data = [CMSummery]()
        return data
    }()
    
    lazy var fxBookingDataSource : [CMFXBooking] = {
        let data = [CMFXBooking]()
        return data
    }()
    
    lazy var homeDataSource : [CMBookingHomeAddress] = {
        let data = [CMBookingHomeAddress]()
        return data
    }()
    
    lazy var branchDataSource : [CMBookingBranchAddress] = {
        let data = [CMBookingBranchAddress]()
        return data
    }()
    
    
    // MARK: - Common Date Formatter
    func timeFormat(_ dateString: String, format : String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = format
        let date = dateFormatter.string(from: userDOBDate)
        return date
    }
    
    
    
    func getData(){
        dataSource.removeAll()
        let data0 = CMSummery(summery: "", amount: "")
        dataSource.append(data0)
        let data1 = CMSummery(summery: Global.shared.commission, amount: "\(FXbookingMaster.shared.commision)")
        dataSource.append(data1)
        let data2 = CMSummery(summery: Global.shared.delivery_charge, amount: "\(FXbookingMaster.shared.deliveryCharges)")
        dataSource.append(data2)
//        let data3 = CMSummery(summery: "Commission Discount", amount: "0.0")
//        dataSource.append(data3)
        let data4 = CMSummery(summery: "", amount: "")
        dataSource.append(data4)
        
    }
    
    func addressFunc(indexpath : Int) -> String {
        var addreddStr = ""
        if FXbookingMaster.shared.homeDataSource[indexpath].flat == "" {
            addreddStr = "Floor :  \(FXbookingMaster.shared.homeDataSource[indexpath].floor ?? ""), Building : \(FXbookingMaster.shared.homeDataSource[indexpath].building ?? ""), gada : \(FXbookingMaster.shared.homeDataSource[indexpath].gada ?? ""), Street : \(FXbookingMaster.shared.homeDataSource[indexpath].street ?? ""), Block : \(FXbookingMaster.shared.homeDataSource[indexpath].block ?? ""), Area/City : \(FXbookingMaster.shared.homeDataSource[indexpath].areaCity ?? ""), postal Code : \(FXbookingMaster.shared.homeDataSource[indexpath].postalCode ?? "")"
        }
//        if FXbookingMaster.shared.homeDataSource[indexpath].floor == "" {
//            "Flat : \(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), Building : \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), gada : \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""), Street : \(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), Block : \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), Area/City : \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), postal Code : \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
//        }
//        if FXbookingMaster.shared.homeDataSource[indexpath].building == ""
        
        return addreddStr
    }
    
//    "Flat : \(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), Floor :  \(FXbookingMaster.shared.homeDataSource[indexPath.row].floor ?? ""), Building : \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), gada : \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""), Street : \(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), Block : \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), Area/City : \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), postal Code : \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
    
    
    
    
    func getHomeData(completionHandler: @escaping (Bool,String?) -> ())
    {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            NetWorkDataManager.sharedInstance.gethomeaddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
                guard let self = self else {return}
                
                guard errString == nil else {
                    print(errString ?? "")
                    let finalError = errString?.components(separatedBy: ":")

                    return
                }
                let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
                let commission = responseData?.value(forKey: "commission") as? String ?? "0"
                let deliveryCharges = responseData?.value(forKey: "deliveryCharges") as? String ?? "0"
                if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        if let dataArray = responseData?.value(forKey: "fxAddressResult") as? NSArray {
                            print(dataArray)
                            self.homeDataSource.removeAll()
                            for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                                self.homeDataSource.append(
                                    CMBookingHomeAddress(addressId: onemessage["addressId"] as? Int,
                                                         firstName: onemessage["firstName"] as? String,
                                                         flat: onemessage["flat"] as? String,
                                                         floor: onemessage["floor"] as? String,
                                                         building: onemessage["building"] as? String,
                                                         gada: onemessage["gada"] as? String,
                                                         street: onemessage["street"] as? String,
                                                         block: onemessage["block"] as? String,
                                                         areaCity: onemessage["areaCity"] as? String,
                                                         postalCode: onemessage["postalCode"] as? String,
                                                         phoneNumber: onemessage["phoneNumber"] as? String,
                                                         createdDate: onemessage["createdDate"] as? String,
                                                         updatedDate: onemessage["updatedDate"] as? String,
                                                         registrationId: onemessage["registrationId"] as? String,
                                                         bIsDefault: onemessage["bIsDefault"] as! Bool,
                                                         latitude: onemessage["latitude"] as? String,
                                                         longitude: onemessage["longitude"] as? String))
                            }
                        }
                        
                        FXbookingMaster.shared.deliveryCharges = Double(deliveryCharges) ?? 0.0
//                        FXbookingMaster.shared.commision = Double(commission) ?? 0.0
                        print("My Home Address is : \(self.homeDataSource)")
                        completionHandler(true,"")
                    }
                    else {
                        completionHandler(false,mesageCode)

                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        
                    }
                }
            }
        }
    }
    
//    MARK: - get_user_branch_details_url
    
    func getUserBranchDetails(completionhandler : @escaping (Bool, String) -> Void) {
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.getUserBranchDetails(headersTobePassed: headers, postParameters: paramaterPasing) {  [weak self] responseData, errString in
            guard let self = self else {return}
            guard errString == nil else {
                print(errString ?? "")
                
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200) {
                    if let dataArray = responseData?.value(forKey: "userBranchList") as? NSArray {
                        print("User Branch List \(dataArray)")
                        self.branchDataSource.removeAll()
                        for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                            print("oneMessage Data is : \(onemessage)")
                            if let branchDetail = onemessage["branchDetail"] as? NSDictionary {
                                self.branchDataSource.append(CMBookingBranchAddress(id: branchDetail["id"] as? Int,
                                                                                    branchCode: branchDetail["branchCode"] as? String,
                                                                                    branchName: branchDetail["branchName"] as? String,
                                                                                    branchAddress: branchDetail["branchAddress"] as? String,
                                                                                    phone: branchDetail["phone"] as? String,
                                                                                    fax: branchDetail["fax"] as? String,
                                                                                    latitude: branchDetail["latitude"] as? String,
                                                                                    longitude: branchDetail["longitude"] as? String,
                                                                                    languageCode: branchDetail["languageCode"] as? String,
                                                                                    isFEEnabled: branchDetail["isFEEnabled"] as? Bool))
                                print("Dictionary Data : \(branchDetail)")
                                
                            }
                        }
                    }
                    print("All Branch Data : \(self.branchDataSource)")
                    completionhandler(true, mesageCode)
                }else{
                    completionhandler(false, mesageCode)
                }
                
            }
        }
        
    }
    
    //    MARK: - get Branch Data
    
    func getBranchData(completionHandler: @escaping (Bool,String?) -> ())
    {
            homeDataSource.removeAll()
            branchDataSource.removeAll()
            let paramaterPasing: [String:Any] = ["languageCode": "en",
                                                 "searchTerm": "",
                                                 "type": 0]
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            NetWorkDataManager.sharedInstance.getbranchAddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
                guard let self = self else {return}
                guard errString == nil else {
                    print(errString ?? "")
                    
                    let finalError = errString?.components(separatedBy: ":")
                    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    return
                }
                let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
                
                if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        if let dataArray = responseData?.value(forKey: "branchesList") as? NSArray {
                            print(dataArray)
                            for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                                self.branchDataSource.append(CMBookingBranchAddress(id: onemessage["id"] as? Int,
                                                                                    branchCode: onemessage["branchCode"] as? String,
                                                                                    branchName: onemessage["branchName"] as? String,
                                                                                    branchAddress: onemessage["branchAddress"] as? String,
                                                                                    phone: onemessage["phone"] as? String,
                                                                                    fax: onemessage["fax"] as? String,
                                                                                    latitude: onemessage["latitude"] as? String,
                                                                                    longitude: onemessage["longitude"] as? String,
                                                                                    languageCode: onemessage["languageCode"] as? String,
                                                                                    isFEEnabled: onemessage["languageCode"] as? Bool))
                            }
                        }
                        
                        print("All Branch Data : \(self.branchDataSource)")
                        completionHandler(true,"")

                    }else {
                        completionHandler(true,mesageCode)

                        
                    }
                }
            }
        }
}
