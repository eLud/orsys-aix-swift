//
//  ListViewController.swift
//  Resto
//
//  Created by Ludovic on 20/09/2019.
//  Copyright © 2019 Orsys. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let source = MyPickerDataSource.shared
    
    let library = RestaurantLibrary.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pickerView.dataSource = source
        pickerView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let resto = Restaurant(name: "Le carré d'Aix", style: .french, address: "Pas loin", glutenFree: false)
        library.add(resto)
        
    }
    
    
    //MARK: - UITableDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestaurantLibrary.shared.restaurants.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
        
        let currentResto = RestaurantLibrary.shared.restaurants[indexPath.row]
        
        cell.textLabel?.text = currentResto.name
        cell.detailTextLabel?.text = currentResto.address
        
        // Beware the recycling
//        if indexPath.row.isMultiple(of: 2) {
//            cell.backgroundColor = .white
//        }
        
        return cell
     }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            print(segue)
            
            guard let detailsVC = segue.destination as? DetailsViewController else { return }
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else { return }
            
            let restaurant = library.restaurants[indexPath.row]
            detailsVC.restaurant = restaurant
        }
    }
    
}

//MARK: - Extensions

extension ListViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return 10
        case 1:
            return 5
        default:
            return 0
        }
    }
}

extension ListViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Hello \(row) \(component)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Did select row \(row)")
        print(NSLocalizedString("DID_SELECT_ROW", comment: ""))
    }
}

class MyPickerDataSource: NSObject, UIPickerViewDataSource {
    
    static let shared = MyPickerDataSource()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return 10
        case 1:
            return 5
        default:
            return 0
        }
    }
}
