//
//  DriverViewController.swift
//  PPS
//
//  Created by Jovi on 5/1/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit
import GoogleMaps
import LMGaugeView

class DriverViewController: BaseViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var speedOMeter: UIView!
    var gaugeView:LMGaugeView?

    
    override func viewDidLayoutSubviews() {
        setupGauge()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
       
        
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


extension DriverViewController {

    func setupGauge()
    {
        gaugeView = LMGaugeView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        gaugeView?.valueTextColor = UIColor.clear
        if let _ = gaugeView
        {
            speedOMeter.addSubview(gaugeView!)
        }
    }
    
    func update(speed:CGFloat)
    {
        gaugeView?.valueTextColor = UIColor.black
        gaugeView?.value = speed
    }


    func locationServiceAuthorized()
    {
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }

    
    func locationDidUpdate( manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        update(speed: CGFloat((locations.first?.speed)!))
        mapView.camera = GMSCameraPosition(target: (locations.first?.coordinate)!, zoom: 15, bearing: 0, viewingAngle: 0)
    }
    
    
}
