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
        
        docInfoView.text = "Name On Document: " + docData[DocumentsController().gettouchIndex()].nameOnDoc + "\n" + "\n" + "Expiration Date Of Document: " + docData[DocumentsController().gettouchIndex()].expDate
        
    
        
       // print(data[1].name)
        
    }
    
    
    @IBAction func pushEdit(_ sender: Any) {
        
//creat and desplay alertview to get users changes 
        let alertController = UIAlertController(title: "Edit Document", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Document Type"
        }
//Cancel Action
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
//Save Action
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let docNameTextField = alertController.textFields![0] as UITextField
            let nameTextField = alertController.textFields![1] as UITextField
            let expDateTextField = alertController.textFields![2] as UITextField
            
            
//set alert box inputs into the array
            print(docNameTextField.text?.description as Any)
            //set document type into array
//set doc type name
            data[touchIndex].name  = docNameTextField.text!
            print(self.docData[DocumentsController().gettouchIndex()].name)
            self.titleLb.text = docNameTextField.text!
//set doc name on doc
            print(nameTextField.text?.description as Any)
            data[touchIndex].nameOnDoc  = nameTextField.text!
//set doc experation date
            print(expDateTextField.text?.description as Any)
            data[touchIndex].expDate  = expDateTextField.text!
            
//Save the data
  //Used for saving
            //encode data that is currently in var data
            let encodedData = try? JSONEncoder().encode(data)
            
            
            // Setting and saving userdefaults for the usersDoc data
            let defaults = UserDefaults.standard
            defaults.set(encodedData, forKey: usersData.usersDoc)
            
            
        })
//Delete action
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { alert -> Void in
            
            data.remove(at: touchIndex)
            
//Save the data
            //Used for saving
            //encode data that is currently in var data
            let encodedData = try? JSONEncoder().encode(data)
            
            
            // Setting and saving userdefaults for the usersDoc data
            let defaults = UserDefaults.standard
            defaults.set(encodedData, forKey: usersData.usersDoc)
            
            
           //Let user know data was deleted and then go to document controller
            let deletedAlertController = UIAlertController(title: "Document Deleted", message: "Your doument has been deleted successfully!", preferredStyle: UIAlertController.Style.alert)
            //Ok Action for delete alert
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
                
                
                //Push to lookingView
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "documentView")
                    
                    else {
                        print("View controller lookingView not found")
                        return
                }
                self.navigationController?.pushViewController(vc, animated: true)
                self.present(vc, animated: true, completion: nil)
                
                
            })
            
            deletedAlertController.addAction(okAction)
            
            self.present(deletedAlertController,animated: true,completion: nil)
            
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
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true, completion: nil)
            
       
        
    }
    
    
    






//End
}

