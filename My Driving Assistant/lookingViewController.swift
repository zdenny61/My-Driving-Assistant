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
    var docData = data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
//populate the looking view
        print(DocumentsController().gettouchIndex())
        docImageView.image = UIImage(data: docData[DocumentsController().gettouchIndex()].image as Data)
        titleLb.text = "     " + docData[DocumentsController().gettouchIndex()].name
        
        
       // print(data[1].name)
        
    }
    
    
    @IBAction func pushEdit(_ sender: Any) {
        
//creat and desplay alertview to get users changes 
        let alertController = UIAlertController(title: "Edit Document", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Document Type"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let docNameTextField = alertController.textFields![0] as UITextField
            let nameTextField = alertController.textFields![1] as UITextField
            let expDateTextField = alertController.textFields![2] as UITextField
            
            
//set alert box inputs into the array
            print(docNameTextField.text?.description as Any)
            //set document type into array
            data[touchIndex].name  = docNameTextField.text!
            print(self.docData[DocumentsController().gettouchIndex()].name)
            print(nameTextField.text?.description as Any)
            data[touchIndex].nameOnDoc  = nameTextField.text!
            print(expDateTextField.text?.description as Any)
            data[touchIndex].expDate  = expDateTextField.text!
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name On Document"
            
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Experation Date"
            textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
            
       
        
    }
    
    
    






//End
}

