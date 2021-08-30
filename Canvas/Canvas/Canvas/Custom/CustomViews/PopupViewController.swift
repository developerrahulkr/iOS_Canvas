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
}
class PopupViewController: UIViewController {
  
  static let identifier = "PopupViewController"
  weak var delegate: PopupViewControllerDelegate?
  //MARK:- outlets for the viewController
  @IBOutlet weak var dialogBoxView: UIView!
  @IBOutlet weak var okayButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  
  var items: [BeneficiaryPurposeData] = []
  var questionItem: [String] = []
  var screenType: PopupScreenType = .purposeScreen
  @IBOutlet weak var popupTableView: UITableView!
  @IBOutlet weak var tableViewHeightConstraint:NSLayoutConstraint!
  
  //MARK:- lifecyle methods for the view controller
  override func viewDidLoad(){
    super.viewDidLoad()
    
    //adding an overlay to the view to give focus to the dialog box
    view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
    
    //customizing the dialog box view
    dialogBoxView.layer.cornerRadius = 10.0
    dialogBoxView.layer.masksToBounds = true
    configureTableView()
   /* let image = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
    cancelButton.setImage(image, for: .normal)
    cancelButton.tintColor = UIColor.red*/
    self.popupTableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    
    
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  deinit {
    self.popupTableView.removeObserver(self, forKeyPath: "contentSize", context: nil)
    
  }
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    popupTableView.layer.removeAllAnimations()
 //   tableViewHeightConstraint.constant = popupTableView.contentSize.height
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
    }
    popupTableView.reloadData()
  }
  private func numberOfItems() -> Int {
    switch screenType {
    case .purposeScreen:
      return items.count
    case .questionsScreen:
      return self.questionItem.count
    }
    
    
  }
  private func item(at index: Int) -> String?{
    switch screenType {
      
    case .purposeScreen:
        return items[index].name
    
    case .questionsScreen:
      return self.questionItem[index]
      
    }
  }
  
  //MARK:- outlet functions for the viewController
  @IBAction func okayButtonPressed(_ sender: Any) {
    closeVC()
  }
  @IBAction func cancelButtonPressed(_ sender: Any) {
    closeVC()
  }
  private func closeVC() {
    self.dismiss(animated: true, completion: nil)
    
  }
  
  //MARK:- functions for the viewController
  @discardableResult
  static func showPopup(parentVC: UIViewController, data: [BeneficiaryPurposeData]) -> PopupViewController?{
    
    //creating a reference for the dialogView controller
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
