//
//  AddWeatherCityViewController.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 14/12/18.
//  Copyright © 2018 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}
class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField!{
        didSet {
            cityNameTextField.bind{
                self.addCityViewModel.city = $0
            }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet{
            stateTextField.bind{
                self.addCityViewModel.state = $0
            }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet{
            zipCodeTextField.bind{
                self.addCityViewModel.zipCode = $0
            }
        }
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButton(){
        
        print(self.addCityViewModel)
        if let city = cityNameTextField.text{
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6fdcf2c3ece5a70b0fe98240b7136fb9")!
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl){data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            Webservice().load(resource: weatherResource){[weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
}
