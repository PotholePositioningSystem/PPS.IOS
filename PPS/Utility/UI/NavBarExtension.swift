//
//  NavBarUI.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationBar {
    func solidColor(_ hexDecimal:String,alphaO:CGFloat = 1) -> Void
    {
        let colorImage = imageFromColor(UIColor(hex: hexDecimal,alpha: alphaO), frame: CGRect(x: 0, y: 0, width: 380, height: 64))
        self.setBackgroundImage(colorImage, for: .default)
        self.shadowImage = UIImage()
    }
    
    
    
    
    private func imageFromColor(_ color: UIColor, frame: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        color.setFill()
        UIRectFill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func setTitleColor(_ hexDecimal:String)->Void
    {
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hex: hexDecimal)]
    }
    
}

extension UIViewController
{
    func clearNavBar()
    {
        if(self.navigationController?.navigationBar != nil)
        {
            let navBarAppearance:UINavigationBar!  = self.navigationController?.navigationBar
            navBarAppearance.solidColor("#FB582F",alphaO: 0)
            navBarAppearance.barStyle = UIBarStyle.blackOpaque
            navBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        }
    }
    
    func mainNavBar()
    {
        if(self.navigationController?.navigationBar != nil)
        {
            let navBarAppearance:UINavigationBar!  = self.navigationController?.navigationBar
            navBarAppearance.solidColor("#FB582F",alphaO: 1)
            navBarAppearance.isTranslucent = false
            navBarAppearance.barTintColor = UIColor.white
            navBarAppearance.tintColor = UIColor.white
            navBarAppearance.barStyle = UIBarStyle.blackOpaque
            navBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        }
    }

    func onBackPress()
    {
        print("back")
    }
    
    //varible close modal
    struct  close{
        static var completed: (()->Void)?
        static var dismiss:Bool = false
        static var animation:Bool = true
    }
    
    var animation:Bool{
        get
        {
            return close.animation
        }
        set
        {
            close.animation = newValue
        }
    }
    
    
    var preventDismiss:Bool{
        get
        {
            return close.dismiss
        }
        set
        {
            close.dismiss = newValue
        }
    }
    
    //varible close modal handle
    var closeModalCompleted:(()->Void)?{
        get
        {
            if(close.completed != nil)
            {
                return close.completed
            }
            else
            {
                return nil
            }
        }
        set
        {
            close.completed = newValue
        }
    }

    //close modal
    func closeModal()
    {
        closeModalCompleted?()
        dismiss(animated: animation, completion: nil)
        animation = true
        view.endEditing(true)
    }
    
    func set(title:String)
    {
        if(self.navigationController?.navigationBar != nil)
        {
            self.navigationItem.title = title
        }
    }
    
    
    
    
}
