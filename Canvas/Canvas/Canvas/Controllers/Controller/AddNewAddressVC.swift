//
//  AddNewAddressVC.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit

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
    
    @IBOutlet weak var btnCCancel: UIButton!
    @IBOutlet weak var btnSaveAddress: UIButton!
    
    @IBOutlet weak var tableViewAddAddress: UITableView!
    
    
    //MARK: - VARIABLES

    
    
    
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
        
        
//        TFSelectDate.layer.borderWidth = 1
//        TFTimeSlot.layer.borderWidth = 1
//        TFDeliveryInst.layer.borderWidth = 1
        //MARK: - LIFECYCLE METHODS

        tableViewAddAddress.delegate = self
        tableViewAddAddress.dataSource = self
        
        
        
    }
    //MARK: - ACTIONS
    
    
    
    
    
    //MARK: - FUNCTIONS
    
    
    
    

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
        return 700
    }
    
    
    
    
}

extension UITextField{
    func TFDesign(){
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.cornerRadius = 5
    }

}
