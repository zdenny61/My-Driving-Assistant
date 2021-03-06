//
//  MapSelectorController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/25/18.
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
    
    
    
//Button Setters
    
    //Oil Change
    @IBAction func OilChangeSelect(_ sender: Any) {
        setSearchString(passKey: "Oil Change")
        print("Search key is now Oil Change")
    }
    
    //Tire Repair
    @IBAction func TireRepairSelect(_ sender: Any) {
        setSearchString(passKey: "Tire")
        print("Search key is now Tire")
    }
    
    //Towing Center
    @IBAction func TowingCenterSelect(_ sender: Any) {
        setSearchString(passKey: "Towing")
        print("Search key is now Towing")
    }
    
    //Collision Repair
    @IBAction func CollisionRepairSelect(_ sender: Any) {
        setSearchString(passKey: "Collision")
        print("Search key is now Collision")
    }
    
    //AAA Center
    @IBAction func AAACenterSelect(_ sender: Any) {
        setSearchString(passKey: "AAA")
        print("Search key is now AAA")
        
    }
    
    
    
    
    
    
    
    
}

