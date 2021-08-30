//
//  VerifyAcntThirdVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class VerifyAcntThirdVc: UIViewController, UITextFieldDelegate {
  
  
  //    @IBOutlet weak var newQuestnField: CustomTextField!
  //    @IBOutlet weak var newAnswerField: CustomTextField!
  
  @IBOutlet weak var tabLblThree: UILabel!
  @IBOutlet weak var tabLblFour: UILabel!
  
  
  @IBOutlet weak var headerLbl: UILabel!
  
      @IBOutlet weak var createQuestnLbl: UIButton!
  
  @IBOutlet weak var contineBtnOtlt: UIButton!
  var securityRule: SecurityRule?
  var securityQuestionList:[String] = []
    var securityQuestionListForDrpDwn:[String] = []
  @IBOutlet weak var bckBtnOtlt: UIButton!
  
  //    @IBOutlet weak var firstQuestnOtlt: UIButton!
  //
  //    @IBOutlet weak var firstAnswerField: CustomTextField!
  //
  //
  //    @IBOutlet weak var secndQuestnOtlt: UIButton!
  //
  //
  //    @IBOutlet weak var secndAnswerField: CustomTextField!
  //
  //    @IBOutlet weak var createTopConstrt: NSLayoutConstraint!
  //
  //
  //    @IBOutlet weak var firstAnsrRequiredLbl: UILabel!
  //
  //    @IBOutlet weak var secndAnsrRequireLbl: UILabel!
  //
  //
  //    @IBOutlet weak var thirdQuestnRequireLbl: UILabel!
  //
  //    @IBOutlet weak var thirdAnswerRequireLbl: UILabel!
  //
  //
  //    @IBOutlet weak var newAnsweView: UIView!
  
  
  @IBOutlet weak var questionTvHeightCons: NSLayoutConstraint!
 // @IBOutlet weak var newAnswerQuestnview: UIView!
  
  @IBOutlet weak var questionsTableView: UITableView!
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var stackHeight: NSLayoutConstraint!
    
    @IBOutlet weak var hederTopConstrt: NSLayoutConstraint!
    
    var clacultnCount: Int!
    var tableViewCountHeight: Int!
  
  var expandCreateClick = true
  var dropdownData = [String]()
  var pickerResponseData = [[String: String]]()
  var securityQuestion:[SecurityQuestion] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    
  //  self.showSpinner(onView: self.view)
    registerCellFoQuestionTableView()
    
    
    if  Global.shared.securityQuestnsReset ==  "reset" {
    contineBtnOtlt.setTitle(Global.shared.resetTxt, for: .normal)
        topStack.isHidden = true
        stackHeight.constant = 0
        hederTopConstrt.constant = 0
    }
    else {
        contineBtnOtlt.setTitle(Global.shared.continueBtnTxt, for: .normal)
    }
    
    // Do any additional setup after loading the view.
    //        firstAnsrRequiredLbl.font = Global.shared.fontReqLbl
    //        firstAnsrRequiredLbl.textColor = ColorCodes.newAppRed
    //
    //        secndAnsrRequireLbl.font = Global.shared.fontReqLbl
    //        secndAnsrRequireLbl.textColor = ColorCodes.newAppRed
    //
    //        thirdQuestnRequireLbl.font = Global.shared.fontReqLbl
    //        thirdQuestnRequireLbl.textColor = ColorCodes.newAppRed
    //
    //        thirdAnswerRequireLbl.font = Global.shared.fontReqLbl
    //        thirdAnswerRequireLbl.textColor = ColorCodes.newAppRed
    
    
    contineBtnOtlt.layer.cornerRadius = 5
    bckBtnOtlt.layer.cornerRadius = 5
    //        firstQuestnOtlt.layer.cornerRadius = 5
    //        firstAnswerField.layer.cornerRadius = 5
    //        secndQuestnOtlt.layer.cornerRadius = 5
    //        secndAnswerField.layer.cornerRadius = 5
    //        newQuestnField.layer.cornerRadius = 5
    //        newAnswerField.layer.cornerRadius = 5
    //
    //        firstAnswerField.delegate = self
    //        secndAnswerField.delegate = self
    //        newQuestnField.delegate = self
    //        newAnswerField.delegate = self
    //
    
    self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
    self.tabLblThree.clipsToBounds = true
    
    self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
    self.tabLblFour.clipsToBounds = true
    
    // assignLabels()
    downloadAccountConfig()
    headerLbl.text = Global.shared.thirdTabHeaderTxt
    createQuestnLbl.setTitle("+" + Global.shared.createQuestnBtnTxt, for: .normal)
    
   
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
    self.questionsTableView.reloadData()

  }
  
  //    func assignLabels() {
  //        headerLbl.text = Global.shared.thirdTabHeaderTxt
  //        createQuestnLbl.setTitle(Global.shared.createQuestnBtnTxt, for: .normal)
  //        contineBtnOtlt.setTitle(Global.shared.continueBtnTxt, for: .normal)
  //        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
  //        firstAnsrRequiredLbl.text = Global.shared.errorTxtRequired
  //        secndAnsrRequireLbl.text = Global.shared.errorTxtRequired
  //        thirdQuestnRequireLbl.text = Global.shared.errorTxtRequired
  //        thirdAnswerRequireLbl.text = Global.shared.errorTxtRequired
  //
  //        newQuestnField.placeholder = " " + Global.shared.enterQuestnTxt
  //        newAnswerField.placeholder = " " + Global.shared.answerPlaceHolderTxt
  //        firstAnswerField.placeholder = " " + Global.shared.answerPlaceHolderTxt
  //        secndAnswerField.placeholder = " " + Global.shared.answerPlaceHolderTxt
  //
  //        newQuestnField.maxLength = Global.shared.exist_securityQuestion_max_length
  //        newAnswerField.maxLength = Global.shared.exist_answer_max_length
  //        firstAnswerField.maxLength = Global.shared.exist_answer_max_length
  //        secndAnswerField.maxLength = Global.shared.exist_answer_max_length
  //
  //        newQuestnField.valueType = Global.shared.getFieldType(text: Global.shared.exist_securityQuestion_field_accept)
  //        newAnswerField.valueType = Global.shared.getFieldType(text: Global.shared.exist_answer_field_accept)
  //        firstAnswerField.valueType = Global.shared.getFieldType(text: Global.shared.exist_answer_field_accept)
  //        secndAnswerField.valueType = Global.shared.getFieldType(text: Global.shared.exist_answer_field_accept)
  //
  //    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
    var newVarstr = ""
  @IBAction func createYourQusetnActn(_ sender: Any) {
    guard let questionCount = self.securityRule?.signup_questions_answered_limit, let validCount = Int(questionCount), validCount > securityQuestion.count -  self.clacultnCount else {
      let alert = ViewControllerManager.displayAlert(message:  Global.shared.youCantCreateAnthrQuestnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
      return
      
    }
    let tempQuestion = SecurityQuestion()
    tempQuestion.isextraQuestionEnabled =  true
    securityQuestion.append(tempQuestion)
    self.handleTvHeight(count: self.securityQuestion.count)
    questionsTableView.beginUpdates()
    
    let newCount = self.tableViewCountHeight ?? 1
    newVarstr = "row added"
    let countt = newCount + 1
    let indexPath = IndexPath(row: securityQuestion.count - countt, section: 0)
    questionsTableView.insertRows(at: [indexPath], with: .bottom)
    questionsTableView.endUpdates()
    questionsTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    //        if(expandCreateClick == true) {
    //            newQuestnField.isHidden = false
    //            newAnswerField.isHidden = false
    //            newAnsweView.isHidden = false
    //            newAnswerQuestnview.isHidden = false
    //            self.createTopConstrt.constant = 190
    //        } else {
    //            newQuestnField.isHidden = true
    //            newAnswerField.isHidden = true
    //            thirdQuestnRequireLbl.isHidden = true
    //            thirdAnswerRequireLbl.isHidden = true
    //            newAnsweView.isHidden = true
    //            newAnswerQuestnview.isHidden = true
    //            self.createTopConstrt.constant = 8
    //        }
    //
    //expandCreateClick = !expandCreateClick
    
  }
  
  @IBAction func continueBtnActn(_ sender: Any) {
    let filtersecuirtyQuestion = securityQuestion.filter { elem in
      if let question =  elem.question, let answer =  elem.answer, !question.isEmpty, !answer.isEmpty{
        return true
      } else { return false }
      
    }
    let questions = filtersecuirtyQuestion.map{ $0.question }
    let newQuestions = questions.filter { $0 != Global.shared.selectYourQuestnTxt! }
    
    let questionCount = self.securityRule?.signup_questions_answered_limit ?? "3"
    let maximumQuestionsCount = Int(questionCount) ?? 0
    guard newQuestions.count == maximumQuestionsCount  else {
        let alert = ViewControllerManager.displayAlert(message: Global.shared.answer3QuestnsAlert, title:APPLICATIONNAME)
          self.present(alert, animated: true, completion: nil)
      return
    }
    
   
    
    
    
    let uniqueQuestions = Set(questions)
    if uniqueQuestions.count < questions.count {
      let alert = ViewControllerManager.displayAlert(message:"Security questions repeated", title:APPLICATIONNAME)
      self.present(alert, animated: true, completion: nil)
      return
    }
  
    let securityAnswers = filtersecuirtyQuestion.map{ tempSecQuestion in
      return ["securityQuestion": "\(tempSecQuestion.question!)", "answer": "\(tempSecQuestion.answer!)"]
    }
    print(securityAnswers)
    
    Global.shared.AllQuetnAry = securityAnswers
    
    if  Global.shared.securityQuestnsReset ==  "reset" {
   resetQuestions()
    }
    else {
        let verifyAcountFourthVc: VerifyAcountFourthVc = .initiateController()
        self.pushViewController(controller: verifyAcountFourthVc, isGestureEnable: false)
    }
    
  }
    
    func resetQuestions() {
        let paramaterPasing: [String:Any] =
            ["registrationId":  Global.shared.afterLoginRegistrtnId ?? "",
             "userSecurityQuestionsList":  Global.shared.AllQuetnAry!]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.resetSecurityQuestnsImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal!)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                //let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        let alert6 = UIAlertController(
                            title: "",
                            message: statusMsg,
                            preferredStyle: UIAlertController.Style.alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.pushViewController(controller: LoginVc.initiateController())

                        }
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                       
                        
                    }
                        
                    else {
                        self.removeSpinner()
                        let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
                
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
  
  @IBAction func bckBtnActn(_ sender: Any) {
    
    if  Global.shared.securityQuestnsReset ==  "reset" {
        self.pushViewController(controller: LoginVc.initiateController())
    }
    else {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
   
  }
  
    var securityQuestionsM =  [[String: Any]]()
  
    // MARK: From configuartions getting security questions
  func downloadAccountConfig() {
    
    let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
    
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json"
    ]
    
    NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
      
      if errorString == nil
      {
        self.removeSpinner()
        
        print(resonseTal!)
        if let securityRules =  resonseTal?.value(forKey: "securityQuestionRules") as? String {
          print(securityRules)
          if let data = securityRules.data(using: .utf8) {
            self.securityRule = try? JSONDecoder().decode(SecurityRule.self, from: data)
          }
         
        }
        if let securityQuestions = resonseTal?.value(forKey: "masterSecurityQuestions") as? [[String: Any]] {
            print(securityQuestions)
            
            self.securityQuestionsM.append(["question": Global.shared.selectYourQuestnTxt!, "languageCode": "en", "serialNumber": 1, "questionId": 1])
            self.securityQuestionsM.append(["question": Global.shared.selectYourQuestnTxt!, "languageCode": "en", "serialNumber": 1, "questionId": 2])
            self.securityQuestionsM.append(["question": Global.shared.selectYourQuestnTxt!, "languageCode": "en", "serialNumber": 1, "questionId": 3])
            self.securityQuestionsM.append(contentsOf: securityQuestions)
            print(self.securityQuestionsM)
            let data = SecurityQuestion.getSecurityQuestion(self.securityQuestionsM)
          self.securityQuestion = data
          
            
            self.clacultnCount = self.securityQuestion.count
            self.tableViewCountHeight = self.securityQuestion.count - 3
            
            self.handleTvHeight(count: self.securityQuestion.count)
          self.securityQuestionList = self.securityQuestion.map{$0.question ?? ""}
            
            self.securityQuestionListForDrpDwn = self.securityQuestionList.filter { $0 != Global.shared.selectYourQuestnTxt! }
          self.questionsTableView.reloadData()
        }
        if let securityQuestion = resonseTal?.value(forKey: "masterSecurityQuestions") as? NSArray {
//          print(securityQuestion)
//          if let allQuestion = securityQuestion.value(forKey: "question") as? [String] {
//            print(allQuestion)
//            self.dropdownData = allQuestion
//          }
//          print(self.dropdownData)
//
//          for i in 0..<self.dropdownData.count {
//            self.pickerResponseData.append(["value": self.dropdownData[i], "display": self.dropdownData[i]])
//          }
//
          
        }
        print(self.pickerResponseData)
        
      }
        
      else
      {
        print(errorString!)
        self.removeSpinner()
        let finalError = errorString?.components(separatedBy: ":")
        let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
        self.present(alert, animated: true, completion: nil)
        
      }
    }
    
  }
  
  func handleTvHeight(count: Int) {
    let calCount = count - self.tableViewCountHeight
    questionTvHeightCons.constant = CGFloat(180 * calCount)
    self.view.layoutIfNeeded()
  }
 
  
  @IBAction func languageChangeActn(_ sender: Any) {
    Global.shared.languageChangeActn()
  }
  
  
  
}
extension VerifyAcntThirdVc {
  func registerCellFoQuestionTableView() {
    let nib = UINib(nibName: "SecuityQuestionCell", bundle: Bundle.main)
    questionsTableView.register(nib, forCellReuseIdentifier: "SecuityQuestionCell")
    questionsTableView.delegate = self
    questionsTableView.dataSource = self
    
  }
}
extension VerifyAcntThirdVc: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if newVarstr == "row added" {
      //  let count = securityQuestion.count - self.tableViewCountHeight
      //  return count + 1
        return securityQuestion.count - self.tableViewCountHeight
    }
  else  if securityQuestion.count > 0 {
    return securityQuestion.count - self.tableViewCountHeight
    }
    else {
       return securityQuestion.count
    }
   // return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SecuityQuestionCell", for: indexPath) as! SecurityQuestionCell
    cell.pickerResponseData = pickerResponseData
    cell.delegate = self
    
    
  //  let data = securityQuestion[indexPath.row]
    if securityQuestion.count > 0 {
        if newVarstr == "row added" {
            let addedDataCount = self.securityQuestion.count -  self.clacultnCount
         //   let finalLastCount =
            
            let lastQuestnData = securityQuestion.suffix(addedDataCount)
            print(lastQuestnData)
            
          //  let calcData = securityQuestion.prefix(3) +
            let data = securityQuestion.prefix(3)
            
            let finalData = (data + lastQuestnData)[indexPath.row]
               // let data = securitydata[indexPath.row]
            cell.configureCell(with: finalData)
        }
        else {
            let data = securityQuestion.prefix(3)[indexPath.row]
               // let data = securitydata[indexPath.row]
            cell.configureCell(with: data)
        }
  
    }
    return cell
  }
  
  
}
extension VerifyAcntThirdVc: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}


extension VerifyAcntThirdVc: SecurityQuestionCellDelegate {
 
   
    
  func onTapSecurityQuestion(on cell: SecurityQuestionCell) {
    let popOverVC = PopupViewController.showPopup(parentVC: self, data: [])
    popOverVC?.setListData(with: .questionsScreen, data: self.securityQuestionListForDrpDwn)
    popOverVC?.delegate = cell
    
    
  }
}

