//
//  TemperatureRange6.swift
//  Temperature
//
//  Created by Aaron Nguyen on 6/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class TemperatureRange6: NSObject, UIPickerViewDataSource {
    
    let values = (0...373).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
