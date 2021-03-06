//
//  WeatherCell.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 16/12/18.
//  Copyright © 2018 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var temperatureLabel : UILabel!
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = vm.name.value
        self.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
    }
}
