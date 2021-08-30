//
//  BeneficiaryAddVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BeneficiaryAddVc: UIViewController {
    
    @IBOutlet weak var addBenefLbl: UILabel!
    
    @IBOutlet weak var selectBenefTypeLbl: UILabel!
    
    @IBOutlet weak var bankTransferLbl: UILabel!
    
    @IBOutlet weak var cashTransferLbl: UILabel!
    
    @IBOutlet weak var westernUnionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        assigningLabels()
        
   //     self.hidesBottomBarWhenPushed = false
   //     self.tabBarController?.tabBar.isHidden = false
        
    }
    
    func assigningLabels() {
        addBenefLbl.text =  Global.shared.addBenfcryHeader ?? ""
        selectBenefTypeLbl.text = Global.shared.selectBenefType ?? ""
        bankTransferLbl.text = Global.shared.addBank ?? ""
        cashTransferLbl.text = Global.shared.addCash ?? ""
        westernUnionLbl.text = Global.shared.addWesternUnion ?? ""
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
                  super.viewWillAppear(animated)
                  navigationController?.setNavigationBarHidden(true, animated: animated)
              }
              
              override func viewWillDisappear(_ animated: Bool) {
                  super.viewWillDisappear(animated)
                  navigationController?.setNavigationBarHidden(false, animated: animated)
              }
    
    @IBAction func firstBtnActn(_ sender: Any) {
         self.pushViewController(controller: BeneficiaryBankTransferVc.initiateController())
    }
    
    @IBAction func secondBtnActn(_ sender: Any) {
         self.pushViewController(controller: BeneficiaryCashTransferVc.initiateController())

    }
    
    @IBAction func thirdBtnActn(_ sender: Any) {
        self.pushViewController(controller: BeneficiaryWesternUnionVc.initiateController())
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
