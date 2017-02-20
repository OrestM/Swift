//
//  ViewController.swift
//  FirstTestSimpleApp
//
//  Created by Admin on 5/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var age:   UILabel!
    @IBOutlet weak var name:  UILabel!
    
    var index = 0
    var arrayAnimal = [Any]()
    
    var currentAnimal: OMAnimal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dog = OMDog(name: "Buldog", age: 4, color: "Black")
        let cat = OMCat(name: "Duska", age: 2, color: "White")
        let monkey = OMMonkey(name: "Jimbo", age: 5, color: "White")
        
        arrayAnimal = [dog, cat, monkey]
        
        updateAnimal()
    }

    func updateAnimal() {
        
        // Get animal with correct index
        currentAnimal = arrayAnimal[index] as! OMAnimal
        
        name.text  = currentAnimal.name
        age.text   = String(currentAnimal.age)
        color.text = currentAnimal.color
        
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        index += 1
        
        if index == arrayAnimal.count {
            
            index -= 1
            
        }
        
        updateAnimal()
        
    }
    
    @IBAction func previous(_ sender: UIButton) {
        
        index -= 1
        
        if index == -1 {
            
            index += 1
            
        }
        
        updateAnimal()
        
    }
    
    @IBAction func voice(_ sender: UIButton) {
    
        currentAnimal = arrayAnimal[index] as! OMAnimal
        
        currentAnimal.voice()
        
    }
    
}

