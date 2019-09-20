//
//  Restaurant.swift
//  Resto
//
//  Created by Ludovic on 19/09/2019.
//  Copyright © 2019 Orsys. All rights reserved.
//

import Foundation

struct Restaurant: Equatable, CustomStringConvertible {
    
    var description: String {
        return "Restaurant " + name
    }
    //raw value
    enum FoodStyle: String, CustomStringConvertible, CaseIterable {
        case asian
        case french
        case italian
        case american
        case healthy
        
        var description: String {
            return self.rawValue
        }
    }
    
    var style: FoodStyle
    var name: String
    var address: String
    var numberOfVisits: Int
    
    var offersGlutenFreeMeals: Bool?
    var lastVisit: Date?
    
    init(name: String, style: FoodStyle, address: String, glutenFree: Bool?) {
        self.name = name
        self.style = style
        self.address = address
        self.offersGlutenFreeMeals = glutenFree
        numberOfVisits = 0
        //        lastVisit = nil
    }
}
