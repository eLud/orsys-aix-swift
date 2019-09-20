import UIKit



struct Restaurant: Equatable, CustomStringConvertible {
    
    var description: String {
        return "Restaurant " + name
    }
                    //raw value
    enum FoodStyle: String, CustomStringConvertible {
        case asian
        case french
        case italian
        case american
    
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

class RestaurantLibrary {
    
    //Possibilité de définir uniquement le setter privé
    private(set) var restaurants: [Restaurant] = []
    
    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)
        print("Les restaurant propose du glutenFree \(restaurant.offersGlutenFreeMeals)")
    }
    
}


let asian = Restaurant.FoodStyle.asian
Restaurant.FoodStyle(rawValue: "japanese")

//Restaurant(style: .american, name: "McDo", address: "23 reuikjvch", numberOfVisits: 0, offersGlutenFreeMeals: false, lastVisit: <#T##Date#>)
