//
//  cToKUnitConverter.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class cToKUnitConverter {
    
    func degreesKelvin(_ degreesCelsius: Int) -> Int {
        return Int(273.15 + Double(degreesCelsius))
    }
    
}
