//
//  DetailsViewController.swift
//  Resto
//
//  Created by Ludovic on 20/09/2019.
//  Copyright © 2019 Orsys. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let resto = restaurant else { fatalError("No restaurant provided") }
        
        addressLabel.text = resto.address
        self.title = resto.name
        
        let url = URL(string: "https://developer.apple.com/app-store/review/images/design-ios-large.png")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            
        }
        task.resume()
    }

    @IBAction func goBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
