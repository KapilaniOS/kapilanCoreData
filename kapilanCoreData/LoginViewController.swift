//
//  LoginViewController.swift
//  kapilanCoreData
//
//  Created by Greeens5 on 04/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet var userNameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    
    var regList = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext() -> NSManagedObjectContext
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func getData(){
        
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RegisterUser")
        let predicate = NSPredicate(format: "username =%@",userNameTxt.text! , "password =%@", passwordTxt.text!)
        fetchRequest.predicate = predicate
        do {
            regList = try context.fetch(fetchRequest) as [AnyObject]
          
            if regList.count > 0 {
                let objectentity = regList.firstObject as! RegisterUser
                if ((userNameTxt.text == objectentity.username) && (passwordTxt.text == objectentity.password))
                    
                {
                    performSegue(withIdentifier: "gotoDisplay", sender: self)
                    
                }
                else
                {
                   
                    print("Username and Password are incorrect...")
                    
                }
            }
           
        }
        catch let error as NSError {
            print("Error...")
        }
        
        
    }
}
