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
    var arrayAnimal = []
    
    var currentAnimal: OMAnimal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dog = OMDog(name: "Buldog", age: 4, color: "Black")
    
        name.text  = dog.name
        age.text   = String(dog.age)
        color.text = dog.color
        
        let cat = OMCat(name: "Duska", age: 2, color: "White")
        
        name.text  = cat.name
        age.text   = String(cat.age)
        color.text = cat.color
        
        let monkey = OMMonkey(name: "Jimbo", age: 5, color: "White")
        
        name.text  = monkey.name
        age.text   = String(monkey.age)
        color.text = monkey.color
        
        arrayAnimal = [dog, cat, monkey]
        
        updateAnimal()
    }

    func updateAnimal() {
        
        currentAnimal = arrayAnimal[index] as! OMAnimal
        
        name.text  = currentAnimal.name
        age.text   = String(currentAnimal.age)
        color.text = currentAnimal.color
        
    }
    
    @IBAction func next(sender: UIButton) {
        
        index++
        
        if index == arrayAnimal.count {
            
            index = arrayAnimal.count - 1
            
        }
        
        updateAnimal()
        
    }
    
    @IBAction func previous(sender: UIButton) {
        
        index--
        
        if index == -1 {
            
            index++
            updateAnimal()
            
        }
        
        updateAnimal()
        
        
        
    }
    
    @IBAction func voice(sender: UIButton) {
    
        currentAnimal = arrayAnimal[index] as! OMAnimal
        
        currentAnimal.voice()
        
    }
    
}

