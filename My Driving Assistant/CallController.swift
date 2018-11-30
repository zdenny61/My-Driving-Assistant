//
//  CallController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Updated by Zachary Denny on 12/29/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//
//My Driving Assistant License
//Copyright (c) 2018 Denny Homes. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to use
//the Software with restriction. Restrictions including the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software. If you wish to use this software, the following conditions must be met:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//
//THE SOFTWARE PROVIDED IS TO BE USED FOR LEARNING
//PURPOSES OR FOR A PERSONS OWN SELF USE. NO PERSON MAY SELL, PUBLISH, OR DISTRIBUTE
//ANY PARTS OF THE CODE IN ITS ENTIRETY OR THE APPLICATION ITSELF. ALL CODE AND
//THE APPLICATION ITSELF IS THE PROPERTY OF ZACHARY TAYLOR DENNY (THE ORIGINAL WRTIER OF THIS CODE)
//OWNER OF DENNY HOMES AND ANY ORGANIZATION THAT
//ZACHARY TAYLOR DENNY (THE ORIGINAL WRTIER OF THIS CODE) OR DENNY HOMES IS WORKING WITH.
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
        
//        cell.backgroundView?.layer.cornerRadius = 8
//        cell.backgroundView?.layer.masksToBounds = true
//
//        cell.layer.shadowOpacity = 0.18
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.layer.shadowRadius = 2
//        cell.layer.shadowColor = UIColor .black as! CGColor
//        cell.layer.masksToBounds = false
        
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
            
//            cell.backgroundView?.layer.cornerRadius = 8
//            cell.backgroundView?.layer.masksToBounds = true
//            
//            cell.layer.shadowOpacity = 0.18
//            cell.layer.shadowOffset = CGSize(width: 0, height: 2)
//            cell.layer.shadowRadius = 2
//            cell.layer.shadowColor = UIColor .black as! CGColor
//            cell.layer.masksToBounds = false
            
            
            
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

