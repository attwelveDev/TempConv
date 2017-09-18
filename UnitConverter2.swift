//
//  UnitConverter2.swift
//  Temperature
//
//  Created by Aaron Nguyen on 29/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class UnitConverter2 {

    func degreesCelsius(_ degreesFahrenheit: Int) -> Int {
        return Int(Float(degreesFahrenheit - 32) * 5.0 / 9.0)
    }
    
}
