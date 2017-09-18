//
//  TemperatureRange2.swift
//  Temperature
//
//  Created by Aaron Nguyen on 2/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class TemperatureRange2: NSObject, UIPickerViewDataSource {

    let values = (-150...250).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
