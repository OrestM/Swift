//
//  ViewController.swift
//  TestCoreData
//
//  Created by Orest Mykha on 12/15/16.
//  Copyright © 2016 Orest Mykha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let studentClassName:String = String(describing: Student.self)
        let courseClassName:String = String(describing: Course.self)
        
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: studentClassName, into: DataBaseController.getContext()) as! Student
        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: DataBaseController.getContext()) as! Course
        
        student.firstName = "John"
        student.lastName = "Smith"
        student.age = 16
        
        course.courseName = "Computer Science 402"
        
        student.addToCourses(course)
//        course.addToStudents(student)
        
        DataBaseController.saveContext()
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            let searchResults = try DataBaseController.getContext().fetch(fetchRequest)
            print("number of results \(searchResults.count)")
            for result in searchResults as [Student] {
                print("\(result.firstName!) \(result.lastName!) is \(result.age) years old.")
            }
        } catch {
            print("Error: \(error)")
        }
        
        do {
            if let results = try DataBaseController.getContext().fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [NSManagedObject] {
                for result in results {
                    DataBaseController.getContext().delete(result)
                }
                
                DataBaseController.saveContext()
            }
        } catch {
            print("failed to clear core data")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

