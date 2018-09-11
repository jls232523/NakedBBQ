//
//  RegisterViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/4/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
var userCheck = 0;

class RegisterViewController : UIViewController{
    override func viewDidLoad() {
        hideKeyboard()
        userCheck = 0
    }
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!

    @IBAction func regButtonClicked(_ sender: Any) {
        Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
            print(user?.user.email!)
            if let u = user{
                self.displayMyAlertMessage(userMessage: "Registration Completed Succesfully")
            }
            else{
                self.displayMyAlertMessage(userMessage: "Credentials Not Valid")
            }
        }
       
    }
    @IBOutlet weak var registerButton: UIButton!
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert )
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
