//
//  YourAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit

class YourAddress: UIViewController {

    @IBOutlet weak var tableViewYourAddress: UITableView!
    
    var homeDataSource : [CMBookingHomeAddress] = {
      let data = [CMBookingHomeAddress]()
        return data
    }()
    
    var branchDataSource : [CMBookingBranchAddress] = {
        let data = [CMBookingBranchAddress]()
          return data
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewYourAddress.delegate = self
        tableViewYourAddress.dataSource = self
        
        
        tableViewYourAddress.register(UINib(nibName: "CellYourAddress", bundle: nil), forCellReuseIdentifier: "CellYourAddress")
        tableViewYourAddress.register(UINib(nibName: "CellAddNewAddress", bundle: nil), forCellReuseIdentifier: "CellAddNewAddress")

        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension YourAddress : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeDataSource.isEmpty {
            return branchDataSource.count
        }else{
            return homeDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellYourAddress") as! CellYourAddress
        if homeDataSource.isEmpty {
            cell.lblAddress.text = "\(branchDataSource[indexPath.row].branchAddress ?? ""), \(branchDataSource[indexPath.row].branchCode ?? "")"
            cell.lblFullName.text = branchDataSource[indexPath.row].branchName
        }else{
            cell.lblFullName.text = homeDataSource[indexPath.row].firstName ?? ""
            cell.lblAddress.text = "\(homeDataSource[indexPath.row].flat ?? ""), \(homeDataSource[indexPath.row].floor ?? ""), \(homeDataSource[indexPath.row].building ?? ""), \(homeDataSource[indexPath.row].gada ?? ""), \(homeDataSource[indexPath.row].street ?? ""), \(homeDataSource[indexPath.row].block ?? ""), \(homeDataSource[indexPath.row].areaCity ?? ""), \(homeDataSource[indexPath.row].postalCode ?? "")"
        }
        print("Home Address ::: ::: ::: ::\(homeDataSource)")
        print("Home Address ::: ::: ::: ::\(branchDataSource)")
        return cell
       
    }
    
    
}
