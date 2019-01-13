//
//  WeatherListTableViewController.swift
//  Good Weather
//
//  Created by Hario Budiharjo on 14/12/18.
//  Copyright © 2018 Hario Budiharjo. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()    }
    
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
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
        
    }
    
    func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Controller not found!")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else{
            fatalError("AddWeatherCityViewController")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsTableViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Controller not found!")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else{
            fatalError("SettingsTableViewController")
        }
        
        settingsTVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }
}

extension WeatherListTableViewController: SettingsDelegate{
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
