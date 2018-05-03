//
//  UIExtensions.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//


import UIKit

extension UIView {
    static func setBorderColor(_ view:AnyObject,color:String)-> Void
    {
        view.layer.borderColor = UIColor(hex: color).cgColor
    }
}

extension UIImage{
    
    public static func imageFromColor(_ color: UIColor, frame: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
        color.setFill()
        UIRectFill(CGRect(x:0, y:0, width:100, height:100))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func resizeWith(percentage: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    func resizeWith(width: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    public static func drawClose(_ size: CGSize) -> UIImage {
        
        let size:CGSize = CGSize(width: 14, height: 14)
        
        // Setup our context
        let padding:CGFloat = 0
        let bounds = CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: (size.width+padding), height: size.height))
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width+padding, height: size.height), opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setLineWidth(1.8)
        
        // CGContextStrokeRect(context, bounds)
        
        context?.beginPath()
        
        context?.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
        context?.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        context?.move(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        context?.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        context?.strokePath()
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        return image!
    }
    
    
    public static func drawBack(_ size: CGSize) -> UIImage {
        // Setup our context
        let padding:CGFloat = -5
        let bounds = CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: (size.width+padding), height: size.height))
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width+padding, height: size.height), opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setLineWidth(1.0)
        
        // CGContextStrokeRect(context, bounds)
        
        context?.beginPath()
        context?.move(to: CGPoint(x: bounds.minX+10+padding, y: bounds.minY+10))
        context?.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        context?.move(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        context?.addLine(to: CGPoint(x: bounds.minX+10+padding, y: bounds.maxY-10))
        context?.strokePath()
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    
}

class InsetLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)))
    }
}

class MyHiddenTextField: UITextField {
    

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        UIMenuController.shared.isMenuVisible = false
        UIMenuController.setAccessibilityElementsHidden(false)
        
        
        return false
        
        
    }
}

