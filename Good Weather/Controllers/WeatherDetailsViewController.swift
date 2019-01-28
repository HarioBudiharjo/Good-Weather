//
//  WeatherDetailsViewController.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 28/01/19.
//  Copyright © 2019 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weatherViewModel : WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVMBindings()
    
    }
    
    func setupVMBindings(){
        if let weatherVM = self.weatherViewModel{
            weatherVM.name.bind{
                self.cityNameLabel.text = $0
            }
            
            weatherVM.currentTemperature.temperature.bind{
                self.currentTempLabel.text = $0.formatAsDegree
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.weatherViewModel?.name.value = "Tangerang"
            }
            
        }
    }
}
