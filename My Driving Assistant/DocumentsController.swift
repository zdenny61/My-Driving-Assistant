//
//  DocumentsController.swift
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
import LocalAuthentication
import UserNotifications

var touchIndex = 0
let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
var data: [MemeModel] = [MemeModel(image: imageData! as NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                        MemeModel(image: imageData! as NSData, name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                        MemeModel(image: imageData! as NSData, name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]


class DocumentsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //Docs Array
//    var data: [MemeModel] = [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "ID"),
//                             MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Registration"),
//                             MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Insurence")]

    
   //Collection View
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! MemeCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
  
   
    

    
    
    //Blur View
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    //Must Authenticat Lable
    @IBOutlet weak var AuthenticatLB: UILabel!
    
    
    // let store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "MemeCell", bundle: nil), forCellWithReuseIdentifier: "MemeCell")
        
//Authenticat with FaceID/Touch ID
        //blur and authentication lb for securety method for doc viewing **set to false for production ver.
        blurView.isHidden = false
        AuthenticatLB.isHidden = false
        
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Face/Touch ID (Biometric Authntication) for accessing secured documents."
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                           print("Awesome!!... User authenticated successfully")
                            self.blurView.isHidden = true
                            self.AuthenticatLB.isHidden = true
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                           print("Sorry!!... User did not authenticate successfully")
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                print( "Sorry!!.. Could not evaluate policy.")
            }
        } else {
            // Fallback on earlier versions
            
            print("Ooops!!.. This feature is not supported.")
        }
        
        
      //To add new document data
        //data.append(MemeModel(image: imageData as! NSData, name: "Test Idea", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"))
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.item)
        
        //set touchIndex to touched index of collection cell
        settouchIndex(passIndex: Int(indexPath.item))
        
//Push to lookingView
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "lookingView")
            
            else {
            print("View controller lookingView not found")
            return
        }
        navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true, completion: nil)
        
    }
    
        
    
    // setters/getters for touchIndex
    func gettouchIndex() -> Int {
        return touchIndex
    }
    func settouchIndex(passIndex: Int) {
        touchIndex = passIndex
    }
    
   
    
    @IBAction func addNewDocumentPush(_ sender: Any) {
   
    
    
    
    
        //To add new document data
        
    
//        var newName = ""
//        var newNumber = ""
        
        
        
        let alert = UIAlertController(title: "", message: "Add Document", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter Type Of Document"
        })
        alert.addTextField(configurationHandler: { (textField2) in
            textField2.placeholder = "Enter Name On Document"
        })
        alert.addTextField(configurationHandler: { (textField3) in
            textField3.placeholder = "Enter Expiration Date MM/DD/YYYY"
        })
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                
            case .cancel:
                print("cancel")
                
                
            case .default:
                
                
                
                data.append(MemeModel(image: imageData! as NSData, name: alert.textFields!.first!.text!, nameOnDoc: alert.textFields![1].text!, expDate: alert.textFields![2].text!))
                
                
                
//Start Demo Code!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//Make a new Expire Notification
 //For DEMO!!
//                let notification = UNMutableNotificationContent()
//                notification.title = "Your document is about to expire!"
//                notification.subtitle = alert.textFields!.first!.text! + " is about to expire soon"
//                notification.body = "Click here and check out the date before it's to late!"
//
//                let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
//                let request = UNNotificationRequest(identifier: alert.textFields!.first!.text!, content: notification, trigger: notificationTrigger)
//
//                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                //startIndex
//                print( alert.textFields![2].text!.index(alert.textFields![2].text!.startIndex, offsetBy: 6) )
//                //endIndex
//                print((alert.textFields![2].text!).Index(encodedOffset: 10))
//                //final number
//                print(alert.textFields![2].text![( alert.textFields![2].text!.index(alert.textFields![2].text!.startIndex, offsetBy: 0) )..<(alert.textFields![2].text!.index(( alert.textFields![2].text!.index(alert.textFields![2].text!.startIndex, offsetBy: 0) ), offsetBy: 1))])
//End Demo Code!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                
                
                
                //Month
                print(Int(alert.textFields![2].text!.split(separator: "/")[0]) ?? 00)
                //Day
                print(Int(alert.textFields![2].text!.split(separator: "/")[1]) ?? 00 )
                //Year
                print(Int(alert.textFields![2].text!.split(separator: "/")[2]) ?? 00 )
                
//Perform the expire calculations and set variables
                var Month = (Int(alert.textFields![2].text!.split(separator: "/")[0]) ?? 00)
                var Day = (Int(alert.textFields![2].text!.split(separator: "/")[1]) ?? 00 )
                var Year = (Int(alert.textFields![2].text!.split(separator: "/")[2]) ?? 00 )
                
                //Do calculations for the expire date minus 7 days
                if ((Day - 7 ) < 0) {
                    
                    //If Month is Jan, then subtract one from year and make month december else subtract 1 month
                    if (Month == 1){
                        Year -= 1
                        Month = 12
                    }else{
                        Month -= 1
                    }
                    
                    //Check/make days - 7 to go with last month
                    if Month == 2{
                        //Feb.
                        Day = 28 - (7 - Day)
                    }else if Month == 4{
                        //April
                         Day = 30 - (7 - Day)
                    }else if Month == 6{
                        //June
                        Day = 30 - (7 - Day)
                    }else if Month == 9{
                        //Sep.
                        Day = 30 - (7 - Day)
                    }else if Month == 11{
                        //Nov.
                        Day = 30 - (7 - Day)
                    }else {
                        //Jan/March/May/July/Aug/Oct/Dec
                        Day = 31 - (7 - Day)
                    }
                    
                    
                    
                    
                    
                }else{
                    
                    //If current day is at least 7 days into month, 7 days will be subtracted normally
                    Day -= 7
                }
                
                print("")
                print("Expire Minus 7 Days:")
                print(Month)
                print(Day)
                print(Year)
                
                
                
 //Make a new Expire Notification
 //For REAL
                let calendar = Calendar.current
                //set the date and time to display (8:00AM the notification goes off)
                let components = DateComponents(year: Year, month: Month, day: Day, hour: 08, minute: 00)
                
                
                let date = calendar.date(from: components)
                let comp2 = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: date!)
                let trigger = UNCalendarNotificationTrigger(dateMatching: comp2, repeats: true)
                //Information that will be displayed in the notification
                let content = UNMutableNotificationContent()
                content.title = "Your document is about to expire in 7 days!"
                content.subtitle = alert.textFields!.first!.text! + " is about to expire soon"
                content.body = "Click here and check out the expiration date before it's to late!"
                
                let request = UNNotificationRequest(
                    identifier: alert.textFields!.first!.text!,
                    content: content,
                    trigger: trigger
                )
                
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        //handle error
                        print("Error")
                    } else {
                         print("Notification set up successfully")
                    }
                })
                
                
                
                
                
                
                
                let encodedData = try? JSONEncoder().encode(data)
                
                
                // Setting and saving userdefaults for the usersDoc data
                let defaults = UserDefaults.standard
                defaults.set(encodedData, forKey: usersData.usersDoc)
                
                
                self.collectionView.reloadData()
                
                //Make completeAlert to notif. that save was succesful and to let user know how to change pic
                let completeAlert = UIAlertController(title: "Saved!", message: "Your document has been saved. If you want to add a picture to your saved document, just add it by clicking on the docment and then selecting edit at the top.", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
                    
                    
                    
                    
                })
                
                
                completeAlert.addAction(okAction)
                
                self.present(completeAlert,animated: true,completion: nil)
                
                
                
                
            case .destructive: break
                
            }}))
        present(alert, animated: true)
        
    
    
    }
    
    
    
    
    
    
    
    
    
    
    

//End
}
