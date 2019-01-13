//
//  SettingsViewModel.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 11/01/19.
//  Copyright © 2019 Hario Budiharjo. All rights reserved.
//

import Foundation

enum Unit:String,CaseIterable{
    case celsius = "metric"
    case fahrenheit="imperial"
}

extension Unit{
    var displayName:String{
        get{
            switch(self) {
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    let unit = Unit.allCases
    private var _selectedUnit:Unit = Unit.fahrenheit
    
    var selectedUnit:Unit{
        get{
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String{
                return Unit(rawValue: value)!
            }
            return _selectedUnit 
        }
        set{
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
