//
//  ProfileEmploymentVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ProfileEmploymentVc: UIViewController, UITextFieldDelegate, UIDropDownrDelegateM, EasyTipViewDelegate {
    
    
    
    @IBOutlet weak var lblOne: UILabel!
    
    @IBOutlet weak var lblTwo: UILabel!
    
    @IBOutlet weak var lblThree: UILabel!
    
    @IBOutlet weak var lblFour: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var bckgrndImg: UIImageView!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var employeNameLbl: UILabel!
    
    @IBOutlet weak var employField: CustomTextField!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var employIdLbl: UILabel!
    
    @IBOutlet weak var employFieldLbl: CustomTextField!
    
    
    @IBOutlet weak var nextBtnOtlt: UIButton!
    
    
    @IBOutlet weak var bckBtnOtlt: UIButton!
    
    @IBOutlet weak var identityTabLbl: UILabel!
    
    @IBOutlet weak var personalTabLbl: UILabel!
    
    @IBOutlet weak var emplomntTabLbl: UILabel!
    
    @IBOutlet weak var remitanceTabLbl: UILabel!
    
    
    @IBOutlet weak var occuptionView: UIView!
    
    @IBOutlet weak var occuptnLbl: UILabel!
    
    
    @IBOutlet weak var occuptnAnswerLbl: CustomTextField!
    
    @IBOutlet weak var occuptnReqLbl: UILabel!
    
    @IBOutlet weak var employNameReqLbl: UILabel!
    
    @IBOutlet weak var employLocationView: UIView!
    
    @IBOutlet weak var employLocatnLbl: UILabel!
    
    @IBOutlet weak var employLocatnField: CustomTextField!
    
    @IBOutlet weak var designationView: UIView!
    
    @IBOutlet weak var designtnLbl: UILabel!
    
    @IBOutlet weak var designtnAnswerLbl: CustomTextField!
    
    @IBOutlet weak var designtnReqLbl: UILabel!
    
    @IBOutlet weak var salaryView: UIView!
    
    @IBOutlet weak var salaryLbl: UILabel!
    
    @IBOutlet weak var salaryField: CustomTextField!
    
    @IBOutlet weak var otherIncomeView: UIView!
    
    @IBOutlet weak var otherIncomeLbl: UILabel!
    
    @IBOutlet weak var otherIncomeField: CustomTextField!
    
    
    @IBOutlet weak var employIdReqLbl: UILabel!
    
    @IBOutlet weak var employLoctnReqLbl: UILabel!
    
    @IBOutlet weak var salaryReqLbl: UILabel!
    
    
    @IBOutlet weak var otherIncomeReqLbl: UILabel!
    
    var occuptionSelected = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        occuptnReqLbl.font = Global.shared.fontReqLbl
        occuptnReqLbl.textColor = ColorCodes.newAppRed
        
        employNameReqLbl.font = Global.shared.fontReqLbl
        employNameReqLbl.textColor = ColorCodes.newAppRed
        
        designtnReqLbl.font = Global.shared.fontReqLbl
        designtnReqLbl.textColor = ColorCodes.newAppRed
        
        employIdReqLbl.font = Global.shared.fontReqLbl
        employIdReqLbl.textColor = ColorCodes.newAppRed
        
        employLoctnReqLbl.font = Global.shared.fontReqLbl
        employLoctnReqLbl.textColor = ColorCodes.newAppRed
        
        salaryReqLbl.font = Global.shared.fontReqLbl
        salaryReqLbl.textColor = ColorCodes.newAppRed
        
        otherIncomeReqLbl.font = Global.shared.fontReqLbl
        otherIncomeReqLbl.textColor = ColorCodes.newAppRed
        
        
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        employFieldLbl.isEnabled = false
        occuptnAnswerLbl.isEnabled = true
        
        employField.delegate = self
        employFieldLbl.delegate = self
        employLocatnField.delegate = self
        designtnAnswerLbl.delegate = self
        salaryField.delegate = self
        otherIncomeField.delegate = self
        
        firstView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        occuptionView.layer.cornerRadius = 5
        employLocationView.layer.cornerRadius = 5
        designationView.layer.cornerRadius = 5
        salaryView.layer.cornerRadius = 5
        otherIncomeView.layer.cornerRadius = 5
        
        nextBtnOtlt.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        
        assignLabels()
    }
    
    func assignLabels() {
        //    let indexOne = Global.shared.occupationValues.firstIndex(of:  ProfileDetails.shared.occupation)
        self.occuptnAnswerLbl.text = ProfileDetails.shared.occupation ?? ""
        
        
        
        employField.text = ProfileDetails.shared.employerName ?? ""
        employFieldLbl.text = ProfileDetails.shared.employeeID ?? ""
        employLocatnField.text = ProfileDetails.shared.employLocation ?? ""
        designtnAnswerLbl.text = ProfileDetails.shared.designation ?? ""
        salaryField.text = ProfileDetails.shared.salary ?? ""
        otherIncomeField.text = ProfileDetails.shared.otherIncome ?? ""
        
        
        headerLbl.text = Global.shared.newCustomerHeader
        
        
        occuptnReqLbl.text = Global.shared.ocuptnTxt + " " + Global.shared.errorTxtRequired.lowercased()
        employNameReqLbl.text = Global.shared.employNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        designtnReqLbl.text = Global.shared.designtnTxt + " " + Global.shared.errorTxtRequired.lowercased()
        employIdReqLbl.text = Global.shared.employeIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        employLoctnReqLbl.text = Global.shared.employLoctn + " " + Global.shared.errorTxtRequired.lowercased()
        salaryReqLbl.text = Global.shared.salaryEmploy + " " + Global.shared.errorTxtRequired.lowercased()
        otherIncomeReqLbl.text = Global.shared.otherIncome + " " + Global.shared.errorTxtRequired.lowercased()
        
        if Global.shared.new_occupation_is_required == true {
            occuptnLbl.text = Global.shared.ocuptnTxt + "*"
        }
        else {
            occuptnLbl.text = Global.shared.ocuptnTxt
        }
        if ProfileDetails.shared.new_employerName_is_required == true {
            employeNameLbl.text = Global.shared.employNameTxt + "*"
        }
        else {
            employeNameLbl.text = Global.shared.employNameTxt
        }
        if ProfileDetails.shared.new_employerID_is_required == true {
            employIdLbl.text = Global.shared.employeIdTxt + "*"
        }
        else {
            employIdLbl.text = Global.shared.employeIdTxt
        }
        if ProfileDetails.shared.new_employerLocation_is_required == true {
            employLocatnLbl.text = Global.shared.employLoctn + "*"
        }
        else {
            employLocatnLbl.text = Global.shared.employLoctn
        }
        if ProfileDetails.shared.new_employerDesigntn_is_required == true {
            designtnLbl.text = Global.shared.designtnTxt + "*"
        }
        else {
            designtnLbl.text = Global.shared.designtnTxt
        }
        if ProfileDetails.shared.new_salary_is_required == true {
            salaryLbl.text = Global.shared.salaryEmploy + "*"
        }
        else {
            salaryLbl.text = Global.shared.salaryEmploy
        }
        if ProfileDetails.shared.new_otherIncome_is_required == true {
            otherIncomeLbl.text = Global.shared.otherIncome + "*"
        }
        else {
            otherIncomeLbl.text = Global.shared.otherIncome
        }
        
        identityTabLbl.text = Global.shared.identityTabNameTxt
        personalTabLbl.text = Global.shared.personalTabNameTxt
        emplomntTabLbl.text = Global.shared.employmentTabNameTxt
        remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
        
        nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        
        employField.maxLength = ProfileDetails.shared.new_employerName_max_length
        employFieldLbl.maxLength = ProfileDetails.shared.new_employerID_max_length
        employLocatnField.maxLength = ProfileDetails.shared.new_employerLocation_max_length
        designtnAnswerLbl.maxLength = ProfileDetails.shared.new_employerDesigntn_max_length
        salaryField.maxLength = ProfileDetails.shared.new_salary_max_length
        otherIncomeField.maxLength = ProfileDetails.shared.new_otherIncome_max_length
        
        employField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_employerName_field_accept)
        employFieldLbl.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_employerID_field_accept)
        employLocatnField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_employerLocation_field_accept)
        designtnAnswerLbl.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_employerDesigntn_field_accept)
        salaryField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_salary_field_accept)
        otherIncomeField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_otherIncome_field_accept)
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
        if ProfileDetails.shared.new_occupation_is_required == true && occuptnAnswerLbl.text == "" {
            
            ProfileDetails.shared.occupation = occuptnAnswerLbl.text
            occuptnReqLbl.isHidden = false
            
        }
        else   if ProfileDetails.shared.new_employerName_is_required == true && employField.text == "" {
            employField.becomeFirstResponder()
            employNameReqLbl.isHidden = false
            
        }
        /*   else   if ProfileDetails.shared.new_employerID_is_required == true && employFieldLbl.text == ""  {
         
         employIdReqLbl.isHidden = false
         
         }*/
        else   if ProfileDetails.shared.new_employerLocation_is_required == true && employLocatnField.text == "" {
            employLocatnField.becomeFirstResponder()
            employLoctnReqLbl.isHidden = false
        }
        else   if ProfileDetails.shared.new_employerDesigntn_is_required == true && designtnAnswerLbl.text == "" {
            designtnAnswerLbl.becomeFirstResponder()
            designtnReqLbl.isHidden = false
            
        }
        else   if ProfileDetails.shared.new_salary_is_required == true && salaryField.text == "" {
            salaryField.becomeFirstResponder()
            salaryReqLbl.isHidden = false
            
        }
        else   if ProfileDetails.shared.new_otherIncome_is_required == true &&  otherIncomeField.text == ""{
            otherIncomeField.becomeFirstResponder()
            otherIncomeReqLbl.isHidden = false
            
        }
        else {
            // ProfileDetails.shared.occupation = occuptnAnswerLbl.text ?? ""
            ProfileDetails.shared.employerName = employField.text ?? ""
            ProfileDetails.shared.employeeID = employFieldLbl.text ?? ""
            ProfileDetails.shared.employLocation = employLocatnField.text ?? ""
            ProfileDetails.shared.designation = designtnAnswerLbl.text ?? ""
            ProfileDetails.shared.salary = salaryField.text ?? ""
            ProfileDetails.shared.otherIncome = otherIncomeField.text ?? ""
            self.pushViewController(controller: ProfileRemittanceVc.initiateController(), isGestureEnable: false, animated: false)
            
        }
        
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func occuptnDrpDwnActn(_ sender: Any) {
        /*    let pickerData = Global.shared.pickerResponseOccupation
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.occuptnAnswerLbl.text = "\(value)"
         self.occuptnReqLbl.isHidden = true
         
         let indexS = Global.shared.occupationNames.firstIndex(of: "\(value)")
         ProfileDetails.shared.occupation = Global.shared.occupationValues[indexS ?? 0]
         }*/
        
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "DropDownSearchVc") as! DropDownSearchVc
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == employField{
            if ProfileDetails.shared.new_employerName_is_required == true {
                if employField.text!.count ==  0 {
                    employNameReqLbl.isHidden = false
                }
                else {
                    employNameReqLbl.isHidden = true
                }
            }
        }
        if textField == employFieldLbl{
            if ProfileDetails.shared.new_employerID_is_required == true {
                if employFieldLbl.text!.count ==  0 {
                    employIdReqLbl.isHidden = false
                }
                else {
                    employIdReqLbl.isHidden = true
                }
            }
        }
        if textField == employLocatnField{
            if ProfileDetails.shared.new_employerLocation_is_required == true {
                if employLocatnField.text!.count ==  0 {
                    employLoctnReqLbl.isHidden = false
                }
                else {
                    employLoctnReqLbl.isHidden = true
                }
            }
        }
        else if textField == designtnAnswerLbl{
            if ProfileDetails.shared.new_employerDesigntn_is_required == true {
                if designtnAnswerLbl.text!.count ==  0 {
                    designtnReqLbl.isHidden = false
                }
                else {
                    designtnReqLbl.isHidden = true
                }
            }
        }
        else if textField == salaryField{
            if ProfileDetails.shared.new_salary_is_required == true {
                if salaryField.text!.count ==  0 {
                    salaryReqLbl.isHidden = false
                }
                else {
                    salaryReqLbl.isHidden = true
                }
            }
        }
        else if textField == otherIncomeField {
            if ProfileDetails.shared.new_otherIncome_is_required == true {
                if otherIncomeField.text!.count ==  0 {
                    otherIncomeReqLbl.isHidden = false
                }
                else {
                    otherIncomeReqLbl.isHidden = true
                }
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == employField {
            if ProfileDetails.shared.new_employerName_is_required == true {
                if employField.text!.count <= -1 {
                    employNameReqLbl.isHidden = false
                }
                else {
                    employNameReqLbl.isHidden = true
                }
            }
            return employField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == employFieldLbl {
            if ProfileDetails.shared.new_employerID_is_required == true {
                if employFieldLbl.text!.count <= -1 {
                    employIdReqLbl.isHidden = false
                }
                else {
                    employIdReqLbl.isHidden = true
                }
            }
            return employFieldLbl.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == employLocatnField {
            if ProfileDetails.shared.new_employerLocation_is_required == true {
                if employLocatnField.text!.count <= -1 {
                    employLoctnReqLbl.isHidden = false
                }
                else {
                    employLoctnReqLbl.isHidden = true
                }
            }
            return employLocatnField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == designtnAnswerLbl {
            if ProfileDetails.shared.new_employerDesigntn_is_required == true {
                if designtnAnswerLbl.text!.count <= -1 {
                    designtnReqLbl.isHidden = false
                }
                else {
                    designtnReqLbl.isHidden = true
                }
            }
            return designtnAnswerLbl.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == salaryField {
            if (salaryField.text?.contains("."))! && string == "." {
                
                return false
                
            }
            
            if (salaryField.text?.contains("."))! {
                if salaryField.text?.components(separatedBy: ".")[1].count == 3 {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
            if Global.shared.new_salary_is_required == true {
                if salaryField.text!.count <= -1 {
                    salaryReqLbl.isHidden = false
                }
                else {
                    salaryReqLbl.isHidden = true
                }
            }
            return salaryField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == otherIncomeField {
            
            if (otherIncomeField.text?.contains("."))! && string == "." {
                
                return false
                
            }
            
            if (otherIncomeField.text?.contains("."))! {
                if otherIncomeField.text?.components(separatedBy: ".")[1].count == 3 {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
            if Global.shared.new_otherIncome_is_required == true {
                if otherIncomeField.text!.count <= -1 {
                    otherIncomeReqLbl.isHidden = false
                }
                else {
                    otherIncomeReqLbl.isHidden = true
                }
            }
            return otherIncomeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
        
    }
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    func dropValuesChanged(dropDisplay: String, dropValue: String) {
        self.occuptnAnswerLbl.text = dropDisplay
        self.occuptionSelected = dropValue
        
        ProfileDetails.shared.occupation = dropValue
    }
    @IBAction func occuptnToolTipActn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        
        
        if self.easyTipView == nil
        {
            self.easyTipView = EasyTipView(text: Global.shared.occupationToolTip)
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
    @IBAction func otherIncomeToolTipActn(_ sender: Any) {
    }
    
}
