//
//  ViewController.swift
//  SaveAndLoadUserWithCoreData
//
//  Created by Orest Mykha on 12/16/16.
//  Copyright © 2016 Orest Mykha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.userName.delegate = self
        self.userPassword.delegate = self
        self.userPassword.isSecureTextEntry = true
        
    }

    @IBAction func clearAction(_ sender: AnyObject) {
        if (self.userName.text?.characters.count)! > 0 || (self.userPassword.text?.characters.count)! > 0 {
            self.userName.text = ""
            self.userPassword.text = ""
        }
    }
    
    @IBAction func deleteAction(_ sender: AnyObject) {
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try CoreDataManager.getContext().fetch(fetchRequest)
            
            for item in items {
                CoreDataManager.getContext().delete(item)
                self.alertController(message: "User is deleted with name:\(item.userName!) successfully")
                self.userName.text = ""
                self.userPassword.text = ""
            }
            
            CoreDataManager.saveContext()
        } catch {
            print("Error")
        }
    }
    
    @IBAction func loadAction(_ sender: AnyObject) {
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let searchResult = try CoreDataManager.getContext().fetch(fetchRequest)
            if searchResult.count > 0 {
                for result in searchResult {
                    self.userName.text = result.userName
                    self.userPassword.text = result.userPassword
                }
            } else {
                self.alertController(message: "User not saved")
            }
        } catch {
            self.alertController(message: (error.localizedDescription))
        }
    }
    
    @IBAction func saveAction(_ sender: AnyObject) {
        let userClassName:String = String(describing: User.self)
        
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let searchResult = try CoreDataManager.getContext().fetch(fetchRequest)
            if searchResult.count < 1 && self.userName.text?.isEmpty == false && self.userPassword.text?.isEmpty == false {
                let user:User = NSEntityDescription.insertNewObject(forEntityName: userClassName, into: CoreDataManager.getContext()) as! User
                user.userName = self.userName.text
                user.userPassword = self.userPassword.text
                CoreDataManager.saveContext()
                self.alertController(message: "User is saved with name:\(self.userName.text!) successfully!")
            } else if self.userName.text?.isEmpty == true {
                self.alertController(message: "User name is empty!")
            } else if self.userPassword.text?.isEmpty == true {
                self.alertController(message: "User password is empty!")
            } else {
                self.alertController(message: "You alredy have created user")
            }
        } catch {
            self.alertController(message: (error.localizedDescription))
        }
        
    }
    
    func alertController(message: String) -> Void {
        let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.userName {
            self.userPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }

}

