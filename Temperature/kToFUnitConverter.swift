//
//  kToFUnitConverter.swift
//  Temperature
//
//  Created by Aaron Nguyen on 6/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class kToFUnitConverter {
    
    func degreesFahrenheit(_ degreesKelvin: Int) -> Int {
        return Int(Double(degreesKelvin) * 9/5 - 459.67)
    }
    
}

