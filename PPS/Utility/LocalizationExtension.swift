//
//  LocalizationExtension.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import UIKit


public protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

class UILabelLocalized:SizesUILabel {
    
    override func awakeFromNib() {
        self.text = self.text?.localized
    }
    
}


class UIButtonLocalized:MyButton {
    open override func awakeFromNib() {
        self.setTitle(self.titleLabel?.text?.localized, for: .normal)
    }
    
}





