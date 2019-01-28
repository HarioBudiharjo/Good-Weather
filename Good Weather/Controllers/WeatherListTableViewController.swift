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
    private var datasource : WeatherDataSource?
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.datasource = WeatherDataSource(self.weatherListViewModel)
        self.tableView.dataSource = self.datasource
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }else if segue.identifier == "WeatherDetailsViewController"{
            prepareSegueForWeatherDetailsViewController(segue:segue)
        }
        
    }
    
    func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue){
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow else{
                return
        }
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
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

}

extension WeatherListTableViewController: SettingsDelegate{
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}

