//
//  SiteUnderMaintnanceController.swift
//  Canvas
//
//  Created by RAC INFRA RENTAL LLP on 12/12/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class SiteUnderMaintnanceController: UIViewController {

    @IBOutlet weak var lbl_arbicMentinance: UILabel!
    @IBOutlet weak var lbl_arbicHeader: UILabel!
    @IBOutlet weak var lbl_engDesc: UILabel!
    @IBOutlet weak var lbl_engHeader: UILabel!
    @IBOutlet weak var img_maintnence: UIImageView!
    var dict_maintenance = ["":""]
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_engDesc.font = Global.shared.fontTopLbl
        lbl_engHeader.font = Global.shared.fontBottomLbl
        
        lbl_arbicMentinance.font = Global.shared.fontTopLbl
        lbl_arbicHeader.font = Global.shared.fontBottomLbl
        
        lbl_engHeader.text =  dict_maintenance["titleEn"]
        lbl_engDesc.text = dict_maintenance["descriptionEn"]
        
        lbl_arbicHeader.text = dict_maintenance["titleAr"]
        lbl_arbicMentinance.text = dict_maintenance["descriptionAr"]

        // Do any additional setup after loading the view.
    }
    

  

}
