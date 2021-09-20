//
//  ContactVc.swift
//  Canvas
//
//  Created by urmila reddy on 25/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

protocol UIPopoverControllerDelegateM{
    //func valuesChanged(firstName:String, mobileNumber:String)
    func valuesChanged(firstName:String,middleName:String,lastName:String, mobileNumber:String)
}
class ContactVc: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var delegate: UIPopoverControllerDelegateM! = nil
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var contactTbleView: UITableView!
    
    let contactStore = CNContactStore()
    var contacts = [CNContact]()
    
    var contactNames = [Any]()
    var contactPhnNumbers = [Any]()
    
    //custom delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
       // contactTbleView.rowHeight = 58
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        
        toGetContactsList()
    }
    
    func toGetContactsList() {
//        let contactPicker = CNContactPickerViewController()
//        contactPicker.delegate = self
//        // 2
//        contactPicker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
//        present(contactPicker, animated: true)
        let contacVC = CNContactPickerViewController()
        contacVC.delegate = self
        self.present(contacVC, animated: true, completion: nil)
//        let keys = [
//            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
//            CNContactPhoneNumbersKey,
//            CNContactEmailAddressesKey
//            ] as [Any]
//        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
//        do {
//            try contactStore.enumerateContacts(with: request){
//                (contact, stop) in
//                // Array containing all unified contacts from everywhere
//                self.contacts.append(contact)
//                for phoneNumber in contact.phoneNumbers {
//                    if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
//                        let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
//                        print("\(contact.givenName) \(contact.familyName) tel:\(localizedLabel) -- \(number.stringValue), email: \(contact.emailAddresses)")
//
//                        self.contactNames.append(contact.givenName)
//                        self.contactPhnNumbers.append(number.stringValue)
//                    }
//                }
//            }
//            print(contacts)
//            print(contactNames)
//            print(contactPhnNumbers)
//
//            contactTbleView.reloadData()
//
//
//        } catch {
//            print("unable to fetch contacts")
//        }
    }
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    @IBAction func cancelBtnActn(_ sender: Any) {
        removeAnimate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contactPhnNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTbleView.dequeueReusableCell(withIdentifier: "BankContactCell")! as! BankContactCell
        cell.nameField.text = self.contactNames[indexPath.row] as? String
        cell.phneField.text = self.contactPhnNumbers[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BeneficiaryDetails.shared.contactFirstName = self.contactNames[indexPath.row] as! String
        BeneficiaryDetails.shared.contactMobileNumber = self.contactPhnNumbers[indexPath.row] as! String
       // self.delegate.valuesChanged(firstName: BeneficiaryDetails.shared.contactFirstName, mobileNumber: BeneficiaryDetails.shared.contactMobileNumber)
        removeAnimate()
        
        
    }
}
//MARK: - CNContactPickerDelegate
extension ContactVc: CNContactPickerDelegate {
//  func contactPicker(_ picker: CNContactPickerViewController,
//                     didSelect contacts: [CNContact]) {
////    let newFriends = contacts.compactMap { Friend(contact: $0) }
////    for friend in newFriends {
////      if !friendsList.contains(friend) {
////        friendsList.append(friend)
////      }
////    }
////    tableView.reloadData()
//  }
    //Works, but only allows me to select one at a time
//       func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//           print(contact.phoneNumbers)
//           print("WYASDFY")
//       }
    // MARK: Delegate method CNContectPickerDelegate
     func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let formatter = CNContactFormatter()
        formatter.style = .fullName
        
        print(contact.phoneNumbers,contact.givenName + " " + contact.middleName+" " + contact.familyName)
         let numbers = contact.phoneNumbers.first
        var name = String()
        if contact.middleName != ""
        {
          name = contact.givenName + " " + contact.middleName+" " + contact.familyName
        }
        
        else if contact.familyName != ""
        {
            name = contact.givenName + " " + contact.middleName+" " + contact.familyName
        }
        else{
            name = contact.givenName
        }
        
        
        let phoneNumber = (numbers?.value)?.stringValue ?? ""
         print((numbers?.value)?.stringValue ?? "")
        
        BeneficiaryDetails.shared.contactFirstName = contact.givenName
        BeneficiaryDetails.shared.contactLastName = contact.familyName
        BeneficiaryDetails.shared.contactMiddleName = contact.middleName
        BeneficiaryDetails.shared.contactMobileNumber = phoneNumber
        self.delegate.valuesChanged(firstName: BeneficiaryDetails.shared.contactFirstName,middleName:BeneficiaryDetails.shared.contactMiddleName,lastName:BeneficiaryDetails.shared.contactLastName, mobileNumber: BeneficiaryDetails.shared.contactMobileNumber)
        removeAnimate()
         
        // self.lblNumber.text = " Contact No. \((numbers?.value)?.stringValue ?? "")"
           
     }

     func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
         self.dismiss(animated: true, completion: nil)
         removeAnimate()
     }
}
