//
//  CallController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit

class CallController: UIViewController {
    @IBOutlet weak var CallEditButton: UIButton!
    @IBOutlet weak var ContactTableCell: UITableView!
    
    
    var ContactArray = [String]() //Array for contacts
    var table1Data = ["a"]
    var tableText = "Zachary T. Denny"
    
    
    var cars = [String]()
    var newCar: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
         cars = ["BMW","Audi","Volkswagen"]
        
        
        ContactArray.append("Zachary Denny")
        
        
        // Update Table Data
        ContactTableCell.beginUpdates()
        ContactTableCell.insertRows(at: [
            NSIndexPath(row: ContactArray.count-1, section: 0) as IndexPath], with: .automatic)
        ContactTableCell.endUpdates()
        
        

        
    }
    
    
    
    // 1
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 2
     func ContactTableCell(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    // 3
     func ContactTableCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
    
    
    
    
    //edit
    @IBAction func EditButtonPush(_ sender: Any) {
        
        if CallEditButton.currentTitle == "Edit"{
           
            CallEditButton.setTitle("Done", for: .normal)
            
        }else{
            
            
            //add your data into tables array from textField
            table1Data.append(tableText)
            
            
            DispatchQueue.main.async(execute: { () -> Void in
                
           
                //reload your tableView
                self.ContactTableCell.reloadData()
                
            })
            
            
            //tableText.resignFirstResponder()
            
            
            
            CallEditButton.setTitle("Edit", for: .normal)
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    //delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ContactTableCell {
            return table1Data.count
        }
        return Int()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == ContactTableCell {
            let cell = ContactTableCell.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) 
            
            let row = indexPath.row
            cell.textLabel?.text = table1Data[row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
    
//Call Funtion
    
    func phone(phoneNum: String) {
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    
    
    
    
}

