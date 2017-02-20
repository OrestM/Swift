//
//  OMAnimal.swift
//  FirstTestSimpleApp
//
//  Created by Admin on 5/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class OMAnimal: NSObject {
    
    let name: String
    let age: NSInteger
    let color: String

    init(name: String, age: NSInteger, color: String) {
        self.name  = name
        self.age   = age
        self.color = color
    }
    
    func voice() {
        
    }

}
