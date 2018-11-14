//
//  MemeModelClass.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/13/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import Foundation
import UIKit

class MemeModelClass: NSObject, NSCoding {
    var memeModel: MemeModel?
    func encode(with aCoder: NSCoder) {
        if let memeModel = memeModel {
            aCoder.encode(memeModel.image, forKey: "image")
            aCoder.encode(memeModel.name, forKey: "name")
            aCoder.encode(memeModel.expDate, forKey: "expDocDate")
            aCoder.encode(memeModel.nameOnDoc, forKey: "nameOnDoc")
        }
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        if  let image = aDecoder.decodeObject(forKey: "image") as? NSString,
            let name = aDecoder.decodeObject(forKey: "name") as? String,
            let expDocDate = aDecoder.decodeObject(forKey: "expDocDate") as? String,
            let nameOnDoc = aDecoder.decodeObject(forKey: "nameOnDoc") as? String
            {
                memeModel = MemeModel(image: NSKeyedArchiver.archivedData(withRootObject: image) as NSData, name: name, nameOnDoc: nameOnDoc, expDate: expDocDate)
        }
    }
   
    
    
}
