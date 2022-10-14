//
//  AddNewAddressMap.swift
//  Canvas
//
//  Created by Akshay_mac on 14/10/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import MapKit

protocol MapDelgate {
    func getLatLong(lat : String, long : String)
}
class AddNewAddressMap: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
//    @IBOutlet weak var backBtn: UIButton!
    var locationManager = CLLocationManager()
    var delegate : MapDelgate?
    var latitude, longitude : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        initializeTheLocationManager()
        mapView.isMyLocationEnabled = true
        
    }
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 30)
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude:locationManager.location?.coordinate.longitude ?? 0.0)
        marker.title =  Global.shared.branchNameLocator
        marker.snippet = Global.shared.branchAdresLocator
        marker.map = mapView
    }
    
    
    
    @IBAction func onClickedChangeLang(_ sender: UIButton) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func onClickedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func onClickedSetLocation(_ sender: UIButton) {
        delegate?.getLatLong(lat: latitude ?? "", long: longitude ?? "")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title =  Global.shared.branchNameLocator
        marker.snippet = Global.shared.branchAdresLocator
        marker.map = mapView
        latitude = "\(lat)"
        longitude = "\(long)"
        
    }

}
