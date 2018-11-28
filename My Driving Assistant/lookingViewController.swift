//
//  lookingViewController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 11/12/18.
//  Updated by Zachary Denny on 12/27/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import Foundation
import UIKit

class lookingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

//Views controler outlets
    @IBOutlet weak var docImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var docInfoView: UITextView!
    @IBOutlet weak var tapToEditLB: UILabel!
    
//Local Ver
    var imagePickerController : UIImagePickerController!
    var docData = data
    var inEdit = false //To know if the view is in edit mode
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
//populate the looking view
        print(DocumentsController().gettouchIndex())
        docImageView.image = UIImage(data: docData[DocumentsController().gettouchIndex()].image as Data)
        titleLb.text = "     " + docData[DocumentsController().gettouchIndex()].name
        
        docInfoView.text = "Name On Document: " + docData[DocumentsController().gettouchIndex()].nameOnDoc + "\n" + "\n" + "Expiration Date Of Document: " + docData[DocumentsController().gettouchIndex()].expDate
        
        
    }
    
    
//Pussed edit button
    @IBAction func pushEdit(_ sender: Any) {
        
       //set edit bool to true so mode is switched to editing
        inEdit = true
        
       //Present the camera to take picture
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: {
            
            
            self.editAlert()
       
            
            
            
            
            
        })
        
        
        print("im here!")
        
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
            self.docInfoView.text = "Name On Document: " + nameTextField.text! + "\n" + "\n" + "Expiration Date Of Document: " + expDateTextField.text!
            
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
                self.present(vc, animated: true, completion: {
                    
                })
                
                
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
        
        self.present(alertController, animated: true, completion: {
           
        })
            
      
        
        
    }
 
//Tapped on photo
    @IBAction func changePhotoPush(_ sender: Any) {
   
        
     
    
    }
    
//Function to get image from users camera
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)

        
        //setting var takenImage to the value of UIImage that was taken by the user
        guard let takenImage = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }

        data[touchIndex].image = takenImage.pngData() as! NSData

        
        //Set UIImageView to the taken picture
        docImageView.image = takenImage
        
       
        
        
    }
    
//Called whenever the view appears (used for editing process to display edit alert view)
    override func viewDidAppear(_ animated: Bool) {
        print("Ended")
        
//Check if it should be editing the data
        if inEdit == true{
            
            
//creat and display alertview to get users changes
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
                

                //Make completeAlert to notif. that save was succesful and to update the UIView text fields
                let completeAlert = UIAlertController(title: "Saved!", message: "Your document has been saved", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
                    
                    
                    self.docInfoView.text = "Name On Document: " + nameTextField.text! + "\n" + "\n" + "Expiration Date Of Document: " + expDateTextField.text!
                    
                })
                
                
                completeAlert.addAction(okAction)
                
                self.present(completeAlert,animated: true,completion: nil)
                
                
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
           
            
            self.present(alertController, animated: true, completion: {

            })
            
           
        
            
            
            //set edit back to false so edit alert does not come up when not suppose to
            inEdit = false
            
        }
        

        
    }
    
    
    
//Easy function to call the edit alert (not currently being used)
    func editAlert(){
        
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
            
            self.docInfoView.text = "Name On Document: " + nameTextField.text! + "\n" + "\n" + "Expiration Date Of Document: " + expDateTextField.text!
            
            //Save the data
            //Used for saving
            //encode data that is currently in var data
            let encodedData = try? JSONEncoder().encode(data)
            
            
            // Setting and saving userdefaults for the usersDoc data
            let defaults = UserDefaults.standard
            defaults.set(encodedData, forKey: usersData.usersDoc)
            
             let completeAlert = UIAlertController(title: "Saved!", message: "Your document has been saved", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            
                
            })
            
            
            completeAlert.addAction(okAction)
            
            self.present(completeAlert,animated: true,completion: nil)
            
            
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

