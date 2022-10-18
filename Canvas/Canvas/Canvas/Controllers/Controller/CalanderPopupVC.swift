//
//  CalanderPopupVC.swift
//  Canvas
//
//  Created by Akshay_mac on 29/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

protocol PopupDelegate: AnyObject {
  func didSelectItem<T>(item: T, vc: UIViewController?)
  
}

enum ScreenType {
    case calander
    case timeSlot
}

class CalanderPopupVC : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate : PopupDelegate?
    var item : [CMSelectDate] = []
    var timeSlotData : [FXTimeSlot] = []
    var screenType : ScreenType = .calander
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CalanderCell", bundle: nil), forCellReuseIdentifier: "CalanderCell")
    }
    
    @IBAction func onClickCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func onClickedDismissBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func setListData(with screenType: ScreenType, data:[Any]) {
      self.screenType = screenType
      switch screenType {
      case .calander:
        if let items = data as? [CMSelectDate] {
          self.item = items
        }
      case .timeSlot:
          if let items = data as? [FXTimeSlot] {
              self.timeSlotData = items
        }
      }
//        self.tableView.reloadData()
    }
    
    private func numberOfItems() -> Int {
      switch screenType {
      case .calander:
        return item.count
      case .timeSlot:
        return timeSlotData.count
      }
      
      
    }
    
    private func item(at index: Int) -> String?{
      switch screenType {
      case .calander:
          return item[index].sDate
      case .timeSlot:
          return timeSlotData[index].name
        
      }
    }

}

extension CalanderPopupVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalanderCell", for: indexPath) as! CalanderCell
        cell.lblCalander.font = UIFont.systemFont(ofSize: 14.0)
        if screenType == .calander {
            cell.lblCalander.text = item[indexPath.row].sDate
            
        }else{
            cell.lblCalander.text = timeSlotData[indexPath.row].name
            
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.screenType == .calander {
            self.delegate?.didSelectItem(item:  self.item[indexPath.row], vc: self)
        }else{
            self.delegate?.didSelectItem(item: self.timeSlotData[indexPath.row], vc: self)
        }
        self.dismiss(animated: true)
    }
    
    
}
