//
//  TemperatureRange3.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class TemperatureRange3: NSObject, UIPickerViewDataSource {
    
    let values = (-273...100).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
