//
//  MemeCell.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/13/18.
//  Updated by Zachary Denny on 12/29/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit

class MemeCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: MemeModel) {
        
//Setting UI
        //For rounding corners
        image.layer.cornerRadius = 5.0
        image.layer.masksToBounds = true
        //Set cell Views UIImage and Lable
        image.image = UIImage(data: model.image as Data)
        name.text = model.name
    }
}
