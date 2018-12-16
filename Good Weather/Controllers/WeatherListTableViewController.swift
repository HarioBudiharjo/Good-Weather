//
//  WeatherListTableViewController.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 14/12/18.
//  Copyright © 2018 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.cityNameLabel.text = "Tangerang"
        cell.temperatureLabel.text = "18°"
        return cell
    }
}
