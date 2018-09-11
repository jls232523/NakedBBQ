//
//  loginViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/2/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

var userChecker = 0;
var currUser : String?
var ref: DatabaseReference!
class loginViewController: UIViewController,UITextFieldDelegate {
    let userName = "John"
    let passCode = "123"
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.hideKeyboard()
        userChecker = 0
        password.text = ""
        userNameTF.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func registerClicked(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: self)
    }
    
    @IBAction func checkCredentials(_ sender: Any) {
        var pass: String = password.text!
        var user : String = userNameTF.text!
        if user.isEmpty || pass.isEmpty {
            displayMyAlertMessage(userMessage: "All fields must be entered")
        }
        Auth.auth().signIn(withEmail: userNameTF.text!, password: password.text!) { (user, error) in
            if let u = user{
                self.password.text = ""
                self.userNameTF.text = ""
                self.performSegue(withIdentifier: "nextView", sender: self)
            }
            else{
                self.displayMyAlertMessage(userMessage: "Wrong Credentials")
            }
        }
       /* let matchedUsers = try! Realm().objects(User.self)
        for thisUser in matchedUsers {
            if user == thisUser.userName && pass == thisUser.userPassword{
                userChecker += 1
                currUser = userNameTF.text
                print(currUser!)
                //userNameTF.text = ""
                //password.text = ""
        }
        if userChecker == 0 {
            displayMyAlertMessage(userMessage: "Wrong Password")
            userChecker = 0
        }
    }*/
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("here")
        self.view.endEditing(true)
        return false
    }
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert )
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
}
}
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
