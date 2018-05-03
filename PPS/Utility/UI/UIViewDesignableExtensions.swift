//
//  UIViewDesignableExtensions.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//


import UIKit

@IBDesignable extension UIView {
    @IBInspectable dynamic var borderColor:UIColor? {
        set {
            self.layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable dynamic var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable dynamic var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    
}

class AllInchesGone:NSLayoutConstraint {
    
    override func awakeFromNib() {
        
        self.constant = 0
        
    }
    
}

class ThreeInchesGone:NSLayoutConstraint {
    
    override func awakeFromNib() {
        if(UIScreen.main.bounds.height == 480)
        {
            self.constant = 0
        }
    }
    
}

class FourInchesGoneView:NSLayoutConstraint {
    
    override func awakeFromNib() {
        if(UIScreen.main.bounds.height == 568)
        {
            self.constant = 0
        }
    }
    
}


class ThreeInchesGoneView:UIView {
    
    override func awakeFromNib() {
        if(UIScreen.main.bounds.height == 480)
        {
            self.isHidden = true
        }
    }
    
}


class SizesUILabel: UILabel {
    
    var size:CGFloat = 0
    
    override func awakeFromNib() {
        size = (self.font?.pointSize)!
        
    }
    
    @IBInspectable
    var 📱3¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 480 {
                size = 📱3¨5_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨0_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 568 {
                size = 📱4¨0_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨7_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 667 {
                size = 📱4¨7_insh
            }
        }
    }
    
    @IBInspectable
    var 📱5¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 736 {
                size = 📱5¨5_insh
            }
        }
    }
    
    @IBInspectable
    var 📱5¨85_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 812 {
                size = 📱5¨85_insh
            }
        }
    }
    
    @IBInspectable
    var 📱iPhoneX: CGFloat = 0 {
        didSet {
            if UIScreen.main.nativeBounds.height == 2436 {
                size = 📱iPhoneX
            }
        }
    }
    
    @IBInspectable
    var 📱iPhone8: CGFloat = 0 {
        didSet {
            if UIScreen.main.nativeBounds.height == 1334 {
                size = 📱iPhone8
            }
        }
    }
}


@IBDesignable
class LayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable
    var 📱3¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 480 {
                constant = 📱3¨5_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨0_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 568 {
                constant = 📱4¨0_insh
            }
        }
    }
    
    @IBInspectable
    var 📱4¨7_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 667 {
                constant = 📱4¨7_insh
            }
        }
    }
    
    @IBInspectable
    var 📱5¨5_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 736 {
                constant = 📱5¨5_insh
            }
        }
    }
    
    @IBInspectable
    var 📱5¨85_insh: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY == 812 {
                constant = 📱5¨85_insh
            }
        }
    }
    
    @IBInspectable
    var 📱iPhoneX: CGFloat = 0 {
        didSet {
            if UIScreen.main.nativeBounds.height == 2436 {
                constant = 📱iPhoneX
            }
        }
    }
    
    @IBInspectable
    var 📱iPhone8: CGFloat = 0 {
        didSet {
            if UIScreen.main.nativeBounds.height == 1334 {
                constant = 📱iPhone8
            }
        }
    }
}



@IBDesignable class MyButton:UIButton {
    @IBInspectable dynamic var imageFit:Bool {
        set {
            self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        }
        get {
            return true
        }
    }
    
}

@IBDesignable class MyUILabel:UIView {
    
    
}

@IBDesignable class MyUIView:UIView {
    
    
}

@IBDesignable class MyImageView:UIImageView {
    
    
}



@IBDesignable class TIFAttributedLabel: UILabel {
    
    @IBInspectable dynamic var fontSize: CGFloat = 13.0
    
    @IBInspectable dynamic var fontFamily: String {
        set {
            self.font = UIFont(name: newValue, size: (self.font?.pointSize)!)
        }
        get {
            return self.font.fontName
        }
    }
}



@IBDesignable class MyTextField:UITextField {
    
    func setFontSize(size:CGFloat)
    {
        self.font = UIFont(name: "ProximaNova-Regular", size: size)
    }
    
    
    func addPadding(left:CGFloat = 15, right:CGFloat = 0 )
    {
        var paddingView:UIView
        if(left > 0)
        {
            paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = UITextFieldViewMode.always
        }
        
        if(right > 0)
        {
            paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = UITextFieldViewMode.always
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    
    
    
}
extension UIButton {
    func setTitleWithOutAnimation(title: String?) {
        UIView.setAnimationsEnabled(false)
        self.setTitle(title, for: .normal)
        
        
        layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
}
