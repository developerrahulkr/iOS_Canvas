//
//  NewCustBankVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class NewCustBankVc: UIViewController, UITextFieldDelegate, EasyTipViewDelegate {
    
    
    @IBOutlet weak var remitanceDetlsLbl: UILabel!
    @IBOutlet weak var trnsctnReltdDetlsLbl: UILabel!
    
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var backgrndImg: UIImageView!
    
    @IBOutlet weak var lblOne: UILabel!
    
    @IBOutlet weak var lblTwo: UILabel!
    
    @IBOutlet weak var lblThree: UILabel!
    
    @IBOutlet weak var lblFour: UILabel!
    
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
        
        typeOfServiceReqLbl.font = Global.shared.fontReqLbl
        typeOfServiceReqLbl.textColor = ColorCodes.newAppRed
        
        purposeOfTrsfrReqLbl.font = Global.shared.fontReqLbl
        purposeOfTrsfrReqLbl.textColor = ColorCodes.newAppRed
        
        sourceIncomeReqLbl.font = Global.shared.fontReqLbl
        sourceIncomeReqLbl.textColor = ColorCodes.newAppRed
        
        avgYearlyIncomeReqLbl.font = Global.shared.fontReqLbl
        avgYearlyIncomeReqLbl.textColor = ColorCodes.newAppRed
        
        countTrnsctnReqLbl.font = Global.shared.fontReqLbl
        countTrnsctnReqLbl.textColor = ColorCodes.newAppRed
        
        valueTrnsctnReqLbl.font = Global.shared.fontReqLbl
        valueTrnsctnReqLbl.textColor = ColorCodes.newAppRed
        
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
        
        
        
        self.expand2View.isHidden = false
        self.expand2HeightConstrt.constant = 320
        
        // Do any additional setup after loading the view.
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        avgYearIncomeField.delegate = self
        countOfExpctdTransctnField.delegate = self
        valueOfExpctdField.delegate = self
        
        
        nextBtnOtl.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        thirteenView.layer.cornerRadius = 5
        
        self.lblOne.layer.cornerRadius = self.lblOne.frame.size.width / 2;
        self.lblOne.clipsToBounds = true
        
        self.lblTwo.layer.cornerRadius = self.lblTwo.frame.size.width / 2;
        self.lblTwo.clipsToBounds = true
        
        self.lblThree.layer.cornerRadius = self.lblThree.frame.size.width / 2;
        self.lblThree.clipsToBounds = true
        
        self.lblFour.layer.cornerRadius = self.lblFour.frame.size.width / 2;
        self.lblFour.clipsToBounds = true
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            remitanceDetlsLbl.textAlignment = .right
            trnsctnReltdDetlsLbl.textAlignment = .right
            //   }
            
        }
        
        remitanceDetlsLbl.text = "  " + Global.shared.remitanceDetlsLbl
        trnsctnReltdDetlsLbl.text = "  " + Global.shared.trnsctnReltdDetlsLbl
        
        assignLabels()
    }
    
    func assignLabels() {
        headerLbl.text = Global.shared.newCustomerHeader
        
        typeOfServiceReqLbl.text = Global.shared.remitTypeOfServiceTxt + " " + Global.shared.errorTxtRequired.lowercased()
        purposeOfTrsfrReqLbl.text = Global.shared.remitPurposeTransferTxt + " " + Global.shared.errorTxtRequired.lowercased()
        sourceIncomeReqLbl.text = Global.shared.remitSourceOfIncomeTxt + " " + Global.shared.errorTxtRequired.lowercased()
        avgYearlyIncomeReqLbl.text = Global.shared.remitAvgYearlyIncomeTxt + " " + Global.shared.errorTxtRequired.lowercased()
        countTrnsctnReqLbl.text = Global.shared.transExpectedCount + " " + Global.shared.errorTxtRequired.lowercased()
        valueTrnsctnReqLbl.text = Global.shared.transExpectedValue + " " + Global.shared.errorTxtRequired.lowercased()
        
        identityTabLbl.text = Global.shared.identityTabNameTxt
        persnalTabLbl.text = Global.shared.personalTabNameTxt
        employmntTabLbl.text = Global.shared.employmentTabNameTxt
        remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
        
      
        
        
        if Global.shared.new_purposeOfTransfer_is_required == true {
            purposeOfTransferLbl.text = Global.shared.remitPurposeTransferTxt + "*"
        }
        else {
            purposeOfTransferLbl.text = Global.shared.remitPurposeTransferTxt
        }
        if Global.shared.new_typeOfService_is_required == true {
            typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt + "*"
        }
        else {
            typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt
        }
        if Global.shared.new_sourceOfIncome_is_required == true {
            sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt + "*"
        }
        else {
            sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt
        }
        
        if Global.shared.new_avgYearlyIncome_is_required == true {
            avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt + "*"
        }
        else {
            avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt
        }
        if Global.shared.new_CountOfExpectedTxn_is_required == true {
            countOfExpctTrnsctnLbl.text = Global.shared.transExpectedCount + "*"
        }
        else {
            countOfExpctTrnsctnLbl.text = Global.shared.transExpectedCount
        }
        if Global.shared.new_ValueForExpectedTxn_is_required == true {
            valueOfExpctdTrnsctnLbl.text = Global.shared.transExpectedValue + "*"
        }
        else {
            valueOfExpctdTrnsctnLbl.text = Global.shared.transExpectedValue
        }
        countTrnsctnRadioLbl.text = Global.shared.transExpectedCountMy + "*"
        valueTrnsctnRadioLbl.text = Global.shared.transExpectedValueMy + "*"
        
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
        if self.easyTipView == nil {
                  print("nothing")
              }
              else {
              easyTipView.dismiss()
                   self.easyTipView = nil
              }
        super.viewWillDisappear(animated)
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func nextBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        if Global.shared.new_purposeOfTransfer_is_required == true &&  purposeAnswerLbl.text == "" {
            
            purposeOfTrsfrReqLbl.isHidden = false
            
        }
        else  if Global.shared.new_typeOfService_is_required == true && typeOfAnswerLbl.text == "" {
            
            typeOfServiceReqLbl.isHidden = false
            
        }
            
        else if Global.shared.new_sourceOfIncome_is_required == true && sourceOfAnswerLbl.text == "" {
            
            sourceIncomeReqLbl.isHidden = false
            
        }
        else if Global.shared.new_avgYearlyIncome_is_required == true && avgYearIncomeField.text == "" {
            avgYearIncomeField.becomeFirstResponder()
            avgYearlyIncomeReqLbl.isHidden = false
            
        }
       
        else if countMy == "" {
            let alertName = Global.shared.transExpectedCountMy + " " + Global.shared.errorTxtRequired
            let alert = ViewControllerManager.displayAlert(message: alertName, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if Global.shared.new_CountOfExpectedTxn_is_required == true && countOfExpctdTransctnField.text == "" {
            countOfExpctdTransctnField.isHidden = false
            countTrnsctnReqLbl.isHidden = false
            
        }
        else if valueMy == "" {
            let alertName = Global.shared.transExpectedValueMy + " " + Global.shared.errorTxtRequired
            let alert = ViewControllerManager.displayAlert(message:alertName, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if Global.shared.new_ValueForExpectedTxn_is_required == true && valueOfExpctdField.text == "" {
            valueOfExpctdField.isHidden = false
            valueTrnsctnReqLbl.isHidden = false
            
        }
            
        
            
        else {
            //  NewUser.shared.serviceType = typeOfAnswerLbl.text ?? ""
            // NewUser.shared.purpose = purposeAnswerLbl.text ?? ""
            //    NewUser.shared.incomeSource = sourceOfAnswerLbl.text ?? ""
            NewUser.shared.averageIncome = avgYearIncomeField.text ?? ""
            NewUser.shared.CountOfExpectedTxn = countOfExpctdTransctnField.text ?? ""
            NewUser.shared.ValueForExpectedTxn = valueOfExpctdField.text ?? ""
            NewUser.shared.CountOfExpectedTxnMY = countMy
            NewUser.shared.ValueForExpectedTxnMY = valueMy
            
            self.pushViewController(controller: NewCustomerVc.initiateController(),isGestureEnable: false, animated: false)
        }
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func purpseTransfrDrpDwn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        
        let pickerData = Global.shared.pickerResponsePurposeTransfer
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.purposeAnswerLbl.text = "\(value)"
            
            
            let indexS = Global.shared.purposeTransferNames.firstIndex(of: "\(value)")
            NewUser.shared.purpose = Global.shared.purposeTransferValues[indexS ?? 0]
            
            if Global.shared.new_purposeOfTransfer_is_required == true {
                self.purposeOfTrsfrReqLbl.isHidden = true
            }
            
        }
        
    }
    
    @IBAction func typeOfAnswrDrpDwn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        let pickerData = Global.shared.pickerResponseTypeService
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.typeOfAnswerLbl.text = "\(value)"
            
            
            let indexS = Global.shared.typeServiceNames.firstIndex(of: "\(value)")
            NewUser.shared.serviceType = Global.shared.typeServiceValues[indexS ?? 0]
            
            if Global.shared.new_typeOfService_is_required == true {
                self.typeOfServiceReqLbl.isHidden = true
            }
        }
        
    }
    
    @IBAction func sorceOfIncomeDrpDwn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        
        let pickerData = Global.shared.pickerResponseSourceIncome
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.sourceOfAnswerLbl.text = "\(value)"
            
            
            let indexS = Global.shared.sourceIncomeNames.firstIndex(of: "\(value)")
            NewUser.shared.incomeSource = Global.shared.sourceIncomeValues[indexS ?? 0]
            
            if Global.shared.new_sourceOfIncome_is_required == true {
                self.sourceIncomeReqLbl.isHidden = true
            }
        }
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == countOfExpctdTransctnField{
            if Global.shared.new_CountOfExpectedTxn_is_required == true {
                if countOfExpctdTransctnField.text!.count ==  0 {
                    countTrnsctnReqLbl.isHidden = false
                }
                else {
                    countTrnsctnReqLbl.isHidden = true
                }
            }
        }
        else  if textField == valueOfExpctdField{
            if Global.shared.new_ValueForExpectedTxn_is_required == true {
                if valueOfExpctdField.text!.count ==  0 {
                    valueTrnsctnReqLbl.isHidden = false
                }
                else {
                    valueTrnsctnReqLbl.isHidden = true
                }
            }
        }
        else  if textField == avgYearIncomeField{
            if Global.shared.new_avgYearlyIncome_is_required == true {
                if avgYearIncomeField.text!.count ==  0 {
                    avgYearlyIncomeReqLbl.isHidden = false
                }
                else {
                    avgYearlyIncomeReqLbl.isHidden = true
                }
            }
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == avgYearIncomeField {
            if (avgYearIncomeField.text?.contains("."))! && string == "." {
                
                return false
                
            }
            
            if (avgYearIncomeField.text?.contains("."))! {
                if avgYearIncomeField.text?.components(separatedBy: ".")[1].count == 3 {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
                
                
            else    if Global.shared.new_avgYearlyIncome_is_required == true {
                
                if avgYearIncomeField.text!.count <= -1 {
                    avgYearlyIncomeReqLbl.isHidden = false
                }
                else {
                    avgYearlyIncomeReqLbl.isHidden = true
                }
            }
            return avgYearIncomeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        if textField == countOfExpctdTransctnField {
            
            if Global.shared.new_CountOfExpectedTxn_is_required == true {
                if countOfExpctdTransctnField.text!.count <= -1 {
                    countTrnsctnReqLbl.isHidden = false
                }
                else {
                    countTrnsctnReqLbl.isHidden = true
                }
            }
            return countOfExpctdTransctnField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == valueOfExpctdField {
            if (valueOfExpctdField.text?.contains("."))! && string == "." {
                return false
            }
            if (valueOfExpctdField.text?.contains("."))! {
                if valueOfExpctdField.text?.components(separatedBy: ".")[1].count == 3 {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
            if Global.shared.new_ValueForExpectedTxn_is_required == true {
                if valueOfExpctdField.text!.count <= -1 {
                    valueTrnsctnReqLbl.isHidden = false
                }
                else {
                    valueTrnsctnReqLbl.isHidden = true
                }
            }
            return valueOfExpctdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        
        return true
        
    }
    
    @IBAction func countMonthActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        countMonthBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        countYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        countMy = Global.shared.expectedTxnTypesValues[0]
    }
    
    @IBAction func countYearActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        countYearBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        countMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        countMy = Global.shared.expectedTxnTypesValues[1]
    }
    
    
    @IBAction func valueMonthActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        valueMonthBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        valueYearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        valueMy = Global.shared.expectedTxnTypesValues[0]
    }
    
    
    @IBAction func valueYearActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        valueYearBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        valueMonthBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        valueMy = Global.shared.expectedTxnTypesValues[1]
    }
    
    @IBAction func expand1Actn(_ sender: Any) {
        //350
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        
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
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
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
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
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
       
        var preferences = EasyTipView.Preferences()
                                                       preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                                                       preferences.drawing.foregroundColor = UIColor.white
                                                preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top

        EasyTipView.globalPreferences = preferences
        
       
        
        if self.easyTipView == nil
         {
           self.easyTipView = EasyTipView(text: Global.shared.avgYearlyIncomeToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
         }
         else
         {
           self.easyTipView.dismiss()
           self.easyTipView = nil
         }
    }
    
    @IBAction func countOfExpctdTrnsctnToolTip(_ sender: Any) {
        
        var preferences = EasyTipView.Preferences()
                                                       preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                                                       preferences.drawing.foregroundColor = UIColor.white
                                                preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top

        EasyTipView.globalPreferences = preferences
        
       
        
        if self.easyTipView == nil
         {
           self.easyTipView = EasyTipView(text: Global.shared.countOfExpctdTrnsctnToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
         }
         else
         {
           self.easyTipView.dismiss()
           self.easyTipView = nil
         }
    }
    @IBAction func valueOfExpctdTrnsctn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
                                                       preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                                                       preferences.drawing.foregroundColor = UIColor.white
                                                preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top

        EasyTipView.globalPreferences = preferences
        
       
        
        if self.easyTipView == nil
         {
           self.easyTipView = EasyTipView(text: Global.shared.valueOfEpctdTrnsctnToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
         }
         else
         {
           self.easyTipView.dismiss()
           self.easyTipView = nil
         }
    }
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        
               tipView.dismiss()
           }
    var easyTipView : EasyTipView!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // var touch: UITouch? = touches.first
       // var toolTip = EasyTipView()
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
    }
    
}
