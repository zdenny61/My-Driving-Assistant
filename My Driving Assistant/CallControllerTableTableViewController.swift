//
//  CallControllerTableTableViewController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/11/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import Foundation
import CoreData



class CallControllerTableTableViewController: UITableViewController {

    
    
    
    
    var cars = [String]()
    var newCar: String = ""
    
    var PhoneNumbers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//
//        let entity = NSEntityDescription.entity(forEntityName: "EmergencyContacts", in: context)
//        let newContact = NSManagedObject(entity: entity!, insertInto: context)
//
//
//
//
//        newContact.setValue("Zachary Denny", forKey: "nameID")
//        newContact.setValue("7857669375", forKey: "phoneNumber")
////        newContact.setValue("Emergency 911", forKey: "nameID")
////        newContact.setValue("911", forKey: "phoneNumber")
//
//
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EmergencyContacts")
//
//        //request.predicate = NSPredicate(format: "age = %@", "12")
//        request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "nameID") as! String)
//                print(data.value(forKey: "phoneNumber") as! String)
//            }
//
//        } catch {
//
//            print("Failed")
//        }
        
        
        
        
        
        cars = ["Emergency 911","Zachary Denny", "Alexis Hartley", "<< Contact 3 Slide Left", "<< Contact 4 Slide Left"]
        PhoneNumbers = ["7857669375","7857669375", "810", "Error", "Error"]
        
        
        print(cars.debugDescription)
        
////Name File
//        let fileName = "EmergencyContactsID"
//        let dir = try? FileManager.default.url(for: .documentDirectory,
//                                               in: .userDomainMask, appropriateFor: nil, create: true)
//
//        // If the directory was found, we write a file to it and read it back
//        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
//
//
//
//
//
//
//
//
////
////                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
////                    let context = appDelegate.persistentContainer.viewContext
////
////
//////                    let entity = NSEntityDescription.entity(forEntityName: "FirstTime", in: context)
//////                    let newContact = NSManagedObject(entity: entity!, insertInto: context)
//////
//////
//////
//////
//////                    newContact.setValue(false, forKey: "first")
//////
//////
////
////                    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FirstTime")
////
////                    //request.predicate = NSPredicate(format: "age = %@", "12")
////                    request.returnsObjectsAsFaults = false
////                    do {
////                        let result = try context.fetch(request)
////                        for data in result as! [NSManagedObject] {
////                            print(data.value(forKey: "first") as! String)
////
////
////
////                        }
////
////                    } catch {
////
////                        print("Failed")
////                    }
////
//
//
//
//            //Uncomment to write the file for names
//
////            // Write to the file named Test
////            let outString = "Emergency 911,<< Contact 1 Slide Left,<< Contact 2 Slide Left,<< Contact 3 Slide Left,<< Contact 4 Slide Left"
//
////            do {
////                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
////            } catch {
////                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
////            }
//
//            // Then reading it back from the file
//            var inString = ""
//            do {
//                inString = try String(contentsOf: fileURL)
//            } catch {
//                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
//            }
//            print("ID's: \(inString)")
//
//            cars = inString.components(separatedBy: ",")
//
//            //Save the data
//            //Used for saving
//            //encode data that is currently in var data
//
//
//
//
//
//
//
//
//            print(cars)
//        }
//
        
        let defaults = UserDefaults.standard

        
        if let LoadedFirst = defaults.string(forKey: usersData.userFirstTime){
            print("Im in loaded")
            
            
        }else{
            
            print("this is being ran!")
            
          //saving names first time
            defaults.set(cars, forKey: usersData.userContactsNames)
            print("reset names")
            
        
            
           //saving numbers first time
            defaults.set(PhoneNumbers, forKey: usersData.userContactsNumbers)
            print("reset numbers")
            
            print("Im in not loaded")
             defaults.set("loaded", forKey: usersData.userFirstTime)
        }
        
        
        
        
        
 //Names Handelers
//        let stringNames = defaults.stringArray(forKey: usersData.userContactsNames)
//        print(stringNames)
        
        if let stringNames = defaults.stringArray(forKey: usersData.userContactsNames) {
            print(stringNames) // Some String Value
            
            cars = stringNames//.components(separatedBy: ",")
            print("loaded names")
            print(stringNames)
            
        }else{
            print("names skiped")
            
        }
        
        
//Numbers Handelers
        // Setting and saving userdefaults for the contact numbers data
       
        
        
        
        if let stringNumbers = defaults.stringArray(forKey: usersData.userContactsNumbers) {
            print(stringNumbers) // Some String Value
            
            PhoneNumbers = stringNumbers//.components(separatedBy: ",")
            print("loaded numbers")
            print(stringNumbers)
        }
//
////Number file
//
//        let fileNameNum = "EmergencyContactsNumbers"
//        let dirNum = try? FileManager.default.url(for: .documentDirectory,
//                                               in: .userDomainMask, appropriateFor: nil, create: true)
//
//        // If the directory was found, we write a file to it and read it back
//        if let fileURL = dirNum?.appendingPathComponent(fileNameNum).appendingPathExtension("txt") {
//
//
//            //Uncomment to write the file for numbers
//
//
////                        // Write to the file named Test
////                        let outString = "7857669375,Error,Error,Error,Error"
//
////                        do {
////                            try outString.write(to: fileURL, atomically: true, encoding: .utf8)
////                        } catch {
////                            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
////                        }
//
//            // Then reading it back from the file
//            var inString = ""
//            do {
//                inString = try String(contentsOf: fileURL)
//            } catch {
//                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
//            }
//            print("Numbers's: \(inString)")
//
//
//            PhoneNumbers = inString.components(separatedBy: ",")
//
//            print(PhoneNumbers)
//
//
//
//        }
        
        
//        var data =
//        data = cleanRows(file: data)
//        let csvRows = csv(data: data)
//        print(csvRows[1][1]) //UXM n. 166/167.
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    
    // MARK: - Table view data source

    // 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 2
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    // 3
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        
        phone(phoneNum: (PhoneNumbers[indexPath.row]))
        
//        if indexPath.row == 0 {
//            phone(phoneNum: "7857669375")
//        }else if indexPath.row == 1{
//            phone(phoneNum: "7857669375")
//        }else if indexPath.row == 2{
//            phone(phoneNum: "810")
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//Call Funtion
    func phone(phoneNum: String) {
        
        if phoneNum == "Error"{
            
            let alert = UIAlertController(title: "OOPS!", message: "You must enter a person into this contact first", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                
                case .cancel:
                    print("cancel")
                   
                    
                case .default: break
                    
                case .destructive: break
                
                }}))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            if let url = URL(string: "tel://\(phoneNum)") {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url as URL)
                }
            }
            
        }
        
        
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        if indexPath.row == 0{
            print("This is emergency cant delete")
            
            
            
            let deleteAction = UITableViewRowAction(style: .default, title: "", handler: { (action, indexPath) in
            })
            let EmergencyAction = UITableViewRowAction(style: .default, title: "This is a Emergency Line", handler: { (action, indexPath) in
            })
            
            return [EmergencyAction, deleteAction]
        }else{
          
            let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
                let alert = UIAlertController(title: "", message: "Edit Contact", preferredStyle: .alert)
                alert.addTextField(configurationHandler: { (textField) in
                    textField.placeholder = "Enter Contacts Name"
                })
                alert.addTextField(configurationHandler: { (textField2) in
                    textField2.placeholder = "Enter Contact Phone Number"
                })
                alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                    self.cars[indexPath.row] = alert.textFields!.first!.text!
                    self.PhoneNumbers[indexPath.row] = alert.textFields![1].text!
                    print(self.PhoneNumbers)
                    
// Update Hard Files for Phone Number and name of contacts
                    
                    
                    self.updateFiles()
                    
                    
                    
                    
                    
                    self.tableView.reloadRows(at: [indexPath], with: .fade)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: false)
            })
            
            let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
                //self.cars.remove(at: indexPath.row)
               
                self.cars.remove(at: indexPath.row)
                self.PhoneNumbers.remove(at: indexPath.row)
//                if indexPath.row == 1{
//                    self.cars[indexPath.row] = "<< Contact 1 Slide Left"
//                    self.PhoneNumbers[indexPath.row] = "Error"
//
//                }else if indexPath.row == 2{
//                    self.cars[indexPath.row] = "<< Contact 2 Slide Left"
//                    self.PhoneNumbers[indexPath.row] = "Error"
//                }else if indexPath.row == 3{
//                    self.cars[indexPath.row] = "<< Contact 3 Slide Left"
//                    self.PhoneNumbers[indexPath.row] = "Error"
//                }else if indexPath.row == 4{
//                    self.cars[indexPath.row] = "<< Contact 4 Slide Left"
//                    self.PhoneNumbers[indexPath.row] = "Error"
//                }
                
                tableView.reloadData()
                self.updateFiles()
            })
            
           
            return [deleteAction, editAction]
        }
        
//        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
//            let alert = UIAlertController(title: "", message: "Edit Contact", preferredStyle: .alert)
//            alert.addTextField(configurationHandler: { (textField) in
//                textField.placeholder = "Enter Contacts Name"
//            })
//            alert.addTextField(configurationHandler: { (textField2) in
//                textField2.placeholder = "Enter Contact Phone Number"
//            })
//            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
//                self.cars[indexPath.row] = alert.textFields!.first!.text!
//                self.PhoneNumbers[indexPath.row] = alert.textFields![1].text!
//                print(self.PhoneNumbers)
//
//                self.tableView.reloadRows(at: [indexPath], with: .fade)
//            }))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(alert, animated: false)
//        })
//
//        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
//            self.cars.remove(at: indexPath.row)
//            tableView.reloadData()
//        })
//
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        defaults.set(cars, forKey: usersData.userContactsNames)
        defaults.set(PhoneNumbers, forKey: usersData.userContactsNumbers)
        
        print("view closed ")
        
    }
    
    func updateFiles () -> Void{
        
        print("updating files")
        let defaults = UserDefaults.standard
        
        
        
        defaults.set(cars, forKey: usersData.userContactsNames)
        defaults.set(PhoneNumbers, forKey: usersData.userContactsNumbers)
        
        
//
//        //Name File
//        let fileName = "EmergencyContactsID"
//        let dir = try? FileManager.default.url(for: .documentDirectory,
//                                               in: .userDomainMask, appropriateFor: nil, create: true)
//
//        // If the directory was found, we write a file to it and read it back
//        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
//
//                        // Write to the file named Test
//                        //let outString = "Emergency 911,<< Contact 1 Slide Left,<< Contact 2 Slide Left,<< Contact 3 Slide Left,<< Contact 4 Slide Left"
//                let outString = cars.joined(separator: ",")
//                        do {
//                            try outString.write(to: fileURL, atomically: true, encoding: .utf8)
//                        } catch {
//                            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
//                        }
//
////            // Then reading it back from the file
////            var inString = ""
////            do {
////                inString = try String(contentsOf: fileURL)
////            } catch {
////                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
////            }
////            print("ID's: \(inString)")
////
////            cars = inString.components(separatedBy: ",")
////
////            print(cars)
//        }
//
//
//        //Number file
//
//        let fileNameNum = "EmergencyContactsNumbers"
//        let dirNum = try? FileManager.default.url(for: .documentDirectory,
//                                                  in: .userDomainMask, appropriateFor: nil, create: true)
//
//        // If the directory was found, we write a file to it and read it back
//        if let fileURL = dirNum?.appendingPathComponent(fileNameNum).appendingPathExtension("txt") {
//
//                                    // Write to the file named Test
//                                   // let outString = "7857669375,Error,Error,Error,Error"
//                          let outString = PhoneNumbers.joined(separator: ",")
//                                    do {
//                                        try outString.write(to: fileURL, atomically: true, encoding: .utf8)
//                                    } catch {
//                                        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
//                                    }
//
//            // Then reading it back from the file
//            var inString = ""
//            do {
//                inString = try String(contentsOf: fileURL)
//            } catch {
//                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
//            }
//            print("Numbers's: \(inString)")
//
//
//            PhoneNumbers = inString.components(separatedBy: ",")
//
//            print(PhoneNumbers)
//
            
            
            
       // }
        
    }
    
   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//Add New Contacts
    @IBAction func addNewContactPush(_ sender: Any) {
       
        var newName = ""
        var newNumber = ""
        
        
        
        let alert = UIAlertController(title: "", message: "Add Contact", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter Contacts Name"
        })
        alert.addTextField(configurationHandler: { (textField2) in
            textField2.placeholder = "Enter Contact Phone Number"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            
            case .cancel:
                print("cancel")
                
                
            case .default:
                
                self.cars.append(alert.textFields!.first!.text!)
                self.PhoneNumbers.append(alert.textFields![1].text!)
                self.tableView.reloadData()
                
            case .destructive: break
                
            }}))
        present(alert, animated: true)
      
        
    }
    
    
    
    

}
