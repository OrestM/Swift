//
//  ViewController.swift
//  CompileObjcAndSwift
//
//  Created by Orest Mykha on 1/27/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var objectiveVC = ObjectiveViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentObjcVC(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        objectiveVC = storyboard.instantiateViewController(withIdentifier: "ObjectiveViewController") as! ObjectiveViewController
        objectiveVC.view.backgroundColor = UIColor.lightGray
        objectiveVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        self.present(objectiveVC, animated: true, completion: nil)
        
    }

}

