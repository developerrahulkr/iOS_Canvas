//
//  ProfileRemittanceVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ProfileRemittanceVc: UIViewController, UITextFieldDelegate, EasyTipViewDelegate {
    
    
    @IBOutlet weak var remitanceDetlsLbl: UILabel!
    
    @IBOutlet weak var trnsctnReltdDetlsLbl: UILabel!
    
    @IBOutlet weak var lblOne: UILabel!
            
            @IBOutlet weak var lblTwo: UILabel!
            
            @IBOutlet weak var lblThree: UILabel!
            
            @IBOutlet weak var lblFour: UILabel!
    
    
    
    
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
        
        // Do any additional setup after loading the view.
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
        
        assignLabels()
    }
    
    func assignLabels() {
        countMy =  ProfileDetails.shared.CountOfExpectedTxnMY ?? Global.shared.expectedTxnTypesValues[0]
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
        
        
        valueMy =  ProfileDetails.shared.ValueForExpectedTxnMY ?? Global.shared.expectedTxnTypesValues[0]
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
        
        
        
        let indexOne = Global.shared.typeServiceValues.firstIndex(of:  ProfileDetails.shared.serviceType)
        if indexOne != nil {
            self.typeOfAnswerLbl.text = Global.shared.typeServiceNames[indexOne ?? 0]
        }
        else {
            self.typeOfAnswerLbl.text = ""
         //   ProfileDetails.shared.serviceType =  Global.shared.typeServiceValues[0]
        }
       
        
        let indexTwo = Global.shared.purposeTransferValues.firstIndex(of:  ProfileDetails.shared.purpose)
        if indexTwo != nil {
            self.purposeAnswerLbl.text = Global.shared.purposeTransferNames[indexTwo ?? 0]
        }
        else {
            self.purposeAnswerLbl.text = ""
          //  ProfileDetails.shared.purpose =  Global.shared.purposeTransferValues[0]
        }
       
        
        let indexThree = Global.shared.sourceIncomeValues.firstIndex(of:  ProfileDetails.shared.incomeSource)
        if indexThree != nil {
            self.sourceOfAnswerLbl.text = Global.shared.sourceIncomeNames[indexThree ?? 0]
        }
        else {
            self.sourceOfAnswerLbl.text = ""
         //   ProfileDetails.shared.incomeSource = Global.shared.sourceIncomeValues[0]
        }
       
       
        
        
        avgYearIncomeField.text = ProfileDetails.shared.averageIncome ?? ""
        countOfExpctdTransctnField.text = ProfileDetails.shared.CountOfExpectedTxn ?? ""
        valueOfExpctdField.text = ProfileDetails.shared.ValueForExpectedTxn ?? ""
        
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
        
        
        
        
        if ProfileDetails.shared.new_purposeOfTransfer_is_required == true {
            purposeOfTransferLbl.text = Global.shared.remitPurposeTransferTxt + "*"
        }
        else {
            purposeOfTransferLbl.text = Global.shared.remitPurposeTransferTxt
        }
        if ProfileDetails.shared.new_typeOfService_is_required == true {
            typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt + "*"
        }
        else {
            typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt
        }
        if ProfileDetails.shared.new_sourceOfIncome_is_required == true {
            sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt + "*"
        }
        else {
            sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt
        }
        
        if ProfileDetails.shared.new_avgYearlyIncome_is_required == true {
            avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt + "*"
        }
        else {
            avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt
        }
        if ProfileDetails.shared.new_CountOfExpectedTxn_is_required == true {
            countOfExpctTrnsctnLbl.text = Global.shared.transExpectedCount + "*"
        }
        else {
            countOfExpctTrnsctnLbl.text = Global.shared.transExpectedCount
        }
        if ProfileDetails.shared.new_ValueForExpectedTxn_is_required == true {
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
        
        nextBtnOtl.setTitle(Global.shared.updateTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        
        avgYearIncomeField.maxLength = ProfileDetails.shared.new_avgYearlyIncome_max_length
        avgYearIncomeField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_avgYearlyIncome_field_accept)
        
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
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        if ProfileDetails.shared.new_typeOfService_is_required == true && typeOfAnswerLbl.text == "" {
            
            typeOfServiceReqLbl.isHidden = false
            
        }
        else if ProfileDetails.shared.new_purposeOfTransfer_is_required == true &&  purposeAnswerLbl.text == "" {
            
            purposeOfTrsfrReqLbl.isHidden = false
            
        }
        else if ProfileDetails.shared.new_sourceOfIncome_is_required == true && sourceOfAnswerLbl.text == "" {
            
            sourceIncomeReqLbl.isHidden = false
            
        }
        else if Global.shared.new_avgYearlyIncome_is_required == true && avgYearIncomeField.text == "" {
            avgYearIncomeField.becomeFirstResponder()
            avgYearlyIncomeReqLbl.isHidden = false
            
        }
        else if countMy == "" {
            
            let alert = ViewControllerManager.displayAlert(message: "Please Select Count Of Transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if ProfileDetails.shared.new_CountOfExpectedTxn_is_required == true && countOfExpctdTransctnField.text == "" {
            countOfExpctdTransctnField.becomeFirstResponder()
            countTrnsctnReqLbl.isHidden = false
            
        }
        else if valueMy == "" {
            
            let alert = ViewControllerManager.displayAlert(message:"Please Select Value Of Transaction", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if ProfileDetails.shared.new_ValueForExpectedTxn_is_required == true && valueOfExpctdField.text == "" {
            valueOfExpctdField.becomeFirstResponder()
            valueTrnsctnReqLbl.isHidden = false
            
        }
        else {
            //  ProfileDetails.shared.serviceType = typeOfAnswerLbl.text ?? ""
            // ProfileDetails.shared.purpose = purposeAnswerLbl.text ?? ""
            //    ProfileDetails.shared.incomeSource = sourceOfAnswerLbl.text ?? ""
            ProfileDetails.shared.averageIncome = avgYearIncomeField.text ?? ""
            ProfileDetails.shared.CountOfExpectedTxn = countOfExpctdTransctnField.text ?? ""
            ProfileDetails.shared.ValueForExpectedTxn = valueOfExpctdField.text ?? ""
            ProfileDetails.shared.CountOfExpectedTxnMY = countMy
            ProfileDetails.shared.ValueForExpectedTxnMY = valueMy
            
            
            
            /*     let vc = self.storyboard?.instantiateViewController(identifier: "NewCustomerVc") as! NewCustomerVc
             self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
             self.navigationController?.pushViewController(vc, animated: false)*/
            updateProfileDetails()
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
            ProfileDetails.shared.purpose = Global.shared.purposeTransferValues[indexS ?? 0]
            
            if ProfileDetails.shared.new_purposeOfTransfer_is_required == true {
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
            ProfileDetails.shared.serviceType = Global.shared.typeServiceValues[indexS ?? 0]
            
            if ProfileDetails.shared.new_typeOfService_is_required == true {
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
            ProfileDetails.shared.incomeSource = Global.shared.sourceIncomeValues[indexS ?? 0]
            
            if ProfileDetails.shared.new_sourceOfIncome_is_required == true {
                self.sourceIncomeReqLbl.isHidden = true
            }
        }
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == countOfExpctdTransctnField{
            if ProfileDetails.shared.new_CountOfExpectedTxn_is_required == true {
                if countOfExpctdTransctnField.text!.count ==  0 {
                    countTrnsctnReqLbl.isHidden = false
                }
                else {
                    countTrnsctnReqLbl.isHidden = true
                }
            }
        }
        else  if textField == valueOfExpctdField{
            if ProfileDetails.shared.new_ValueForExpectedTxn_is_required == true {
                if valueOfExpctdField.text!.count ==  0 {
                    valueTrnsctnReqLbl.isHidden = false
                }
                else {
                    valueTrnsctnReqLbl.isHidden = true
                }
            }
        }
        else  if textField == avgYearIncomeField{
            if ProfileDetails.shared.new_avgYearlyIncome_is_required == true {
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
    
    
    func updateProfileDetails() {
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
            "flat":  ProfileDetails.shared.flat ?? "",
            "floor":  ProfileDetails.shared.floor ?? "",
            "building":  ProfileDetails.shared.building ?? "",
            "gada":  ProfileDetails.shared.gada ?? "",
            "street":  ProfileDetails.shared.street ?? "",
            "block":  ProfileDetails.shared.block ?? "",
            "city":  ProfileDetails.shared.city ?? "",
            "state":  ProfileDetails.shared.state ?? "",
            "country":  ProfileDetails.shared.country ?? "",
            "zipCode":  ProfileDetails.shared.zipcode ?? "",
            "occupation":  ProfileDetails.shared.occupation ?? "",
            "employerName":  ProfileDetails.shared.employerName ?? "",
            "employerLocation":  ProfileDetails.shared.employLocation ?? "",
            "designation":  ProfileDetails.shared.designation ?? "",
            "salary":  ProfileDetails.shared.salary ?? "",
            "otherIncome":  ProfileDetails.shared.otherIncome ?? "",
            "typeOfService":  ProfileDetails.shared.serviceType ?? "",
            "purpose":  ProfileDetails.shared.purpose ?? "",
            "countOfExpectedTxn":  ProfileDetails.shared.CountOfExpectedTxn ?? "",
            "countOfExpectedTxnMY":  ProfileDetails.shared.CountOfExpectedTxnMY ?? "",
            "valueForExpectedTxn":  ProfileDetails.shared.ValueForExpectedTxn ?? "",
            "valueForExpectedTxnMY":  ProfileDetails.shared.ValueForExpectedTxnMY ?? "",
            "sourceOfIncome":  ProfileDetails.shared.incomeSource ?? "",
            "averageYearIncome":  ProfileDetails.shared.averageIncome ?? "",
            "gender": ProfileDetails.shared.gender ?? "M",
              "salutation":  ProfileDetails.shared.salutation ?? "M",
            "residentType": ProfileDetails.shared.residentType ?? "",
            "remitterCategory": ProfileDetails.shared.remitterCategry ?? "",
            "politicalScope": ProfileDetails.shared.politicalScope ?? "",
            "isPoliticallyExposed": ProfileDetails.shared.isPoliticallyExposed ?? "",
            "relationshipPEP": ProfileDetails.shared.relationshipPEP ?? "",
            "pepPosition": ProfileDetails.shared.pepPosition ?? ""
            
        ]
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        
        NetWorkDataManager.sharedInstance.updateProfileDetailsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
               // let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        let alert6 = UIAlertController(
                            title: "",
                            message: statusMsg,
                            preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                           // self.navigationController?.popViewController(animated: true)
                            
                            self.hidesBottomBarWhenPushed = false
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                        
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                        
                    }
                        
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                     /*   let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeDashboardVc") as! HomeDashboardVc
                        self.navigationController?.pushViewController(vc, animated: true)*/
                        
                    }
                    
                }
            }
                
                
            else
            {
                            print(errorString!)
                          
                            self.removeSpinner()
                        
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                   self.pushViewController(controller: LoginVc.initiateController())
//                                }))
//
//                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

            
        }
    }
    
    @IBAction func expand1Actn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
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
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
        //320
        
        if(expandTwoClick == true) {
            self.expand2View.isHidden = true
            self.expand2HeightConstrt.constant = 0
        } else {
            self.expand2View.isHidden = false
            self.expand2HeightConstrt.constant = 320
            
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
        Global.shared.languageChangeActn()
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
