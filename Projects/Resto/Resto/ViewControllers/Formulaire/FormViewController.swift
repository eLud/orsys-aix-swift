//
//  FormViewController.swift
//  Resto
//
//  Created by Ludovic on 18/09/2019.
//  Copyright © 2019 Orsys. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var steppelValueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        steppelValueLabel.text = String(Int(stepper.value))
        
        configureSegmentedControl()
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        steppelValueLabel.text = String(Int(sender.value))
    }
        
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text, name.count > 2 else { return }
        guard let address = addressTextField.text, address.count > 2 else { return }
        
        let selectedSegmentIndex = styleSegmentedControl.selectedSegmentIndex
        guard selectedSegmentIndex >= 0 else { return }
        let style = Restaurant.FoodStyle.allCases[selectedSegmentIndex]
        
        let newResto = Restaurant(name: name, style: style, address: address, glutenFree: nil)
        
        RestaurantLibrary.shared.add(newResto)
        
        dismiss(animated: true) {
            print("J'ai dismiss")
        }
    }
    
    @IBAction func visitedSwitchChanged(_ sender: UISwitch) {
        stepper.isEnabled = sender.isOn
    }
    
    private func configureSegmentedControl() {
        
        styleSegmentedControl.removeAllSegments()
        for style in Restaurant.FoodStyle.allCases {
            styleSegmentedControl.insertSegment(withTitle: style.rawValue.capitalized, at: styleSegmentedControl.numberOfSegments, animated: false)
        }
        styleSegmentedControl.selectedSegmentIndex = 0
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

