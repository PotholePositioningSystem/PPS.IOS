//
//  PotholesViewController.swift
//  PPS
//
//  Created by Jovi on 5/1/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit

class PotholesViewController: BaseViewController {
    @IBOutlet weak var circleButton: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShadow()
        // Do any additional setup after loading the view.
    }

    func setShadow()
    {
        circleButton.layer.shadowColor = UIColor.black.cgColor
        circleButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        circleButton.layer.masksToBounds = false
        circleButton.layer.shadowRadius = 1.5
        circleButton.layer.shadowOpacity = 0.3
        circleButton.layer.cornerRadius = circleButton.frame.width / 2
    }
    
    @IBAction func circleButtonAction(_ sender: Any) {
        let authViewController = (UIApplication.shared.delegate as! AppDelegate).authUI?.authViewController()
        present(authViewController!, animated: true, completion: nil)
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
