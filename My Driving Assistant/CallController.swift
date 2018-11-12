//
//  CallController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit

class CallController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

