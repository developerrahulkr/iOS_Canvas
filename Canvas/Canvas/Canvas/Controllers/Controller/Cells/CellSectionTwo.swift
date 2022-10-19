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
//    func getHomeAddress()
//    func getBranchAddress()
    func getSelectDate() -> Void
    func getTimeSlot() -> Void
    func getPurposeName() -> Void
    func onclicksubmit() -> Void
    func onclickcancel() -> Void
    func onClickedMixedNoted(value : String) -> Void
    func onClickedHighValue(value : String) -> Void
}
class CellSectionTwo: UITableViewCell, delegatecallbackfromFxbooking
{
    //MARK: - OUTLETS
    
    @IBOutlet weak var lblChooseDeliveryOptions: UILabel!
    @IBOutlet weak var lblPurpose: UILabel!
    @IBOutlet weak var imgHighNote: UIImageView!
    @IBOutlet weak var imgMixNote: UIImageView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var TFSelectPurposeOf: UITextField!
//    Purpose Of Transfer*
    @IBOutlet weak var homeSegment: UISegmentedControl!
    @IBOutlet weak var collectionViewDeliveryOption: UICollectionView!
    @IBOutlet weak var TFSelectDate: UITextField!
    @IBOutlet weak var TFTimeSlot: UITextField!
    @IBOutlet weak var viewPurposeOf: UIView!
    @IBOutlet weak var TFDeliveryInst: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var BtnCancle: UIButton!
    @IBOutlet weak var lblnote: UILabel!
    @IBOutlet weak var lblDenominations: UILabel!
    @IBOutlet weak var lblHighValue: UILabel!
    @IBOutlet weak var lblMixedNotes: UILabel!
    
    var parentobj : FXBookingVC?
    //MARK: - VARIABLES
    
    var Pushdelegate:protocolPush?
    var intData : Int?
//    var homeDataSource : [CMBookingHomeAddress] = {
//      let data = [CMBookingHomeAddress]()
//        return data
//    }()
    
//    lazy var branchDataSource : [CMBookingBranchAddress] = {
//        let data = [CMBookingBranchAddress]()
//          return data
//    }()
    
    //MARK: - LIFECYCLE METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgMixNote.image = UIImage(named:"circleUnchecked")
        btnAdd.cornerRadius = 20
        
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
       // (self.superview as! FXBookingVC).fxdelegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.test()
        }
        lblnote.text = Global.shared.note
        

        
        
    }
     
    
    
    func test()
    {
        parentobj?.fxdelegate = self
    }
        // Configure the view for the selected state

    func reloadhomeaddress()
    {
        collectionViewDeliveryOption.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
//        print("Home Cell Data : ::::::::::      :::::::::::::    \(homeDataSource)", homeDataSource.count)
//        collectionViewDeliveryOption.reloadData()
        if homeSegment.selectedSegmentIndex == 0
        {
            FXbookingMaster.shared.getHomeData {  success, errorcode in
                self.collectionViewDeliveryOption.reloadData()
                
            }
        }
        else
        {
            FXbookingMaster.shared.getUserBranchDetails { success, errCode in
                if success {
                    print("Hit Successfully..............")
                    self.collectionViewDeliveryOption.reloadData()}
                }
        }
    }
    
    //MARK: - ACTIONS
    
//    btnAdd.addTarget(self, action: #selector(onTapAdd(sender:)), for: .touchUpInside)

    
    
    
    
    
    @IBAction func onTapCancle(_ sender: Any) {
        
        Pushdelegate?.onclickcancel()
    }
    
    
    
    @IBAction func onTapAdd(_ sender: UIButton) {
        self.Pushdelegate?.didPressCell(sender: sender.tag)
        let buttonTag = sender.tag
        
    }
   
    @IBAction func onTapMix(_ sender: UIButton)
    {
        if(imgMixNote.image == UIImage(named: "circleChecked") )
        {
            imgMixNote.image = UIImage(named: "circleUnchecked")
        }
        else
        {
            Pushdelegate?.onClickedMixedNoted(value: lblMixedNotes.text ?? "")
            imgMixNote.image = UIImage(named: "circleChecked")
            imgHighNote.image = UIImage(named: "circleUnchecked")
        }
        
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
    
    @IBAction func onClickedsubmitbtb(_ sender: UIButton)
    {
        self.Pushdelegate?.onclicksubmit()
    }
    
    
    
    @IBAction func onClickedSengment(_ sender: UISegmentedControl)
    {
//        FXbookingMaster.shared.selectedaddresstype = sender.selectedSegmentIndex
        FXbookingMaster.shared.deliveryType = sender.selectedSegmentIndex == 0 ? 2 : 1
        sender.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.colorFrom(hexString: "#FFFFFF")!], for: .selected)

        if sender.selectedSegmentIndex == 0
        {
            FXbookingMaster.shared.getHomeData {  success, errorcode in
                self.collectionViewDeliveryOption.reloadData()}
        }
        else
        {
            FXbookingMaster.shared.getUserBranchDetails { success, errCode in
                if success {
                    print("Hit Successfully..............")
                    self.collectionViewDeliveryOption.reloadData()}
                }
            }
//            FXbookingMaster.shared.getBranchData {  success, errorcode in
//                self.collectionViewDeliveryOption.reloadData()}
//        } 
    }
    
    
    @IBAction func onTapHighValue(_ sender: UIButton)
    {
        if(imgHighNote.image == UIImage(named: "circleChecked") )
        {
            imgHighNote.image = UIImage(named: "circleUnchecked")
        }
        else
        {
            Pushdelegate?.onClickedHighValue(value: lblHighValue.text ?? "")
            imgHighNote.image = UIImage(named: "circleChecked")
            imgMixNote.image = UIImage(named: "circleUnchecked")
        }
    }
    
    
    //MARK: - FUNCTIONS
    
}
//MARK: - EXTENSIONS
extension CellSectionTwo : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return  homeSegment.selectedSegmentIndex == 0 ? FXbookingMaster.shared.homeDataSource.count : FXbookingMaster.shared.branchDataSource.count
    }
    
//    Flat florr building, gara, street, block, areaCity, postalCode
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDeliveryOption", for: indexPath) as! CellDeliveryOption
        if homeSegment.selectedSegmentIndex == 0
        {
            if FXbookingMaster.shared.homeDataSource[indexPath.row].bIsDefault == true {
                cell.imgStar.isHidden = false
            }
            else{
                cell.imgStar.isHidden = true
                
            }
            cell.lblFirstName.text = FXbookingMaster.shared.homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "\(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].floor ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
            if FXbookingMaster.shared.selecytedhomeaddress == FXbookingMaster.shared.homeDataSource[indexPath.row].addressId{
                print("Select cell index : \(indexPath.row)")
                cell.viewCellDelivery.layer.borderWidth = 2
                cell.viewCellDelivery.layer.borderColor = #colorLiteral(red: 0.8272326589, green: 0, blue: 0.1346516907, alpha: 1)
            }else{
                cell.viewCellDelivery.layer.borderWidth = 1
                cell.viewCellDelivery.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
        else
        {
            cell.imgStar.isHidden = true

            cell.lblAddress.text = "\(FXbookingMaster.shared.branchDataSource[indexPath.row].branchAddress ?? ""), \(FXbookingMaster.shared.branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFirstName.text = FXbookingMaster.shared.branchDataSource[indexPath.row].branchName
            if FXbookingMaster.shared.selecedbranchaddress == FXbookingMaster.shared.branchDataSource[indexPath.row].id{
                print("Select cell index : \(indexPath.row)")
                cell.viewCellDelivery.layer.borderWidth = 2
                cell.viewCellDelivery.layer.borderColor = #colorLiteral(red: 0.8272326589, green: 0, blue: 0.1346516907, alpha: 1)
            }else{
                cell.viewCellDelivery.layer.borderWidth = 1
                cell.viewCellDelivery.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
            
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if homeSegment.selectedSegmentIndex == 0
        {
            FXbookingMaster.shared.selecytedhomeaddress = FXbookingMaster.shared.homeDataSource[indexPath.row].addressId
            FXbookingMaster.shared.selectedhomeaddress1name = "\(FXbookingMaster.shared.homeDataSource[indexPath.row].flat ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].floor ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].building ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].gada ?? ""))"
            FXbookingMaster.shared.selectedhomeaddress1name = "\(FXbookingMaster.shared.homeDataSource[indexPath.row].street ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].block ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].areaCity ?? ""), \(FXbookingMaster.shared.homeDataSource[indexPath.row].postalCode ?? "")"
        }
        else
        {
            FXbookingMaster.shared.selecedbranchaddress = FXbookingMaster.shared.branchDataSource[indexPath.row].id
            FXbookingMaster.shared.selectedbranchaddress1name = (FXbookingMaster.shared.branchDataSource[indexPath.row].branchAddress ?? "")
            FXbookingMaster.shared.selectedbranchaddress2name = (FXbookingMaster.shared.branchDataSource[indexPath.row].branchCode ?? "")
        }        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 120)
    }
    
}


