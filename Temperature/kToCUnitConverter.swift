//
//  kToCUnitConverter.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class kToCUnitConverter {
    
    func degreesCelsius(_ degreesKelvin: Int) -> Int {
        return Int(Double(degreesKelvin) - 273)
    }
    
}
