//
//  MemeModelClass.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/13/18.
//  Updated by Zachary Denny on 11/16/18.
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
