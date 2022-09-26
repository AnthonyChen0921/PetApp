//
//  ViewController.swift
//  AnthonyChen-Lab2
//
//  Created by Anthony C on 9/12/22.
//

import UIKit


class ViewController: UIViewController {

    // declare the pet object
    var currentPet: Pet?
    var pet1: Pet?
    var pet2: Pet?
    var pet3: Pet?
    var pet4: Pet?
    var pet5: Pet?
    
    var timer = Timer()
    
    // declare pet array
    var petArray: [Pet] = []
    

    @IBOutlet weak var canvas: DisplayView!
    @IBOutlet weak var foodLevelValue: UILabel!
    @IBOutlet weak var happinessValue: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var happinessView: DisplayView!
    @IBOutlet weak var foodLevelView: DisplayView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // create a cat object
        pet1 = Pet(name: "Snowball", kind: Pet.PetType.cat)
        // create a bird object
        pet2 = Pet(name: "birdy", kind: Pet.PetType.bird)
        // create a bunny object
        pet3 = Pet(name: "littleWhite", kind: Pet.PetType.bunny)
        // create a fish object
        pet4 = Pet(name: "fishy", kind: Pet.PetType.fish)
        // create a dog object
        pet5 = Pet(name: "doge", kind: Pet.PetType.dog)

        // store pet object in an array
        petArray = [pet1!, pet2!, pet3!, pet4!, pet5!]

        // set the current pet to the cat
        currentPet = pet1
        
        runTimer()

        //setup happiness and food level color by hex
        happinessView.color = .systemOrange
        foodLevelView.color = .systemMint
        canvas.backgroundColor = .systemOrange
        view.backgroundColor = .secondarySystemBackground
        updateDisplay()
    }
    // timer tutorial from https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
    @objc func updateTimer() {
        // loop through the pets to call decreaseHappiness and decreaseFoodLevel
        for pet in petArray{
            pet.decreaseHappiness()
            pet.decreaseFoodLevel()
        }
        updateDisplay()
    }
    @objc func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
        currentPet?.play()
        updateDisplay()
    }
    
    
    @IBAction func feedPressed(_ sender: Any) {
        currentPet?.feed()
        updateDisplay()
    }
    

    @IBAction func catSwitch(_ sender: Any) {
        currentPet = pet1
        petImage.image = UIImage(named: "cat")
        canvas.backgroundColor = .systemOrange
        happinessView.color = .systemOrange
        foodLevelView.color = .systemMint
        updateDisplay()
    }
    
    @IBAction func birdSwitch(_ sender: Any) {
        currentPet = pet2
        petImage.image = UIImage(named: "bird")
        canvas.backgroundColor = .systemGreen
        happinessView.color = .systemGreen
        foodLevelView.color = .systemYellow
        updateDisplay()
    }
    
    @IBAction func bunnySwitch(_ sender: Any) {
        currentPet = pet3
        petImage.image = UIImage(named: "bunny")
        canvas.backgroundColor = .systemYellow
        happinessView.color = .systemYellow
        foodLevelView.color = .systemRed
        updateDisplay()
    }
    
    @IBAction func fishSwitch(_ sender: Any) {
        currentPet = pet4
        petImage.image = UIImage(named: "fish")
        canvas.backgroundColor = .systemPink
        happinessView.color = .systemPink
        foodLevelView.color = .systemPurple
        updateDisplay()
    }
    
    
    @IBAction func dogSwitch(_ sender: Any) {
        currentPet = pet5
        petImage.image = UIImage(named: "dog")
        canvas.backgroundColor = .systemBlue
        happinessView.color = .systemBlue
        foodLevelView.color = .systemGreen
        updateDisplay()
    }
    
    func updateDisplay(){
        // update the display
        
        let x : Int = currentPet?.played ?? 0
        let y : Int = currentPet?.fed ?? 0
        let playedTimes = "played: \(x)"
        let fedTimes = "fed: \(y)"
        foodLevelValue.text = fedTimes
        happinessValue.text = playedTimes

        // setup foodlevel view value
        let foodlevelValue = Double((currentPet?.getFoodLevel())!)/100
        let happinessValue = Double((currentPet?.getHappiness())!)/100
        
        // update the progress bar
        foodLevelView.animateValue(to: CGFloat(foodlevelValue))
        happinessView.animateValue(to: CGFloat(happinessValue))
    }

    

}

