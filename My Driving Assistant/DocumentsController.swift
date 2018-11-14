//
//  DocumentsController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import LocalAuthentication

var touchIndex = 0
let imageData = #imageLiteral(resourceName: "DL-Logo.png").pngData()
var data: [MemeModel] = [MemeModel(image: imageData as! NSData, name: "ID", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                         MemeModel(image: imageData as! NSData, name: "Registration", nameOnDoc: "Zachary Denny", expDate: "01/27/1997"),
                         MemeModel(image: imageData as! NSData, name: "Insurence", nameOnDoc: "Zachary Denny", expDate: "01/27/1997")]


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
        
        
        //blur and authentication lb for securety method for doc viewing **set to false for production ver.
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
    
   
    
    
    
    
    
    
    
    
    
    
    
    

//End
}
