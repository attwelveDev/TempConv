//
//  fToKUnitConverter.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class fToKUnitConverter {
    
    func degreesKelvin(_ degreesFahrenheit: Int) -> Int {
        return Int((459.67 + Double(degreesFahrenheit)) * 5/9)
    }
    
}
