//
//  ViewController.swift
//  Relationships
//
//  Created by Fahir Mehovic on 5/29/15.
//  Copyright (c) 2015 Fahir Mehovic. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext!;
    
    var instructors: [Instructor] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveData()
        loadData();
    }
    
    func saveData() -> Void {
        
        let data = NSEntityDescription.insertNewObjectForEntityForName("Instructor", inManagedObjectContext: context) as! Instructor
        
        data.name = "Andrei"
        data.lastName = "Davis"
        
        //let err: NSError?
        try! context.save()
        
        /*
        if (err != nil) {
            print("Problem")
        }
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        
        let request = NSFetchRequest(entityName: "Instructor");
        
        instructors = try! context.executeFetchRequest(request) as! [Instructor];
        
    }
    
    // use this function to save an instructor the first time you run the project
    func SaveInstructor() {
        let inst = NSEntityDescription.insertNewObjectForEntityForName("Instructor", inManagedObjectContext: context) as! Instructor;
        inst.name = "Andrei";
        inst.lastName = "Davis";
        

        try! context.save()

        
    }
    
    func saveCourse(title: String) {
        
        let course = NSEntityDescription.insertNewObjectForEntityForName("Course", inManagedObjectContext: context) as! Course
        course.title = title
        course.instructor = instructors[0]
        
        try! context.save()
    
    }

    
    @IBAction func displayInstructors(sender: AnyObject) {
        
        let request = NSFetchRequest(entityName: "Instructor");
        
        instructors = try! context.executeFetchRequest(request) as! [Instructor];
        
        
        for instructor in instructors {
            
            print("Instructor Name: \(instructor.name!) \(instructor.lastName!)");
            
            for course in instructor.course! {
                
                let title = course.title as String?;
                
                print("Instructor's Courses: \(title!)");
                
            }
        }
        
    }
    
    @IBAction func addCourse(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Student", message: "Add student name", preferredStyle: .Alert);
        
        let save = UIAlertAction(title: "Save", style: .Default) { (alertAction: UIAlertAction) -> Void in
            let textField = alert.textFields![0] ;
            self.saveCourse(textField.text!);
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Default) { (alertAction: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        
        alert.addAction(save);
        alert.addAction(cancel);
        
        presentViewController(alert, animated: true, completion: nil);
        
    }

}



































