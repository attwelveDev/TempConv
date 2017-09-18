//
//  TemperatureRange.swift
//  Temperature
//
//  Created by Aaron Nguyen on 27/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...200).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }

}
