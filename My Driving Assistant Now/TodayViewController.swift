//
//  TodayViewController.swift
//  My Driving Assistant Now
//
//  Created by Zachary Denny on 11/29/18.
//  Updated by Zachary Denny on 12/29/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
//Used to make a emergency call on today view
    @IBAction func todayEmergencyButton(_ sender: Any) {
      
        
        let phoneNumber: String = "7857669375"
        let phoneNumberString: String = "tel:\(phoneNumber)"
        let url: NSURL = NSURL(string: phoneNumberString)!
        
        self.extensionContext!.open(url as URL, completionHandler: { (Bool) in
        })
        
        
    }
    
    
    
    
    
    
}
