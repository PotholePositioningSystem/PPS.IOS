//
//  File.swift
//  PPS
//
//  Created by Jovi on 5/2/18.
//  Copyright © 2018 PotholePositioningSystem. All rights reserved.
//

import Foundation

class Log
{
    public static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if(true)
        {
            let output = items.map { "*\($0)" }.joined(separator: separator)
            Swift.print(output, terminator: terminator)
        }
    }
}
