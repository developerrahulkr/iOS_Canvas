//
//  NormalPopup.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

protocol PopupViewControllerDelegate: AnyObject {
  func didSelectItem<T>(item: T, vc: UIViewController?)
  
}
enum PopupScreenType {
  case purposeScreen
  case questionsScreen
    case purposeTransferNames
}
class PopupViewController: UIViewController {
  
  static let identifier = "PopupViewController"
  weak var delegate: PopupViewControllerDelegate?
    //MARK: - ***************************************** OUTLETS ************************************************
  @IBOutlet weak var dialogBoxView: UIView!
  @IBOutlet weak var okayButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
    
  
  @IBOutlet weak var popupTableView: UITableView!
  @IBOutlet weak var tableViewHeightConstraint:NSLayoutConstraint!
    //MARK: - ************************************ END OF OUTLETS *********************************************
    
    
    //MARK: - *************************************** VARIABLE ************************************************
    var items: [BeneficiaryPurposeData] = []
    var questionItem: [String] = []
    var screenType: PopupScreenType = .purposeScreen
    var purposeData : [String] = []
    //MARK: - **************************************END VARIABLE **********************************************

    //MARK: - *************************************** LIFECYCLE METHODS **********************************************
  override func viewDidLoad(){
    super.viewDidLoad()

    view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

    dialogBoxView.layer.cornerRadius = 10.0
    dialogBoxView.layer.masksToBounds = true
    configureTableView()
 
    self.popupTableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
    
  deinit {
    self.popupTableView.removeObserver(self, forKeyPath: "contentSize", context: nil)
  }
    //MARK: - **********************************END OF LIFECYCLE METHODS ********************************************

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    popupTableView.layer.removeAllAnimations()
    tableViewHeightConstraint.constant = popupTableView.contentSize.height <= 450 ? popupTableView.contentSize.height : 450
    UIView.animate(withDuration: 0.5) {
      self.updateViewConstraints()
    }
    
  }
  private func configureTableView() {
    popupTableView.delegate = self
    popupTableView.dataSource = self
    popupTableView.estimatedRowHeight = 44
    popupTableView.rowHeight = UITableView.automaticDimension
  }
  func setListData(with screenType: PopupScreenType, data:[Any]) {
    self.screenType = screenType
    switch screenType {
    case .purposeScreen:
      if let items = data as? [BeneficiaryPurposeData] {
        self.items = items
      }
    case .questionsScreen:
      if let items = data as? [String] {
        self.questionItem = items
      }
    case .purposeTransferNames:
        if let items = data as? [String] {
            self.purposeData = items
        }
        
    }
    popupTableView.reloadData()
  }
  private func numberOfItems() -> Int {
    switch screenType {
    case .purposeScreen:
      return items.count
    case .questionsScreen:
      return self.questionItem.count
    case .purposeTransferNames:
        return self.purposeData.count
    }
      
    
    
  }
  private func item(at index: Int) -> String?{
    switch screenType {
      
    case .purposeScreen:
        return items[index].name
    
    case .questionsScreen:
      return self.questionItem[index]
      
    case .purposeTransferNames:
        return self.purposeData[index]
    }
  }
  
    //MARK: - **************************************** ALL ACTIONS **************************************************

  @IBAction func okayButtonPressed(_ sender: Any) {
    closeVC()
  }
  @IBAction func cancelButtonPressed(_ sender: Any) {
    closeVC()
  }
    //MARK: - ************************************** END ALL ACTIONS ************************************************

  private func closeVC() {
    self.dismiss(animated: true, completion: nil)
    
  }
  
  //MARK: - functions for the viewController
  @discardableResult
  static func showPopup(parentVC: UIViewController, data: [BeneficiaryPurposeData]) -> PopupViewController?{
    
  //MARK: creating a reference for the dialogView controller
    if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController {
      popupViewController.modalPresentationStyle = .custom
      popupViewController.modalTransitionStyle = .crossDissolve
      popupViewController.items = data
      //presenting the pop up viewController from the parent viewController
      parentVC.present(popupViewController, animated: true)
      return popupViewController
    }
    return nil
  }
    
    
    @discardableResult
    static func showPurposePopup(parentVC: UIViewController, data: [String]) -> PopupViewController?{
      
    //MARK: creating a reference for the dialogView controller
      if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController {
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
          popupViewController.purposeData = data
        //presenting the pop up viewController from the parent viewController
        parentVC.present(popupViewController, animated: true)
        return popupViewController
      }
      return nil
    }
    
    
    @discardableResult
    static func showCalanderPopup(parentVC: UIViewController, data: [BeneficiaryPurposeData]) -> CalanderPopupVC?{
      
    //MARK: creating a reference for the dialogView controller
        if let popupViewController = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "CalanderPopupVC") as? CalanderPopupVC {
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
//        popupViewController.items = data
        //presenting the pop up viewController from the parent viewController
        parentVC.present(popupViewController, animated: true)
        return popupViewController
      }
      return nil
    }
  
}










extension PopupViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfItems()
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "popupCell", for: indexPath)
    cell.textLabel?.text = item(at: indexPath.row)
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if self.screenType == .purposeScreen {
        let item = items[indexPath.row]
        self.delegate?.didSelectItem(item:  item, vc: self)
    }
    else {
         self.delegate?.didSelectItem(item:  self.item(at: indexPath.row), vc: self)
    }
   
//    self.closeVC()
  }
}
