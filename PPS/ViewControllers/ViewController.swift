//
//  ViewController.swift
//  PPS
//
//  Created by Jovi on 4/30/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: BaseViewController,UIScrollViewDelegate,UITabBarDelegate {

    @IBOutlet var tabs: [UITabBarItem]!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let locationManager = CLLocationManager()
    var screenWidth: CGFloat = 0
    
    var view1:PotholesViewController?
    var view2:DriverViewController?
    var view3:ProfileViewController?
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 1)
        {
            Potholes()
        }
        else if(item.tag == 2)
        {
            Driver()
        }
        else if(item.tag == 3)
        {
            Profile()
        }
        
    }
    
   
    override func viewDidLayoutSubviews() {
        tabBar.invalidateIntrinsicContentSize()
        resizeView()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainNavBar()
        scrollView.delegate = self
        tabBar.delegate = self
         locationInit()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:CLLocationManagerDelegate
{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        Log.print(scrollView.contentOffset.x)
        
    
        let page:Int = Int(round((scrollView.contentOffset.x/self.view.frame.width)))
        Log.print("\(page)")
        for  button in tabs
        {
           if(page+1 == button.tag)
           {
             tabBar.selectedItem = button
           }
        }
        // Bold font on page selection
//        self.tabs[page].titleLabel?.font = UIFont(name: "ProximaNova-Bold", size: 20)
        scrollView.contentOffset.y = 0.0
    }

    // readjust view to scale properly
    func resizeView()
    {
    
        if(screenWidth < 1)
        {
            views()
            let window = UIApplication.shared.keyWindow
            let width:CGFloat = (window?.bounds.width)!
            screenWidth = width
            scrollView.layoutIfNeeded()
            
            let screenFrame: CGRect = CGRect(x:0,y:0, width: screenWidth, height:scrollView.frame.height)
            
            var V1Frame: CGRect = screenFrame
            V1Frame.origin.x = 0
            view1?.view.frame = V1Frame
            
            var V2Frame: CGRect = screenFrame
            V2Frame.origin.x = screenWidth
            view2?.view.frame = V2Frame
            
            var V3Frame: CGRect = screenFrame
            V3Frame.origin.x = screenWidth*2
            view3?.view.frame = V3Frame
        
            
            self.scrollView.contentSize = CGSize(width: screenWidth * 3,height: self.scrollView.frame.height)
            scrollView.contentOffset.x = screenWidth
            Log.print(screenWidth)
            Log.print("this is the screen width normally\( self.scrollView.contentSize)")
            Log.print("this is screen dimenisions\(self.view.frame)")
            

        }
    }
    
    //add views to scrollview
    func views()
    {
        
        view1 = PotholesViewController(nibName: "PotholesViewController", bundle: nil)
        self.addChildViewController(view1!)
        self.scrollView.addSubview((view1?.view)!)
        view1?.didMove(toParentViewController: self)
        
        view2 = DriverViewController(nibName: "DriverViewController", bundle: nil)
        self.addChildViewController(view2!)
        self.scrollView.addSubview((view2?.view)!)
        view2?.didMove(toParentViewController: self)
        
        view3 = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        self.addChildViewController(view3!)
        self.scrollView.addSubview((view3?.view)!)
        view3?.didMove(toParentViewController: self)
        
    }
    
     func Potholes() {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.scrollView.contentOffset.x = 0
        }, completion: nil)
    }
    
    
    
     func Driver() {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.scrollView.contentOffset.x = self.screenWidth
        }, completion: nil)
    }
    
     func Profile() {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.scrollView.contentOffset.x = self.screenWidth*2
        }, completion: nil)
        
        
    }
    
    //============================================
    //               Location
    //============================================
    func  locationInit()
    {
        locationManager.delegate = self
        requestLocationService()
    }
    
    func requestLocationService()
    {
        locationManager.requestWhenInUseAuthorization()
        //TODO: add custom dialog when user refused to authrize and try back again
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        view2?.locationServiceAuthorized()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.first else {
            return
        }
        
        DispatchQueue.main.async {[weak self] () in
            if(self != nil)
            {
                self?.view2?.locationDidUpdate(manager: manager, didUpdateLocations: locations)
            }
        }
        

        //        locationManager.stopUpdatingLocation()
    }
    
}
