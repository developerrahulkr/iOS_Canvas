//
//  SecuityQuestionCell.swift
//  
//
//  Created by Varun Peddi on 30/11/20.
//

import UIKit

protocol SecurityQuestionCellDelegate: AnyObject {
  func onTapSecurityQuestion(on cell: SecurityQuestionCell)
}
class SecurityQuestionCell: UITableViewCell {
  
  weak var delegate:SecurityQuestionCellDelegate?
  @IBOutlet weak var answerTextField: CustomTextField!
  @IBOutlet weak var selectQuestionBtn: UIButton!
  @IBOutlet weak var ansRequiredLbl: UILabel!
  @IBOutlet weak var questionTextField: CustomTextField!
  @IBOutlet weak var dropDownIcon: UIImageView!
  
  @IBOutlet weak var fiedlLabelRequired: UILabel!
  var pickerResponseData = [[String: String]]()
  var securityQuestion: SecurityQuestion?
  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func setupView() {
    answerTextField.delegate = self
    questionTextField.delegate = self
    answerTextField.placeholder = Global.shared.answerTxt
   // answerTextField.text = "Add your answer"
    selectQuestionBtn.layer.cornerRadius = 5
    selectQuestionBtn.borderColor = .lightGray
    selectQuestionBtn.backgroundColor = .white
    
    selectQuestionBtn.titleLabel?.minimumScaleFactor = 0.5
    selectQuestionBtn.titleLabel?.numberOfLines = 0
    selectQuestionBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    
    selectQuestionBtn.layer.masksToBounds = true
    ansRequiredLbl.font = Global.shared.fontReqLbl
    ansRequiredLbl.textColor = ColorCodes.newAppRed
    
  }
  func configureCell(with data:SecurityQuestion) {
    self.securityQuestion = data
    
    questionTextField.borderColor = .lightGray
    questionTextField.backgroundColor = .white
    if data.isextraQuestionEnabled {
      questionTextField.isHidden = false
      questionTextField.placeholder = "Enter question"
      selectQuestionBtn.isHidden = true
      dropDownIcon.isHidden = true
    } else {
      selectQuestionBtn.setTitle(data.question, for: .normal)
      questionTextField.isHidden = true
      selectQuestionBtn.isHidden = false
      dropDownIcon.isHidden = false
      
    }
    answerTextField.text = data.answer
    
  }
  func setSecurityQuestion(value: BeneficiaryPurposeData) {
    
  }
  @IBAction func selectQuestionButtonPressed(_ sender: UIButton) {
    Global.shared.firstTimeStr = "second"
    
  //  self.securityQuestion = SecurityQuestion[selectQuestionBtn.tag]
    delegate?.onTapSecurityQuestion(on: self)
//    PickerDialog().show(title: "", options: pickerResponseData , selected: "") {
//      (value) -> Void in
//      //      self.civilIdAnswerLbl.text = "\(value)"
//      //    self.identityTypeReqLbl.isHidden = true
//      self.securityQuestion?.question = value
//      self.selectQuestionBtn.setTitle(" " + "\(value)", for: .normal)
//
//    }
  }
}

extension SecurityQuestionCell: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    if textField == answerTextField{
      if Global.shared.exist_answer_is_required == true {
        if answerTextField.text?.count ==  0 {
         // ansRequiredLbl.isHidden = false
          securityQuestion?.answer = ""

        }
        else {
          securityQuestion?.answer = answerTextField.text
         // ansRequiredLbl.isHidden = true
        }
      }
    }
    
    if textField == questionTextField{
      if Global.shared.exist_answer_is_required == true {
        if questionTextField.text?.count ==  0 {
         // fiedlLabelRequired.isHidden = false
          securityQuestion?.question = ""
        }
        else {
          securityQuestion?.question = questionTextField.text

        //  fiedlLabelRequired.isHidden = true
        }
      }
    }
    
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if textField == answerTextField {
      if Global.shared.exist_answer_is_required == true {
        if answerTextField.text!.count <= -1 {
          //ansRequiredLbl.isHidden = false
          securityQuestion?.answer = ""

        }
        else {
          securityQuestion?.answer = answerTextField.text
         // ansRequiredLbl.isHidden = true
        }
      }
      return answerTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
      
    } else if textField == questionTextField {
      if Global.shared.exist_answer_is_required == true {
        if questionTextField.text!.count <= -1 {
         // fiedlLabelRequired.isHidden = false
          securityQuestion?.question = ""

        }
        else {
          securityQuestion?.question = questionTextField.text
         // fiedlLabelRequired.isHidden = true
        }
      }
      return questionTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
    }
    
    return true
    
  }
}

extension SecurityQuestionCell: PopupViewControllerDelegate {
  func didSelectItem<T>(item: T, vc: UIViewController?) {
    if let item = item as? String {
           self.securityQuestion?.question = item
      //  self.securityQuestion = self.securityQuestion?.question
          self.selectQuestionBtn.setTitle(" " + "\(item)", for: .normal)
       }
    vc?.dismiss(animated: true, completion: nil)
  }
}
