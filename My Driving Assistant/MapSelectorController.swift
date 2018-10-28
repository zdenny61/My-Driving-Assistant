//
//  MapSelectorController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/25/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit

var searchKey = "error"




class MapSelectorController: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
//Setters

    //set function for search sting
    public func setSearchString(passKey:String) -> Void{
        searchKey = passKey
    }
    
    
//Getters
    
    //get function for search string
    public func getSearchString() -> String {
        if searchKey == "error"{
          exit(0)
        }
        return searchKey
    }
    
    
    
    
}

