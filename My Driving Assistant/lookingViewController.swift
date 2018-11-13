//
//  lookingViewController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/12/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import Foundation
import UIKit

class lookingViewController: UIViewController {
    @IBOutlet weak var docImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var docInfoView: UITextView!
    
    
   // var indexVal: Int?
    let docData = DocumentsController().data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//populate the looking view
        print(DocumentsController().gettouchIndex())
        docImageView.image = docData[DocumentsController().gettouchIndex()].image
        titleLb.text = "     " + docData[DocumentsController().gettouchIndex()].name
        
        
        
        
    }
    
    
    
    
    






//End
}

