
class Dog {

    let name: String
    
    //Stored property
    var age: Int {
        willSet {
            newValue
        }
        didSet {
           print("age changed")
            oldValue
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
    
    func eat() {
        
    }
}

struct Cat: Equatable {
    
    let name: String
    var age: Int
    
    // Computed property
    var humanAge: Int {
        get {
            return age * 7
        }
        set {
            age = newValue / 7
        }
    }
    
    func eat() {
        
    }
}
//
//let aDog = Dog(name: "Médor", age: 5)
//aDog.eat()
//print(aDog.name)
//
//let anotherDog = aDog
//anotherDog.age = 1
//
//let aCat = Cat(name: "Félix", age: 0)
//aCat.eat()
//print(aCat.name)
//
//var anotherCat = aCat
//anotherCat.age = 1
//anotherCat.humanAge
//
//aDog.age
//anotherDog.age
//
//aCat.age
//anotherCat.age


var 🏗: [String] = ["Toto"]

let téléphone: [[String]] = [🏗]
téléphone[0][0]

let testDict = ["toto":"titi", "tata": "titi"]
