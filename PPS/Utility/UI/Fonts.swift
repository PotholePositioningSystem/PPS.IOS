//
//  Fonts.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit

@IBDesignable class Thin: UILabelLocalized {
    
    let typeface:String = "ProximaNova-Light"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(size != 0)
        {
            self.font = UIFont(name: typeface, size: (size))
        }
        else
        {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        
    }
    
}

@IBDesignable class Bold: UILabelLocalized {
    
    let typeface:String = "ProximaNova-Bold"
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(size != 0)
        {
            self.font = UIFont(name: typeface, size: (size))
        }
        else
        {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        
    }
}

@IBDesignable class Light: UILabelLocalized {
    
    let typeface:String = "ProximaNova-Light"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(size != 0)
        {
            self.font = UIFont(name: typeface, size: (size))
        }
        else
        {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        
    }
    
}

@IBDesignable class Regular: UILabelLocalized  {
    
    let typeface:String = "ProximaNova-Regular"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(size != 0)
        {
            self.font = UIFont(name: typeface, size: (size))
        }
        else
        {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        
    }
}

@IBDesignable class Medium: UILabelLocalized {
    
    let typeface:String = "ProximaNova-Semibold"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(size != 0)
        {
            self.font = UIFont(name: typeface, size: (size))
        }
        else
        {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        
    }
    
    
}


@IBDesignable class BoldButton: UIButtonLocalized {
    
    let typeface:String = "ProximaNova-Bold"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
        
    }
    
    
}

@IBDesignable class MediumButton: UIButtonLocalized {
    
    let typeface:String = "ProximaNova-Semibold"
    
    @IBInspectable var fontFamily: String {
        set {
            self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
        }
        get {
            self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
            
            return  ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
        
    }
    
    
}

@IBDesignable class RegularButton: UIButtonLocalized {
    
    let typeface:String = "ProximaNova-Regular"
    
    @IBInspectable var fontFamily: String {
        set {
            self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
        }
        get {
            self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
            
            return  ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel!.font = UIFont(name: typeface, size: (self.titleLabel!.font.pointSize))
        
    }
    
    
}

@IBDesignable class RegularMessage: UILabel {
    
    let typeface:String = "ProximaNova-Regular"
    
    @IBInspectable var fontFamily: String {
        set {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
        }
        get {
            self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
            return self.font.fontName
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)))
    }
    
    @IBInspectable override dynamic var borderColor:UIColor? {
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
    
    @IBInspectable dynamic var cornerRadiusLabel:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    
    override func awakeFromNib() {
        self.font = UIFont(name: typeface, size: (self.font?.pointSize)!)
    }
}
