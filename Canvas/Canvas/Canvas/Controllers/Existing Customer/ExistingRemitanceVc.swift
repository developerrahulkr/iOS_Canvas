//
//  ExistingRemitanceVc.swift
//  Canvas
//
//  Created by urmila reddy on 05/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class ExistingRemitanceVc: UIViewController {
    
    @IBOutlet weak var remitanceDetlsLbl: UILabel!
    
    @IBOutlet weak var trnsctnReltdDetlsLbl: UILabel!
    
    
    @IBOutlet weak var tabLblTwo: UILabel!
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    
    @IBOutlet weak var tabLblFour: UILabel!
 @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var backgrndImg: UIImageView!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var nextBtnOtl: UIButton!
    
    @IBOutlet weak var bckBtnOtlt: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var purposeOfTransferLbl: UILabel!
    
    @IBOutlet weak var purposeAnswerLbl: UILabel!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var typeOfServiceLbl: UILabel!
    
    @IBOutlet weak var typeOfAnswerLbl: UILabel!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var sourceOfIncomeLbl: UILabel!
    
    
    @IBOutlet weak var sourceOfAnswerLbl: UILabel!
    
    
    @IBOutlet weak var thirteenView: UIView!
    
    
    @IBOutlet weak var avgYearlyIncomeLbl: UILabel!
    
    
    @IBOutlet weak var avgYearIncomeField: CustomTextField!
    
    
    @IBOutlet weak var identityTabLbl: UILabel!
    
    @IBOutlet weak var persnalTabLbl: UILabel!
    
    @IBOutlet weak var employmntTabLbl: UILabel!
    
    @IBOutlet weak var remitanceTabLbl: UILabel!
    
    @IBOutlet weak var typeOfServiceReqLbl: UILabel!
    
    @IBOutlet weak var purposeOfTrsfrReqLbl: UILabel!
    
    
    @IBOutlet weak var sourceIncomeReqLbl: UILabel!
    
    @IBOutlet weak var avgYearlyIncomeReqLbl: UILabel!
    
    
    
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var countOfExpctTrnsctnLbl: UILabel!
    
    @IBOutlet weak var countOfExpctdTransctnField: CustomTextField!
    
    @IBOutlet weak var countTrnsctnReqLbl: UILabel!
    
    
    @IBOutlet weak var countTrnsctnRadioLbl: UILabel!
    
    @IBOutlet weak var countMonthBtnOtlt: UIButton!
    
    @IBOutlet weak var countMonthLbl: UILabel!
    
    @IBOutlet weak var countYearBtnOtlt: UIButton!
    
    @IBOutlet weak var countYearLbl: UILabel!
    
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var valueOfExpctdTrnsctnLbl: UILabel!
    
    @IBOutlet weak var valueOfExpctdField: CustomTextField!
    
    @IBOutlet weak var valueTrnsctnReqLbl: UILabel!
    
    @IBOutlet weak var valueTrnsctnRadioLbl: UILabel!
    
    @IBOutlet weak var valueMonthBtnOtlt: UIButton!
    
    @IBOutlet weak var valuMonthLbl: UILabel!
    
    @IBOutlet weak var valueYearBtnOtlt: UIButton!
    
    @IBOutlet weak var valueYearLbl: UILabel!
    
    
     var countMy = ""
     var valueMy = ""
    @IBOutlet weak var expand1HeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var expand1View: UIView!
    
    @IBOutlet weak var expand2View: UIView!
    
    
    @IBOutlet weak var expand2HeightConstrt: NSLayoutConstraint!
    
    
    var expandOneClick = true
    var expandTwoClick = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avgYearIncomeField.isEnabled = false
               countOfExpctdTransctnField.isEnabled = false
               valueOfExpctdField.isEnabled = false
        
      
        self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
               self.tabLblTwo.clipsToBounds = true
               
               self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
               self.tabLblThree.clipsToBounds = true
               
               self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
               self.tabLblFour.clipsToBounds = true
       
        
        self.expand2View.isHidden = false
                   self.expand2HeightConstrt.constant = 320
        
        // Do any additional setup after loading the view.
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
      
        
        nextBtnOtl.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        thirteenView.layer.cornerRadius = 5
        
        
        purposeOfTransferLbl.font = Global.shared.fontTopLbl
        purposeOfTransferLbl.textColor = ColorCodes.topTitleColor
        
        purposeAnswerLbl.font = Global.shared.fontBottomLbl
        purposeAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        typeOfServiceLbl.font = Global.shared.fontTopLbl
        typeOfServiceLbl.textColor = ColorCodes.topTitleColor
        
        typeOfAnswerLbl.font = Global.shared.fontBottomLbl
        typeOfAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        sourceOfIncomeLbl.font = Global.shared.fontTopLbl
        sourceOfIncomeLbl.textColor = ColorCodes.topTitleColor
        
        sourceOfAnswerLbl.font = Global.shared.fontBottomLbl
        sourceOfAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        avgYearlyIncomeLbl.font = Global.shared.fontTopLbl
        avgYearlyIncomeLbl.textColor = ColorCodes.topTitleColor
        
        avgYearIncomeField.font = Global.shared.fontBottomLbl
        avgYearIncomeField.textColor = ColorCodes.bottomTitleColor
        
        countTrnsctnRadioLbl.font = Global.shared.fontTopLbl
        countTrnsctnRadioLbl.textColor = ColorCodes.topTitleColor
        
        valueTrnsctnRadioLbl.font = Global.shared.fontTopLbl
        valueTrnsctnRadioLbl.textColor = ColorCodes.topTitleColor
        
        countOfExpctTrnsctnLbl.font = Global.shared.fontTopLbl
        countOfExpctTrnsctnLbl.textColor = ColorCodes.topTitleColor
        
        countOfExpctdTransctnField.font = Global.shared.fontBottomLbl
        countOfExpctdTransctnField.textColor = ColorCodes.bottomTitleColor
        
        valueOfExpctdTrnsctnLbl.font = Global.shared.fontTopLbl
        valueOfExpctdTrnsctnLbl.textColor = ColorCodes.topTitleColor
        
        valueOfExpctdField.font = Global.shared.fontBottomLbl
        valueOfExpctdField.textColor = ColorCodes.bottomTitleColor
        
        countMonthLbl.font = Global.shared.fontTopLbl
        countMonthLbl.textColor = ColorCodes.topTitleColor
        
        countYearLbl.font = Global.shared.fontTopLbl
        countYearLbl.textColor = ColorCodes.topTitleColor
        
        valuMonthLbl.font = Global.shared.fontTopLbl
        valuMonthLbl.textColor = ColorCodes.topTitleColor
        
        valueYearLbl.font = Global.shared.fontTopLbl
        valueYearLbl.textColor = ColorCodes.topTitleColor

      
        
        assignLabels()
    }
    
    func assignLabels() {
        
        remitanceDetlsLbl.text = Global.shared.remitanceDetlsLbl
        trnsctnReltdDetlsLbl.text = Global.shared.trnsctnReltdDetlsLbl
        
       
        countMy =  ExistingUser.shared.countOfExpectedTxn_MY ?? Global.shared.expectedTxnTypesValues[0]
        if countMy == Global.shared.expectedTxnTypesValues[0] {
            countMonthBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            countYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            countMy = Global.shared.expectedTxnTypesValues[0]
        }
        else if countMy == Global.shared.expectedTxnTypesValues[1]{
            countYearBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            countMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            
        }
        else {
            countYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            countMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        
        valueMy =  ExistingUser.shared.valueForExpectedTxn_MY ?? Global.shared.expectedTxnTypesValues[0]
        if valueMy == Global.shared.expectedTxnTypesValues[0] {
            valueMonthBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            valueYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            valueMy = Global.shared.expectedTxnTypesValues[0]
        }
        else if valueMy == Global.shared.expectedTxnTypesValues[1] {
            valueYearBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            valueMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            valueMy = Global.shared.expectedTxnTypesValues[1]
        }
        else  {
            valueYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            valueMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            
        }
     /*   let indexOne = Global.shared.typeServiceValues.firstIndex(of:  ExistingUser.shared.typeOfService)
               self.typeOfAnswerLbl.text = Global.shared.typeServiceNames[indexOne ?? 0]
               
               let indexTwo = Global.shared.purposeTransferValues.firstIndex(of:  ExistingUser.shared.purpose)
               self.purposeAnswerLbl.text = Global.shared.purposeTransferNames[indexTwo ?? 0]
               
               let indexThree = Global.shared.sourceIncomeValues.firstIndex(of:  ExistingUser.shared.sourceOfIncome)
               self.sourceOfAnswerLbl.text = Global.shared.sourceIncomeNames[indexThree ?? 0]*/
        
        
        let indexOne = Global.shared.typeServiceValues.firstIndex(of:  ExistingUser.shared.typeOfService)
        if indexOne != nil {
            self.typeOfAnswerLbl.text = Global.shared.typeServiceNames[indexOne ?? 0]
        }
        else {
            self.typeOfAnswerLbl.text = ""
         //   ProfileDetails.shared.serviceType =  Global.shared.typeServiceValues[0]
        }
       
        
        let indexTwo = Global.shared.purposeTransferValues.firstIndex(of:  ExistingUser.shared.purpose)
        if indexTwo != nil {
            self.purposeAnswerLbl.text = Global.shared.purposeTransferNames[indexTwo ?? 0]
        }
        else {
            self.purposeAnswerLbl.text = ""
          //  ProfileDetails.shared.purpose =  Global.shared.purposeTransferValues[0]
        }
       
        
        let indexThree = Global.shared.sourceIncomeValues.firstIndex(of:  ExistingUser.shared.sourceOfIncome)
        if indexThree != nil {
            self.sourceOfAnswerLbl.text = Global.shared.sourceIncomeNames[indexThree ?? 0]
        }
        else {
            self.sourceOfAnswerLbl.text = ""
         //   ProfileDetails.shared.incomeSource = Global.shared.sourceIncomeValues[0]
        }
        
        
        
        avgYearIncomeField.text = ExistingUser.shared.averageYearIncome ?? ""
        countOfExpctdTransctnField.text = ExistingUser.shared.countOfExpectedTxn ?? ""
        valueOfExpctdField.text = ExistingUser.shared.valueForExpectedTxn ?? ""
        
        
        headerLbl.text = Global.shared.newCustomerHeader
        
      
        
        identityTabLbl.text = Global.shared.identityTabNameTxt
        persnalTabLbl.text = Global.shared.personalTabNameTxt
        employmntTabLbl.text = Global.shared.employmentTabNameTxt
        remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
        
      
        
        
      
            purposeOfTransferLbl.text = Global.shared.remitPurposeTransferTxt
      
            typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt
       
            sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt
       
            avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt
        
            countOfExpctTrnsctnLbl.text = Global.shared.transExpectedCount
      
                   valueOfExpctdTrnsctnLbl.text = Global.shared.transExpectedValue
               
        countTrnsctnRadioLbl.text = Global.shared.transExpectedCountMy
        valueTrnsctnRadioLbl.text = Global.shared.transExpectedValueMy
        
        countMonthLbl.text = Global.shared.expectedTxnTypesNames[0]
        countYearLbl.text = Global.shared.expectedTxnTypesNames[1]
        
        valuMonthLbl.text = Global.shared.expectedTxnTypesNames[0]
        valueYearLbl.text = Global.shared.expectedTxnTypesNames[1]
        
        nextBtnOtl.setTitle(Global.shared.nxtBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
       
        avgYearIncomeField.maxLength = Global.shared.new_avgYearlyIncome_max_length
      //  avgYearIncomeField.valueType = Global.shared.getFieldType(text: Global.shared.new_avgYearlyIncome_field_accept)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func nextBtnActn(_ sender: Any) {
        
        Global.shared.securityQuestnsReset = "existing"
       self.pushViewController(controller: VerifyAcntThirdVc.initiateController(),isGestureEnable: false, animated: false)

       
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func purpseTransfrDrpDwn(_ sender: Any) {
      
        
    }
    
    @IBAction func typeOfAnswrDrpDwn(_ sender: Any) {
     
    }
    
    @IBAction func sorceOfIncomeDrpDwn(_ sender: Any) {
        
       
    }
    
    
    
    @IBAction func countMonthActn(_ sender: Any) {
      
    }
    
    @IBAction func countYearActn(_ sender: Any) {
      
    }
    
    
    @IBAction func valueMonthActn(_ sender: Any) {
       
    }
    
    
    @IBAction func valueYearActn(_ sender: Any) {
        
    }
    
    @IBAction func expand1Actn(_ sender: Any) {
        //350
        
        if(expandOneClick == true) {
                   self.expand1View.isHidden = true
                   self.expand1HeightConstrt.constant = 0
               } else {
                   self.expand1View.isHidden = false
                   self.expand1HeightConstrt.constant = 350
                   
               }
               
               expandOneClick = !expandOneClick
    }
    
    @IBAction func expand2Actn(_ sender: Any) {
        //320
        
        if(expandTwoClick == true) {
            self.expand2View.isHidden = false
            self.expand2HeightConstrt.constant = 320
            
            
        } else {
            
            self.expand2View.isHidden = true
            self.expand2HeightConstrt.constant = 0
        }
        
        expandTwoClick = !expandTwoClick
    }
    
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
      //  Global.shared.languageChangeActn()
        let refreshAlert = UIAlertController(title: Global.shared.changeLangeHeaderTxt, message: Global.shared.changeLangSubTitleTxt, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.view.tintColor = ColorCodes.newAppRed
        refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
        //   self.pushViewController(controller: LoginVc.initiateController())
            
            Global.shared.languageChangeActn()
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.cancelTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
              refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func avgYearlyIncomeToolTipActn(_ sender: Any) {
    }
    
    @IBAction func countOfExpctdTrnsctnToolTip(_ sender: Any) {
    }
    @IBAction func valueOfExpctdTrnsctn(_ sender: Any) {
    }
}
