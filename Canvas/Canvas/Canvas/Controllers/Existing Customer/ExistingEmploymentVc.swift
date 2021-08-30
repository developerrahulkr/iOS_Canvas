//
//  ExistingEmploymentVc.swift
//  Canvas
//
//  Created by urmila reddy on 05/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class ExistingEmploymentVc: UIViewController {
    @IBOutlet weak var tabLblTwo: UILabel!
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    
    @IBOutlet weak var tabLblFour: UILabel!

     @IBOutlet weak var mainView: UIView!
        
        @IBOutlet weak var scrollVieww: UIScrollView!
        //testing
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
            
            self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
                   self.tabLblTwo.clipsToBounds = true
                   
                   self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
                   self.tabLblThree.clipsToBounds = true
                   
                   self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
                   self.tabLblFour.clipsToBounds = true
            
            employField.isEnabled = false
            employFieldLbl.isEnabled = false
            occuptnAnswerLbl.isEnabled = false
            employLocatnField.isEnabled = false
            designtnAnswerLbl.isEnabled = false
            salaryField.isEnabled = false
            otherIncomeField.isEnabled = false
            
            employField.text = ExistingUser.shared.employerName
            employFieldLbl.text = ""
            occuptnAnswerLbl.text = ExistingUser.shared.occupation
            employLocatnField.text = ExistingUser.shared.employerLocation
            designtnAnswerLbl.text = ExistingUser.shared.designation
            salaryField.text = ExistingUser.shared.salary
            otherIncomeField.text = ExistingUser.shared.otherIncome
            
            
            self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
            self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
            
            
            firstView.layer.cornerRadius = 5
            thirdView.layer.cornerRadius = 5
            occuptionView.layer.cornerRadius = 5
            employLocationView.layer.cornerRadius = 5
            designationView.layer.cornerRadius = 5
            salaryView.layer.cornerRadius = 5
            otherIncomeView.layer.cornerRadius = 5
            
            nextBtnOtlt.layer.cornerRadius = 5
            bckBtnOtlt.layer.cornerRadius = 5
            
            occuptnLbl.font = Global.shared.fontTopLbl
            occuptnLbl.textColor = ColorCodes.topTitleColor
            
            occuptnAnswerLbl.font = Global.shared.fontBottomLbl
            occuptnAnswerLbl.textColor = ColorCodes.bottomTitleColor
            
            employeNameLbl.font = Global.shared.fontTopLbl
            employeNameLbl.textColor = ColorCodes.topTitleColor
            
            employField.font = Global.shared.fontBottomLbl
            employField.textColor = ColorCodes.bottomTitleColor
            
            employIdLbl.font = Global.shared.fontTopLbl
            employIdLbl.textColor = ColorCodes.topTitleColor
            
            employFieldLbl.font = Global.shared.fontBottomLbl
            employFieldLbl.textColor = ColorCodes.bottomTitleColor
            
            employLocatnLbl.font = Global.shared.fontTopLbl
            employLocatnLbl.textColor = ColorCodes.topTitleColor
            
            employLocatnField.font = Global.shared.fontBottomLbl
            employLocatnField.textColor = ColorCodes.bottomTitleColor
            
            designtnLbl.font = Global.shared.fontTopLbl
            designtnLbl.textColor = ColorCodes.topTitleColor
            
            designtnAnswerLbl.font = Global.shared.fontBottomLbl
            designtnAnswerLbl.textColor = ColorCodes.bottomTitleColor
            
            salaryLbl.font = Global.shared.fontTopLbl
            salaryLbl.textColor = ColorCodes.topTitleColor
            
            salaryField.font = Global.shared.fontBottomLbl
            salaryField.textColor = ColorCodes.bottomTitleColor
            
            otherIncomeLbl.font = Global.shared.fontTopLbl
            otherIncomeLbl.textColor = ColorCodes.topTitleColor
            
            otherIncomeField.font = Global.shared.fontBottomLbl
            otherIncomeField.textColor = ColorCodes.bottomTitleColor
            
            
            assignLabels()
        }
        
        func assignLabels() {
            headerLbl.text = Global.shared.newCustomerHeader
            
                occuptnLbl.text = Global.shared.ocuptnTxt
           
                employeNameLbl.text = Global.shared.employNameTxt
           
                employIdLbl.text = Global.shared.employeIdTxt
          
                employLocatnLbl.text = Global.shared.employLoctn
            
                designtnLbl.text = Global.shared.designtnTxt
            
                salaryLbl.text = Global.shared.salaryEmploy
            
                otherIncomeLbl.text = Global.shared.otherIncome
            
            
            identityTabLbl.text = Global.shared.identityTabNameTxt
            personalTabLbl.text = Global.shared.personalTabNameTxt
            emplomntTabLbl.text = Global.shared.employmentTabNameTxt
            remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
            
            nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
            bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
            
            
          
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
    self.pushViewController(controller: ExistingRemitanceVc.initiateController(),isGestureEnable: false, animated: false)
    
    
  }
        
        @IBAction func bckBtnActn(_ sender: Any) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.popViewController(animated: false)
        }
        
        @IBAction func occuptnDrpDwnActn(_ sender: Any) {
        
            
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
        
        
    }

