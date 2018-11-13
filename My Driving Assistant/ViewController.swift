//
//  ViewController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/9/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        
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
    
    
    


}

