//
//  DocumentsController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import LocalAuthentication



class DocumentsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //Docs Array
    let data: [MemeModel] = [MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "ID"),
                             MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Registration"),
                             MemeModel(image: #imageLiteral(resourceName: "DL-Logo.png"), name: "Insurence")]
  
    
   
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! MemeCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
  
   
    
//    override init(collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(layout)
//        self.collectionView?.dataSource = self
//    }
    

    
    
    //Blur View
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    //Must Authenticat Lable
    @IBOutlet weak var AuthenticatLB: UILabel!
    
    //Collection View
    @IBOutlet weak var docCollectionView: UICollectionView!
    
    // let store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // docCollectionView.dataSource = self
        //docCollectionView.delegate = self
        //docCollectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "MemeCell", bundle: nil), forCellWithReuseIdentifier: "MemeCell")
        
        
        
        blurView.isHidden = false
        AuthenticatLB.isHidden = false
        
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
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
        
        
        
        //Load Documents
        
//        store.getBookImages {
//            self.docCollectionView.reloadSections(IndexSet(integer: 0))
//        }
//        
//       
        
        
    }
    
   
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return store.audiobooks.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
//
//        let book = store.audiobooks[indexPath.row]
//
//        cell.displayContent(image: store.images[indexPath.row], title: book.name)
//
//        return cell
//
//    }
    
    
}

