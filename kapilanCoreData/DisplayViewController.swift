//
//  DisplayViewController.swift
//  kapilanCoreData
//
//  Created by Greeens5 on 21/05/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var RegList : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fetchRecord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getContext() -> NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func fetchRecord()
    {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Save")
        
        do{
            
            RegList = try context.fetch(fetchRequest) as! [NSManagedObject]
            
        }catch{
            print("Error...")
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RegList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DisplayTableViewCell
        
        let regis = RegList[indexPath.row]
        
        cell.emailLabel.text = regis.value(forKeyPath: "email") as? String
        cell.mobileLabel.text = regis.value(forKeyPath: "mobile") as? String
        cell.unameLabel.text = regis.value(forKeyPath: "username") as? String
 
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 118;
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let context = getContext()
            context.delete(RegList[indexPath.row] as NSManagedObject)
            do{
                try context.save()
                fetchRecord()
                tableView.reloadData()
                
            }catch{
                print(error)
            }
        }
        
    }
}
