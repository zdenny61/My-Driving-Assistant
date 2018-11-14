//
//  MemeModel.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/13/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import Foundation

typealias Codable = Decodable & Encodable
struct MemeModel: Codable {
    var image: NSData
    var name: String
    var nameOnDoc: String
    var expDate: String
    
    private enum CodingKeys: String, CodingKey {
        case image = "image"
        case name = "name"
        case nameOnDoc = "nameOnDoc"
        case expDate = "expDate"
        
        
       
        
    }
    
    init(image: NSData, name: String, nameOnDoc: String,expDate: String ) {
        self.image = image
        self.name = name
        self.nameOnDoc = nameOnDoc
        self.expDate = expDate
        
    }
    
     init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decode(Data.self, forKey: .image) as NSData
        name = try values.decode(String.self, forKey: .name)
        nameOnDoc = try values.decode(String.self, forKey: .nameOnDoc)
        expDate = try values.decode(String.self, forKey: .expDate)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image as Data, forKey: .image)
        try container.encode(name, forKey: .name)
        try container.encode(nameOnDoc, forKey: .nameOnDoc)
        try container.encode(expDate, forKey: .expDate)
        
    }
    
    
    
    
}
