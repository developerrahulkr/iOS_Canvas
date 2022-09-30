//
//  CellSectionTwo.swift
//  Canvas
//
//  Created by apple on 22/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

protocol protocolPush: NSObjectProtocol{
    func didPressCell(sender: Any)
    func getHomeAddress()
    func getBranchAddress()
    func getSelectDate() -> Void
    func getTimeSlot() -> Void
    func getPurposeName() -> Void
}
class CellSectionTwo: UITableViewCell {
    
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var TFSelectPurposeOf: UITextField!
    @IBOutlet weak var homeSegment: UISegmentedControl!
    @IBOutlet weak var collectionViewDeliveryOption: UICollectionView!
    @IBOutlet weak var TFSelectDate: UITextField!
    @IBOutlet weak var TFTimeSlot: UITextField!
    @IBOutlet weak var viewPurposeOf: UIView!
    @IBOutlet weak var TFDeliveryInst: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var BtnCancle: UIButton!
    
    //MARK: - VARIABLES
    var Pushdelegate:protocolPush?
    
    var homeDataSource : [CMBookingHomeAddress] = {
      let data = [CMBookingHomeAddress]()
        return data
    }()
    
    lazy var branchDataSource : [CMBookingBranchAddress] = {
        let data = [CMBookingBranchAddress]()
          return data
    }()
    
    //MARK: - LIFECYCLE METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewDeliveryOption.dataSource = self
        collectionViewDeliveryOption.delegate = self
        
        TFSelectDate.layer.borderWidth = 1
        TFTimeSlot.layer.borderWidth = 1
        TFDeliveryInst.layer.borderWidth = 1
        
        TFSelectDate.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        TFTimeSlot.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        TFDeliveryInst.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        TFSelectDate.layer.cornerRadius = 5
        TFTimeSlot.layer.cornerRadius = 5
        TFDeliveryInst.layer.cornerRadius = 5
        
        viewPurposeOf.layer.borderWidth = 1
        viewPurposeOf.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        viewPurposeOf.layer.cornerRadius = 5
        
        TFSelectPurposeOf.layer.borderColor = nil
        
        btnSubmit.layer.cornerRadius = 3
        BtnCancle.layer.cornerRadius = 3
        homeSegment.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        homeSegment.layer.borderWidth = 1
        
        collectionViewDeliveryOption.register(UINib(nibName: "CellDeliveryOption", bundle: nil), forCellWithReuseIdentifier: "CellDeliveryOption")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionViewDeliveryOption.setCollectionViewLayout(layout, animated: true)
        
        
        
        
    }
        // Configure the view for the selected state

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        print("Home Cell Data : ::::::::::      :::::::::::::    \(homeDataSource)", homeDataSource.count)
        collectionViewDeliveryOption.reloadData()
    }
    
    //MARK: - ACTIONS
    
//    btnAdd.addTarget(self, action: #selector(onTapAdd(sender:)), for: .touchUpInside)

    
    @IBAction func onTapAdd(_ sender: UIButton) {
        self.Pushdelegate?.didPressCell(sender: sender.tag)
        let buttonTag = sender.tag
        
    }
   
    @IBAction func onTapMix(_ sender: Any) {
        
        
    }
    
    
    @IBAction func onClickedSelectDate(_ sender: UIButton) {
        Pushdelegate?.getSelectDate()
    }
    
    @IBAction func onClickedTimeSlotData(_ sender: UIButton) {
        Pushdelegate?.getTimeSlot()
    }
    
    @IBAction func onClickedPurposeCode(_ sender: UIButton) {
        self.Pushdelegate?.getPurposeName()
    }
    
    
    @IBAction func onClickedSengment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sender.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.colorFrom(hexString: "#FFFFFF")!], for: .selected)
            Pushdelegate?.getHomeAddress()
        }else {
            sender.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.colorFrom(hexString: "#FFFFFF")!], for: .selected)
            Pushdelegate?.getBranchAddress()
        }
    }
    
    
    @IBAction func onTapHighValue(_ sender: Any) {
        
        
        
    }
    
    
    //MARK: - FUNCTIONS
    
}
//MARK: - EXTENSIONS
extension CellSectionTwo : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeDataSource.isEmpty {
            return branchDataSource.count
        }else {
            return homeDataSource.count
        }
    }
    
//    Flat florr building, gara, street, block, areaCity, postalCode
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDeliveryOption", for: indexPath) as! CellDeliveryOption
        if homeDataSource.isEmpty {
            cell.lblAddress.text = "\(branchDataSource[indexPath.row].branchAddress ?? ""), \(branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFirstName.text = branchDataSource[indexPath.row].branchName
//            cell.lblLocation.text = getAddressFromLatLon(pdblLatitude: branchDataSource[indexPath.row].latitude ?? "", withLongitude: branchDataSource[indexPath.row].longitude ?? "")
        }else {
            cell.lblFirstName.text = homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "\(homeDataSource[indexPath.row].flat ?? ""), \(homeDataSource[indexPath.row].floor ?? ""), \(homeDataSource[indexPath.row].building ?? ""), \(homeDataSource[indexPath.row].gada ?? ""), \(homeDataSource[indexPath.row].street ?? ""), \(homeDataSource[indexPath.row].block ?? ""), \(homeDataSource[indexPath.row].areaCity ?? ""), \(homeDataSource[indexPath.row].postalCode ?? "")"
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 120)
    }
    
}
