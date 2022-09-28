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
}
class CellSectionTwo: UITableViewCell {
    
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var pickerViewDate: UIPickerView!
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

    let DatePickerView = UIPickerView()
    let toolbar = UIToolbar()
    
    
    let dateValue = ["09/26/02022","09/27/02022","09/28/02022","09/29/02022"]
    let timeValue = ["10 AM - 12 PM","12 PM - 02 PM","02 PM - 04 PM","04 PM - 06 PM"]
    
    //MARK: - LIFECYCLE METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TFSelectDate.text = dateValue[0]
        TFSelectDate.inputView = UIPickerView()
        
        DatePickerView.delegate = self
        DatePickerView.dataSource = self
        
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
        
        collectionViewDeliveryOption.dataSource = self
        collectionViewDeliveryOption.delegate = self
        
    }
        // Configure the view for the selected state

    
    
    //MARK: - ACTIONS
    
//    btnAdd.addTarget(self, action: #selector(onTapAdd(sender:)), for: .touchUpInside)

    
    @IBAction func onTapAdd(_ sender: UIButton) {
        self.Pushdelegate?.didPressCell(sender: sender.tag)
        let buttonTag = sender.tag
        
    }
   
    @IBAction func onTapMix(_ sender: Any) {
        
        
    }
    
    
    @IBAction func onTapHighValue(_ sender: Any) {
        
        
        
    }
    
    
    //MARK: - FUNCTIONS
    
}
//MARK: - EXTENSIONS
extension CellSectionTwo : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDeliveryOption", for: indexPath) as! CellDeliveryOption
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let widthh = collectionView.bounds.width / 2.7
        
        return CGSize(width: widthh, height: 150)
    }
    
}
    //MARK: - EXTENSION FOR PICKERVIEW
extension CellSectionTwo : UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dateValue.count
    }
    
    
   
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateValue[row]

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TFSelectDate.text = dateValue[row]
        self.endEditing(true)
        pickerView.isHidden = true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField == TFSelectDate
        pickerViewDate.isHidden = false
    }

}
