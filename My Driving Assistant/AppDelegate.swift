//
//  AppDelegate.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/9/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import CoreData


//let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
//var data: [MemeModel] = [] //= [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                        // MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                       //  MemeModel(image:  #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
//    var data: [MemeModel] = [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//                             MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//                             MemeModel(image:  #imageLiteral(resourceName: "DL-Logo.png").pngData()! as NSData, name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
//        data = [MemeModel(image: imageData! as NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//        MemeModel(image: imageData! as NSData, name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//        MemeModel(image: imageData! as NSData, name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]
        
        
//        let dataDefault: [MemeModel] = [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//                                 MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
//                                 MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]
//        
//        let myData = NSKeyedArchiver.archivedData(withRootObject: dataDefault)
//        UserDefaults.standard.set(myData, forKey: "userJson")
//        
//        let recovedUserJsonData = UserDefaults.standard.object(forKey: "userJson")
//        let recovedUserJson = NSKeyedUnarchiver.unarchiveObject(with: recovedUserJsonData as! Data)
//        
//        print(recovedUserJson)
//
//        //Encode users doc data
        
//Used for retreaving
        // Getting
        
        
        
        
        
        let defaults = UserDefaults.standard
        if let stringOne = defaults.data(forKey: usersData.usersDoc) {
            print(stringOne) // Some String Value



            do {

                let myStruct = try JSONDecoder().decode(Array<MemeModel>.self, from: stringOne) // do your decoding here
                //print(myStruct)

                //setting var data to the decoded stuct that was pulled
                data = myStruct
                print("data was changed to myStruct")





            } catch {
                print(error) // any decoding error will be printed here!
                print("did not make it")
            }




       }
       
//        if let stringTwo = defaults.string(forKey: usersData.userFirstTime){
//            //do first time stuff here
//            print("Made it here")
//            if stringTwo == "NO"{
//                //This is not the first time the app is opened
//                 print("Not first time running!")
//
//                if let stringOne = defaults.data(forKey: usersData.usersDoc) {
//                    print(stringOne) // Some String Value
//
//
//
//
//
//                    do {
//
//                        let myStruct = try JSONDecoder().decode(Array<MemeModel>.self, from: stringOne) // do your decoding here
//                        //print(myStruct)
//
//                        //setting var data to the decoded stuct that was pulled
//                        data = myStruct
//                        print("data was changed to myStruct")
//
//
//
//
//
//                    } catch {
//                        print(error) // any decoding error will be printed here!
//                        print("did not make it")
//                    }
//
//
//
//
//
//
//
//
//                }
//
//
//
//
//            }else{
//                //This is the first time the app is opened
//                print("First time running!")
//
//
//
//
//
//
//
//
//                defaults.set("NO", forKey: usersData.usersDoc)
//                print("First time running changed to NO")
//            }
//
//
//
//
//        }
//
        
//
////Save the users doc data into core data
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let userEntity = NSEntityDescription.entity(forEntityName: "DocumentsStorage", in: managedContext)!
//
//        let DocumentsStorage = NSManagedObject(entity: userEntity, insertInto: managedContext)
//        do{
//            try DocumentsStorage.setValue(encodedData?.description, forKeyPath: "storedData")
//        }catch{
//
//        }
        
//        //Save data into model
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }

//        //retreaving it
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DocumentsStorage")
//        //request.predicate = NSPredicate(format: "age = %@", "12")
//        request.returnsObjectsAsFaults = false
//        do {
//            let result = try managedContext.fetch(request)
//            for data in result as! [NSManagedObject] {
//                print((data.value(forKey: "storedData") as! String).description)
//            }
//
//        } catch {
//
//            print("Failed")
//        }
        
        
        
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "My_Driving_Assistant")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

