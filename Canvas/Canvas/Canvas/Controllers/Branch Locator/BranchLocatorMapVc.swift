//
//  BranchLocatorMapVc.swift
//  Canvas
//
//  Created by urmila reddy on 04/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import MapKit

class BranchLocatorMapVc: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapVieww: GMSMapView!
    @IBOutlet weak var directionBtnOtlt: CustomButton!
    @IBOutlet weak var mapBtnOtlt: CustomButton!
    
    var branchNames = [String]()
    var branchAdress = [String]()
    var latitudeValues = [String]()
    var longitudeValues = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        directionBtnOtlt.isHidden = true
        mapBtnOtlt.isHidden = true
        
        mapVieww.delegate = self
          openGoogleMaps()
       // downloadAccountConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Mark: For showing maps and markers
    func openGoogleMaps() {
        /* let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
         let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
         self.view.addSubview(mapView)*/
        
     //   downloadAccountConfig()
        
        let lat  = Double(Global.shared.lat)
        let long  = Double(Global.shared.long)
        
        mapVieww.camera = GMSCameraPosition.camera(withLatitude: lat ?? 0.0, longitude: long ?? 0.0, zoom: 10.0)
        //   self.mapVieww = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: long ?? 0.0)
        marker.title =  Global.shared.branchNameLocator 
        marker.snippet = Global.shared.branchAdresLocator
        marker.map = mapVieww
    }
    
    func downloadAccountConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.branchLocatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                for dataobj in (resonseTal!["branchesList"] as? [Any])! {
                    
                    print(dataobj)
                    
                    
                    
                    if let dataDict = dataobj as? NSDictionary {
                        print(dataDict)
                        
                        
                        self.branchNames.append(dataDict["branchName"] as? String ?? "")
                        
                        self.branchAdress.append(dataDict["branchAddress"] as? String ?? "")
                        
                        self.latitudeValues.append(dataDict["latitude"] as? String ?? "0.0")
                        
                        self.longitudeValues.append(dataDict["longitude"] as? String ?? "0.0")
                        
                        
                    }
                }
                
                self.openGoogleMapsBranches()
                
            }
                
                
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    func openGoogleMapsBranches() {
        for i in 0..<branchNames.count {
            let latitudeValue = Double(latitudeValues[i])
            let longitudeValue = Double(longitudeValues[i])
            
            
            
            mapVieww.camera = GMSCameraPosition.camera(withLatitude: 29.321077, longitude: 48.023456, zoom: 12.0)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitudeValue ?? 0.0, longitude: longitudeValue ?? 0.0)
            marker.title = branchNames[i]
            marker.snippet = branchAdress[i]
            marker.map = mapVieww
        }
        
    }
    
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    
    
    
  /*   func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {

         if marker.title != nil {

             let mapViewHeight = mapView.frame.size.height
             let mapViewWidth = mapView.frame.size.width


             let container = UIView()
            //mapViewHeight - 63
             container.frame = CGRect(x: mapViewWidth - 100, y: mapViewHeight - 4, width: 65, height: 35)
             container.backgroundColor = UIColor.white
             self.view.addSubview(container)
            
             let googleMapsButton = CustomButton()
             googleMapsButton.setTitle("", for: .normal)
             googleMapsButton.setImage(UIImage(named: "googleMaps"), for: .normal)
             googleMapsButton.setTitleColor(UIColor.blue, for: .normal)
             googleMapsButton.frame = CGRect(x: mapViewWidth - 80, y: mapViewHeight - 11, width: 50, height: 50)
             googleMapsButton.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
             googleMapsButton.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
             googleMapsButton.setTitle("", for: .normal)
             googleMapsButton.tag = 0

             let directionsButton = CustomButton()

             directionsButton.setTitle("", for: .normal)
             directionsButton.setImage(UIImage(named: "GetDirections"), for: .normal)
             directionsButton.setTitleColor(UIColor.blue, for: .normal)
             directionsButton.frame = CGRect(x: mapViewWidth - 110, y: mapViewHeight - 11, width: 50, height: 50)
             directionsButton.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
             directionsButton.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
             directionsButton.setTitle("", for: .normal)
             directionsButton.tag = 1
             self.view.addSubview(googleMapsButton)
             self.view.addSubview(directionsButton)
         }
         return true
     }*/
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        mapVieww.clear()
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title =  Global.shared.branchNameLocator
        marker.snippet = Global.shared.branchAdresLocator
        marker.map = mapVieww
        
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {

        if marker.title != nil {

            directionBtnOtlt.isHidden = false
            mapBtnOtlt.isHidden = false
            mapView.selectedMarker = marker
           // marker.map = mapVieww
            
          //  let mapViewHeight = mapView.frame.size.height
          //  let mapViewWidth = mapView.frame.size.width


        /*    let container = UIView()
           //mapViewHeight - 63
            container.frame = CGRect(x: mapViewWidth - 100, y: mapViewHeight - 4, width: 65, height: 35)
            container.backgroundColor = UIColor.white
            self.view.addSubview(container)*/
           
         /*   let googleMapsButton = CustomButton()
            googleMapsButton.setTitle("", for: .normal)
            googleMapsButton.setImage(UIImage(named: "googleMaps"), for: .normal)
            googleMapsButton.setTitleColor(UIColor.blue, for: .normal)
            googleMapsButton.frame = CGRect(x: mapViewWidth - 80, y: mapViewHeight - 11, width: 50, height: 50)*/
            directionBtnOtlt.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
            directionBtnOtlt.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
           // googleMapsButton.setTitle("", for: .normal)
            directionBtnOtlt.tag = 0

        /*    let directionsButton = CustomButton()

            directionsButton.setTitle("", for: .normal)
            directionsButton.setImage(UIImage(named: "GetDirections"), for: .normal)
            directionsButton.setTitleColor(UIColor.blue, for: .normal)
            directionsButton.frame = CGRect(x: mapViewWidth - 110, y: mapViewHeight - 11, width: 50, height: 50)*/
            mapBtnOtlt.addTarget(self, action: #selector(markerClick(sender:)), for: .touchUpInside)
            mapBtnOtlt.gps = String(marker.position.latitude) + "," + String(marker.position.longitude)
          //  directionsButton.setTitle("", for: .normal)
            mapBtnOtlt.tag = 1
           // self.view.addSubview(googleMapsButton)
          //  self.view.addSubview(directionsButton)
        }
        return true
    }

     @objc func markerClick(sender: CustomButton) {
         let fullGPS = sender.gps
         let fullGPSArr = fullGPS.split(separator: ",")

         let lat1 : String = String(fullGPSArr[0])
         let lng1 : String = String(fullGPSArr[1])


        let latitude = Double(lat1)!
        let longitude = Double(lng1)!

         if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {

             if (sender.tag == 1) {
                 let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
                 UIApplication.shared.open(url!, options: [:], completionHandler: nil)
             } else if (sender.tag == 0) {
                 let url = URL(string:"comgooglemaps://?center=\(latitude),\(longitude)&zoom=14&views=traffic&q=\(latitude),\(longitude)")
                 UIApplication.shared.open(url!, options: [:], completionHandler: nil)
             }

         } else {
             let regionDistance:CLLocationDistance = 10000
             let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
             let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
             var options = NSObject()
             if (sender.tag == 1) {
                 options = [
                     MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                     MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
                     MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
                     ] as NSObject
             } else if (sender.tag == 0) {
                 options = [
                     MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                     MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                     ] as NSObject
             }

             let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
             let mapItem = MKMapItem(placemark: placemark)
             mapItem.name = sender.title(for: .normal)
             mapItem.openInMaps(launchOptions: options as? [String : AnyObject])
         }
     }

     
 }
 class CustomButton: UIButton {
     var gps = ""
     override func awakeFromNib() {
         super.awakeFromNib()

         //TODO: Code for our button
     }
 }


