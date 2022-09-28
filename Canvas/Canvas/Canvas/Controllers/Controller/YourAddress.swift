//
//  YourAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit

class YourAddress: UIViewController {

    @IBOutlet weak var tableViewYourAddress: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewYourAddress.delegate = self
        tableViewYourAddress.dataSource = self
        
        
        tableViewYourAddress.register(UINib(nibName: "CellYourAddress", bundle: nil), forCellReuseIdentifier: "CellYourAddress")
        tableViewYourAddress.register(UINib(nibName: "CellAddNewAddress", bundle: nil), forCellReuseIdentifier: "CellAddNewAddress")


        // Do any additional setup after loading the view.
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
        if section == 1 {
            return 1
        }
        else{
            return 10
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellAddNewAddress") as! CellAddNewAddress
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellYourAddress") as! CellYourAddress
            return cell
        }
       
    }
    
    
}
