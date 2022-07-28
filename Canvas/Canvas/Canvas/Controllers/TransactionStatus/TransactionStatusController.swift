//
//  TransactionStatusController.swift
//  Canvas
//
//  Created by Sandeep on 12/04/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class TransactionStatusController: UIViewController {

    @IBOutlet weak var btn_close: UIButton!
    @IBOutlet weak var lbl_transactionStatus: UILabel!
    @IBOutlet weak var lbl_transactionStatusHeader: UILabel!
    @IBOutlet weak var lbl_benibankName: UILabel!
    @IBOutlet weak var lbl_beniBankHeader: UILabel!
    @IBOutlet weak var bankViewHeight: NSLayoutConstraint!
    @IBOutlet weak var lbl_recAmt: UILabel!
    @IBOutlet weak var lbl_recAmtHeader: UILabel!
    @IBOutlet weak var lbl_transAmt: UILabel!
    @IBOutlet weak var lbl_TransAmtHeader: UILabel!
    @IBOutlet weak var lbl_beniName: UILabel!
    @IBOutlet weak var lbl_BeniNameHeader: UILabel!
    @IBOutlet weak var lbl_ttNo: UILabel!
    @IBOutlet weak var lbl_ttNoHeader: UILabel!
    @IBOutlet weak var lbl_refNo: UILabel!
    @IBOutlet weak var lbl_refNoHeader: UILabel!
    @IBOutlet weak var lbl_transStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn_close.layer.cornerRadius = 12
        btn_close.clipsToBounds = true
        assigningLabels() 
    }
    
    func assigningLabels() {
        let data = BeneficiaryDetails.shared
        
        lbl_transStatus.text = Global.shared.ttransaction
        lbl_refNoHeader.text = Global.shared.treferenceNumber
        lbl_beniBankHeader.text = Global.shared.tbeneficiaryBank
        lbl_BeniNameHeader.text = Global.shared.tbenficiaryfullName
        lbl_recAmtHeader.text = Global.shared.treceiveAmount
        lbl_TransAmtHeader.text = Global.shared.ttransferAmount
        lbl_transactionStatusHeader.text = Global.shared.ttransactionStatus
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            
            self.lbl_refNo.text =  data.txnRef  + " : "
            self.lbl_benibankName.text = data.bankName + " : "
        

            self.lbl_transAmt.text =  BeneficiaryDetails.shared.sourceTotalAmnt + " " + BeneficiaryDetails.shared.sourceCurrenyCode + " : "
            self.lbl_recAmt.text =  BeneficiaryDetails.shared.targetTotalAmnt + " " + BeneficiaryDetails.shared.targetCurencyCode + " : "
            
            lbl_transactionStatus.text = data.transactionStatus + " : "
        
          let fullName =  data.firstName + " " + data.middleName + " " + data.lastName
            lbl_beniName.text = fullName + " : "
           if data.beneficiaryType == 102 {
                self.lbl_ttNoHeader.text = Global.shared.tmtcn
                self.lbl_ttNo.text =  BeneficiaryDetails.shared.mtcn + " : "
                bankViewHeight.constant = 0
            }
            else if data.beneficiaryType == 103 {
                self.lbl_ttNoHeader.text = Global.shared.rrn
                 self.lbl_ttNo.text = BeneficiaryDetails.shared.ttRefNottn + " : "
                 bankViewHeight.constant = 0
             }
            else {
                self.lbl_ttNoHeader.text = Global.shared.tttno
                self.lbl_ttNo.text =  BeneficiaryDetails.shared.ttRefNottn + " : "
                print("no change")
            }
        }
        else {
        self.lbl_refNo.text = ": " + data.txnRef
        self.lbl_benibankName.text = ": " + data.bankName
    

        self.lbl_transAmt.text = ": " + BeneficiaryDetails.shared.sourceTotalAmnt + " " + BeneficiaryDetails.shared.sourceCurrenyCode
        self.lbl_recAmt.text = ": " + BeneficiaryDetails.shared.targetTotalAmnt + " " + BeneficiaryDetails.shared.targetCurencyCode
        
        lbl_transactionStatus.text = ": " +  data.transactionStatus
    
      let fullName =  data.firstName + " " + data.middleName + " " + data.lastName
        lbl_beniName.text = ": " + fullName
       if data.beneficiaryType == 102 {
            self.lbl_ttNoHeader.text = Global.shared.tmtcn
            self.lbl_ttNo.text = ": " + BeneficiaryDetails.shared.mtcn
            bankViewHeight.constant = 0
        }
        else if data.beneficiaryType == 103 {
            self.lbl_ttNoHeader.text = Global.shared.rrn
             self.lbl_ttNo.text = ": " + BeneficiaryDetails.shared.ttRefNottn
             bankViewHeight.constant = 0
         }
        else {
            self.lbl_ttNoHeader.text = Global.shared.tttno
            self.lbl_ttNo.text = ": " + BeneficiaryDetails.shared.ttRefNottn
            print("no change")
        }
    }
        
    }
    @IBAction func onClickCloseBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
