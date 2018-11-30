//
//  MapSelectorController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/25/18.
//  Updated by Zachary Denny on 
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

