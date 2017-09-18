//
//  UnitConverter.swift
//  Temperature
//
//  Created by Aaron Nguyen on 27/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class UnitConverter {
    
    func degreesFahrenheit(_ degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }

}
