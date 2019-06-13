//
//  ViewController.swift
//  kapilanCoreData
//
//  Created by Greeens5 on 14/05/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var unametxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var mobnotxt: UITextField!
    
    var regUser = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func getContext() -> NSManagedObjectContext{
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appdelegate.persistentContainer.viewContext
    }
    
    func saveRecord(){
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "RegisterUser", in:context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(unametxt.text, forKey: "username")
        newUser.setValue(emailtxt.text, forKey: "email")
        newUser.setValue(mobnotxt.text, forKey: "mobile")
        
        print("Saved...")
        
        do{
            try context.save()
            
        }catch{
            print("Error : Failed")
        }
        
    }
    
    @IBAction func saveAtn(_ sender: Any) {
        saveRecord()
    }
    
}

