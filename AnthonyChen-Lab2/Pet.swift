//
//  Pet.swift
//  AnthonyChen-Lab2
//
//  Created by Anthony C on 9/12/22.
//

import Foundation

// define the pet class
class Pet{
    // member variables
    private var name: String?
    private var happiness: Int
    private var foodlevel: Int
    public var played: Int
    public var fed: Int
    var kind: PetType?
    enum PetType{
        case cat
        case bird
        case bunny
        case fish
        case dog
    }

    // constructor
    init(name: String, kind: PetType){
        self.name = name
        self.kind = kind
        self.happiness = 40
        self.foodlevel = 40
        self.played = 0
        self.fed = 0
    }
    
    
    // accessors
    func getName() -> String{
        return name ?? "Pet"
    }

    func getHappiness() -> Int{
        return happiness
    }
    
    func decreaseHappiness(){
        // decrease happiness by 1 if it is greater than 0
        if happiness > 0{
            happiness -= 1
        }
    }
    
    func decreaseFoodLevel(){
        // decrease food level by 2 if it is greater than 0
        if foodlevel > 0{
            foodlevel -= 2
        }
    }

    func getFoodLevel() -> Int{
        return foodlevel
    }
    func getKind() -> PetType{
        return kind ?? PetType.cat
    }

    // action function
    func feed(){
        foodlevel += 20
        fed += 1
        // if foodlevel reach max, set it to max
        if foodlevel > 100{
            foodlevel = 100
        }
    }
    func play(){
        // if foodlevel is not 0, play
        if foodlevel > 0{
            happiness += 5
            foodlevel -= 5
            played += 1
            // if happiness reach max, set it to max
            if happiness > 100{
                happiness = 100
            }
        }
    }
}
