//
//  ViewController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/9/18.
//  Updated by Zachary Denny on 
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
import UserNotifications






class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        let defaults = UserDefaults.standard
//        let token = defaults.string(forKey: "teams")
//
//        print(token)
//
//        var dataSecond: MemeModel = [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]
//
//        archiveMovie(memeModel: dataSecond)
//        let testData = MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")
//        archiveMovie(memeModel: testData)
        
        //asks for the permistion to use notifications
        initNotificationSetupCheck()
        
        
       
        
////Used for saving
       let encodedData = try? JSONEncoder().encode(data)
//        print(encodedData?.description)
//
//        // Setting
//
//        let defaults = UserDefaults.standard
//        defaults.set(encodedData, forKey: usersData.usersDoc)
//
        
//Used for retreaving
        // Getting
        
        //let defaults = UserDefaults.standard
//        if let stringOne = defaults.data(forKey: usersData.usersDoc) {
//            print(stringOne) // Some String Value
        
            
            
//            do {
//
//                let myStruct = try JSONDecoder().decode(Array<MemeModel>.self, from: stringOne) // do your decoding here
//                //print(myStruct)
//
//                //setting var data to the decoded stuct that was pulled
//                data = myStruct
//                print("data was changed to myStruct")
//
//
//
//
//
//            } catch {
//                print(error) // any decoding error will be printed here!
//                print("did not make it")
//            }
        
            
            
            
            
            
            
        
       // }
       
        
        
        
//From here!!!!!!!!!!!
        let randomFilename = UUID().uuidString
        let fullPath = getDocumentsDirectory().appendingPathComponent(randomFilename)
        let url = URL(fileURLWithPath: "Users/appledeveloper/Documents/Projects/Apps/My Driving Assistant/Edit/My Driving Assistant/My Driving Assistant/testSave.txt")

            if #available(iOS 11.0, *) {
                 do {
                    let dataTest = try NSKeyedArchiver.archivedData(withRootObject: encodedData, requiringSecureCoding: false)
                    try dataTest.write(to: url)
                    print("Could write to file")

                    do {
                        print("do happened")
                         let loadedStrings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataTest) as? [MemeModel]
                            print("if happened")
                            let savedArray = loadedStrings
                        print(savedArray)
                            print("it happened")

                    } catch {
                        print("Couldn't read file.")
                    }


                 } catch {
                    print("Couldn't write file")
                }




//                let encodedData = try? JSONEncoder().encode(data)
//                print(encodedData?.description)

             print("made it")




                do {

//                    let myStruct = try JSONDecoder().decode(Array<MemeModel>.self, from: encodedData!) // do your decoding here
//                    //print(myStruct)
//
//                    //setting var data to the decoded stuct that was pulled
//                    data = myStruct
//                    print("data was changed to myStruct")


                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {


//                        let fileURL = dir.appendingPathComponent("Users/appledeveloper/Documents/Projects/Apps/My Driving Assistant/Edit/My Driving Assistant/My Driving Assistant/testSave.txt")
//
                        //writing
                        do {

                            let dataTest = try NSKeyedArchiver.archivedData(withRootObject: encodedData, requiringSecureCoding: false)
                            try dataTest.write(to: url)
                            //try myStruct.description.write(to: fileURL, atomically: false, encoding: .utf8)
                        }
                        catch {print(error)}


                    }

                } catch {
                    print(error) // any decoding error will be printed here!
                    print("did not make it")
                }
        
//To HERE!!!!!!!!!!!
                
                
                
                
//                do {
//                    if let loadedStrings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataTest) as? [String] {
//                        var savedArray = loadedStrings
                    
    }
            
//            } else {
//                // Fallback on earlier versions
//            }
        


        
//        guard let gitUrl = URL(string: "Users/appledeveloper/Documents/Projects/Apps/My Driving Assistant/Edit/My Driving Assistant/My Driving Assistant/testSave.txt") else { return }
//        URLSession.shared.dataTask(with: gitUrl) { (data, response
//            , error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let gitData = try decoder.decode(MemeModel.self, from: data)
//                print(gitData.name)
//
//          } catch let err {
//               print("Err", err)
//           }
//            }.resume()
//
//
       
        
        
       
        
        
        
        
//        let testModelData: [MemeModel] = MemeModel(ViewController.unarchive())
//print(ViewController.unarchive())
        


    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func archiveMovie(memeModel: MemeModel) {
        let MemeModelClassObject = MemeModelClass()
        MemeModelClassObject.memeModel = memeModel
        NSKeyedArchiver.archiveRootObject(MemeModelClassObject, toFile: "testSave.txt")
        print("THIS!!!!!!!!!")
        print(MemeModelClassObject.description)
    }
    static func unarchive() -> MemeModel {
        let MemeModelClassObject = NSKeyedUnarchiver.unarchiveObject(withFile: "Users/appledeveloper/Documents/Projects/Apps/My Driving Assistant/Edit/My Driving Assistant/My Driving Assistant/testSave.txt") as! MemeModelClass
        let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
        return MemeModelClassObject.memeModel ?? MemeModel(image: imageData! as NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")
    }

    
//Emergency Selected: Ask if correct then call 911
    @IBAction func EmergencySelected(_ sender: Any) {
        
        let alert = UIAlertController(title: "Emergency Call", message: "Are you sure you want to Call 911?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
            print("Calling 911")
            
            if let url = URL(string: "tel://\("7857669375")") {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url as URL)
                }
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
        
    }
    
    
    
//Ask for permistion to display notifications
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }
    
    
    


}

