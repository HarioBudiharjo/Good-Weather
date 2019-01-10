//
//  Double+Extensions.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 11/01/19.
//  Copyright © 2019 Hario Budiharjo. All rights reserved.
//

import Foundation

extension Double{
    var formatAsDegree: String{
        return String(format: "%.0f°", self)
    }
}
