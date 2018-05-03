//
//  DriverViewController.swift
//  PPS
//
//  Created by Jovi on 5/1/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit
import GoogleMaps

class DriverViewController: BaseViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    private let locationManager = CLLocationManager()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        locationInit()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DriverViewController: CLLocationManagerDelegate {

    func  locationInit()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
    
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
    
        locationManager.stopUpdatingLocation()
    }
}
