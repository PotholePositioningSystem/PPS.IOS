//
//  UIViewControllerExtension.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit

enum FIELDTYPE
{
    case uiTextField
    case uiTextView
}


extension UIViewController{
    
    struct keyboard {
        static var keyboardVisible:Bool = false
        static var previousHeight:CGFloat = -1
    }
    
    struct slide {
        static var slidedUp:Bool = false
    }
    
    var slidedUp:Bool{
        get
        {
            return slide.slidedUp
        }
        set
        {
            slide.slidedUp = newValue
        }
    }
    
    var keyboardVisible:Bool{
        get
        {
            return keyboard.keyboardVisible
        }
        set
        {
            keyboard.keyboardVisible = newValue
        }
    }
    
    var previousHeight:CGFloat{
        get
        {
            return keyboard.previousHeight
        }
        set
        {
            keyboard.previousHeight = newValue
        }
    }
    
    
    
    func statusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
        
    }
    
    
    //Done button default action
    @objc func buttonAction(_ button:UIButton)
    {
        self.view.endEditing(true)
    }
    
    
    
    //add Done button on keyboard
    func addDoneButtonKeyboard(_ textView:AnyObject, option: FIELDTYPE = FIELDTYPE.uiTextField)
    {
        let button = UIButton(type: .custom)
        let window = UIApplication.shared.keyWindow
        
        button.setTitle("Done", for: UIControlState())
        
        button.setTitleColor( UIColor.blue, for: UIControlState())
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //main view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (window?.bounds.width)!, height: 40))
        
        //the line
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: (window?.bounds.width)!, height: 0.5))
        view2.backgroundColor = UIColor(hex: "#999999")
        
        button.frame = CGRect(x: (window?.bounds.width)!-80 , y: 0, width: 100, height: 40)
        button.setTitleColor(UIColor(hex: "#161920"), for: .normal)
        
        
        view.backgroundColor = UIColor(hex: "#f2f2f2")
        view.addSubview(button)
        view.addSubview(view2)
        if(option == FIELDTYPE.uiTextField)
        {
            (textView as! UITextField).inputAccessoryView = view
        }
        else if option == FIELDTYPE.uiTextView
        {
            (textView as! UITextView).inputAccessoryView = view
        }
    }
    
    //slide view down with keyboard
    @discardableResult func slideDownViewWithKeyboard(_ notification:Notification, offset:CGFloat = 0)->CGFloat
    {
        return moveViewUpOrDownKeyboard(1,notification: notification, offset: offset)
    }
    
    //slide view up with keyboard
    func slideUpViewWithKeyboard(_ notification:Notification, offset:CGFloat = 0)->CGFloat
    {
        return moveViewUpOrDownKeyboard(-1,notification: notification, offset: offset)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    //function that actually move views
    private func moveViewUpOrDownKeyboard(_ direction:CGFloat, notification:Notification,offset:CGFloat )->CGFloat
    {
        let info: NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardSizeStart = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight: CGFloat = (keyboardSize.height + offset)
        
        if(keyboard.keyboardVisible && direction == -1)
        {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                self.view.frame = CGRect(x: 0, y: (self.view.frame.origin.y + (keyboardSizeStart.height-keyboardSize.height)), width: self.view.bounds.width, height: self.view.bounds.height)
            }, completion: nil)
        }
        else
        {
            
            if(slide.slidedUp && direction > 0 || !slide.slidedUp && direction < 0)
            {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                    self.view.frame = CGRect(x: 0, y: (self.view.frame.origin.y + direction*keyboardHeight), width: self.view.bounds.width, height: self.view.bounds.height)
                }, completion: nil)
            }
            
            if(direction < 0)
            {
                slide.slidedUp = true
            }
            else
            {
                slide.slidedUp = false
            }
        }
        keyboard.previousHeight = keyboardHeight
        return keyboardHeight
    }
    
    @objc func keyboardVisible(_ notification: Notification) {
        keyboard.keyboardVisible = true
    }
    
    @objc func keyboardHidden(_ notification: Notification) {
        keyboard.keyboardVisible = false
    }
    
    
    
    //listen for keyboard up
    func  addObserverKeyboardVisibilty(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardVisible(_:)), name:  NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func removeObserverKeyboardVisibilty(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
}
