//
//  InputViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/3/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
var briskNum = ["Raw":0.0,"AM":0.0,"Retherm":0.0,"PM":0.0]
var porkNum = ["Raw":0.0,"AM":0.0,"Retherm":0.0,"PM":0.0]
var ribsNum = ["Racks Raw":0.0,"Racks Retherm":0.0,"Racks Left":0.0]
var turkeyNum = ["Raw":0.0,"AM":0.0,"Retherm":0.0,"PM":0.0]
var chickenNum = ["Batch Made":0.0]
var beansNum = ["Batch Made":0.0]
var globValue : Any?
class InputViewController : UIViewController,UITextFieldDelegate{
    @IBOutlet weak var meatCat: UILabel!
    @IBOutlet weak var amountField: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
        self.amountField.delegate = self
        addDoneCancelToolbar()
        if whichArray == "1" {
            meatCat.text = optionsOne[posArray]
        }
        if whichArray == "2" {
            meatCat.text = optionsTwo[posArray]
        }
        if whichArray == "3"  {
            meatCat.text = optionsThree[posArray]
        }
        if meats[myIndex] == "Brisket" {
            if meatCat.text == "Raw"{
                getValue(temp: "Raw",temp2: "brisket")
            }
            else if meatCat.text == "AM"{
                getValue(temp: "AM",temp2: "brisket")      }
            else if meatCat.text == "Retherm"{
                getValue(temp: "Retherm",temp2: "brisket")      }
            else if meatCat.text == "PM"{
                getValue(temp: "PM",temp2: "brisket")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else if meats[myIndex] == "Pork" {
            if meatCat.text == "Raw"{
                getValue(temp: "Raw",temp2: "pork")
            }
            else if meatCat.text == "AM"{
                getValue(temp: "AM",temp2: "pork")      }
            else if meatCat.text == "Retherm"{
                getValue(temp: "Retherm",temp2: "pork")     }
            else if meatCat.text == "PM"{
                getValue(temp: "PM",temp2: "pork")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else if meats[myIndex] == "Ribs" {
            if meatCat.text == "Racks Raw"{
                getValue(temp: "Racks Raw",temp2: "ribs")
            }
            else if meatCat.text == "Racks Retherm"{
                getValue(temp: "Racks Retherm",temp2: "ribs")     }
            else if meatCat.text == "Racks Left"{
                getValue(temp: "Racks Left",temp2: "ribs")
            }else if meatCat.text == "Total Catering"{
                getValue(temp: "Total Catering",temp2: "ribs")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else if meats[myIndex] == "Turkey" {
            if meatCat.text == "Raw"{
                getValue(temp: "Raw",temp2: "turkey")
            }
            else if meatCat.text == "AM"{
                getValue(temp: "AM",temp2: "turkey")      }
            else if meatCat.text == "Retherm"{
                getValue(temp: "Retherm",temp2: "turkey")     }
            else if meatCat.text == "PM"{
                getValue(temp: "PM",temp2: "turkey")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else if meats[myIndex] == "Chicken" {
            if meatCat.text == "Batch Made"{
                getValue(temp: "Batch Made",temp2: "chicken")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else if meats[myIndex] == "Beans" {
            if meatCat.text == "Batch Made"{
                getValue(temp: "Batch Made",temp2: "beans")
            }
            else{
                amountField.placeholder = "0"
            }
        }
        else{
            amountField.placeholder = "0"
        }
        putInDict()
    }

    func setData(){
        if meats[myIndex] == "Brisket"{
            if meatCat.text == "Raw" && amountField.text != "" {
                setValue(temp: "Raw",temp2: "brisket")
                //briskNum["Raw"] = Double(amountField.text!)
            }
            else if meatCat.text == "AM" && amountField.text != ""{
               setValue(temp: "AM",temp2: "brisket")
              // briskNum["AM"] = Double(amountField.text!)
            }
            else if meatCat.text == "Retherm" && amountField.text != ""{
                setValue(temp: "Retherm",temp2: "brisket")
                //briskNum["Retherm"] = Double(amountField.text!)
            }
            else if meatCat.text == "PM" && amountField.text != ""{
               setValue(temp: "PM",temp2: "brisket")
                //briskNum["PM"] = Double(amountField.text!)
            }
            }
        else if meats[myIndex] == "Pork"{
            if meatCat.text == "Raw" && amountField.text != "" {
                setValue(temp: "Raw",temp2: "pork")
               // porkNum["Raw"] = Double(amountField.text!)
            }
            else if meatCat.text == "AM" && amountField.text != ""{
                setValue(temp: "AM",temp2: "pork")
                //porkNum["AM"] = Double(amountField.text!)
            }
            else if meatCat.text == "Retherm" && amountField.text != ""{
                setValue(temp: "Retherm",temp2: "pork")
               // porkNum["Retherm"] = Double(amountField.text!)
            }
            else if meatCat.text == "PM" && amountField.text != "" {
                setValue(temp: "PM",temp2: "pork")
                //porkNum["PM"] = Double(amountField.text!)
            }
        }
        else if meats[myIndex] == "Turkey"{
            if meatCat.text == "Raw" && amountField.text != "" {
                setValue(temp: "Raw",temp2: "turkey")
               // turkeyNum["Raw"] = Double(amountField.text!)
            }
            else if meatCat.text == "AM" && amountField.text != ""{
                setValue(temp: "AM",temp2: "turkey")
                //turkeyNum["AM"] = Double(amountField.text!)
            }
            else if meatCat.text == "Retherm" && amountField.text != ""{
                setValue(temp: "Retherm",temp2: "turkey")
                //turkeyNum["Retherm"] = Double(amountField.text!)
            }
            else if meatCat.text == "PM" && amountField.text != "" {
                setValue(temp: "PM",temp2: "turkey")
                //turkeyNum["PM"] = Double(amountField.text!)
            }
        }
        else if meats[myIndex] == "Ribs"{
            if meatCat.text == "Racks Raw" && amountField.text != "" {
                setValue(temp: "Racks Raw",temp2: "ribs")
                //ribsNum["Racks Raw"] = Double(amountField.text!)
            }
            else if meatCat.text == "Racks Retherm" && amountField.text != ""{
                setValue(temp: "Racks Retherm",temp2: "ribs")
                //ribsNum["Racks Retherm"] = Double(amountField.text!)
                
            }
            else if meatCat.text == "Racks Left" && amountField.text != "" {
                setValue(temp: "Racks Left",temp2: "ribs")
               // ribsNum["Racks Left"] = Double(amountField.text!)
            }
            else if meatCat.text == "Total Catering" && amountField.text != "" {
                setValue(temp: "Total Catering",temp2: "ribs")
                //ribsNum["Total Catering"] = Double(amountField.text!)
            }
        }
        else if meats[myIndex] == "Chicken"{
            if meatCat.text == "Batch Made" && amountField.text != "" {
                setValue(temp: "Batch Made",temp2: "chicken")
                //chickenNum["Batch Made"] = Double(amountField.text!)
            }
        }
        else if meats[myIndex] == "Beans"{
            if meatCat.text == "Batch Made" && amountField.text != "" {
                setValue(temp: "Batch Made",temp2: "beans")
                //beansNum["Batch Retherm"] = Double(amountField.text!)
            }
        }
    }
    @objc func doneButtonTapped() {
        amountField.resignFirstResponder()
        setData()
        
    }
    @objc func cancelButtonTapped() { amountField.resignFirstResponder() }
    
    func getValue(temp: String, temp2: String){
        ref.child("Week").observe(.value) { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                if let myFinalStep = dictionary[weeks[currDay]] as? [String: Any] {
                    if let myFinal = myFinalStep[temp2] as? [String: Any]{
                        if myFinal[temp] != nil{
                            self.amountField.placeholder = myFinal[temp].unsafelyUnwrapped as? String
                        }
                    }
                }
            }
        }
    }
    func getValueToDict(t: String, t2: String){
        Database.database().reference().child("Week").observe(.value) { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                if let myFinalStep = dictionary[weeks[currDay]] as? [String: Any] {
                    if let myFinal = myFinalStep[t2] as? [String: Any]{
                        if t2 == "brisket" && myFinal[t] != nil{
                            briskNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }
                        else if t2 == "pork" && myFinal[t] != nil{
                            porkNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }
                        else if t2 == "ribs" && myFinal[t] != nil{
                            ribsNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }
                        else if t2 == "turkey" && myFinal[t] != nil{
                            turkeyNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }
                        else if t2 == "chicken" && myFinal[t] != nil{
                            chickenNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }
                        else if t2 == "beans" && myFinal[t] != nil{
                            beansNum[t] = Double(myFinal[t].unsafelyUnwrapped as! String)
                        }

                    }
                }
            }
        }
    }
    func putInDict(){
        getValueToDict(t: "Raw", t2: "brisket")
        getValueToDict(t: "AM", t2: "brisket")
        getValueToDict(t: "Retherm", t2: "brisket")
        getValueToDict(t: "PM", t2: "brisket")
        getValueToDict(t: "Raw", t2: "pork")
        getValueToDict(t: "AM", t2: "pork")
        getValueToDict(t: "Retherm", t2: "pork")
        getValueToDict(t: "PM", t2: "pork")
        getValueToDict(t: "Raw", t2: "turkey")
        getValueToDict(t: "AM", t2: "turkey")
        getValueToDict(t: "Retherm", t2: "turkey")
        getValueToDict(t: "PM", t2: "turkey")
        getValueToDict(t: "Racks Raw", t2: "ribs")
        getValueToDict(t: "Racks Left", t2: "ribs")
        getValueToDict(t: "Racks Retherm", t2: "ribs")
        getValueToDict(t: "Batch Made", t2: "chicken")
        getValueToDict(t: "Batch Made", t2: "beans")
            
        
    }
    func setValue(temp: String, temp2: String){
        if let me = Double(self.amountField.text!){
        ref.child("Week").child(weeks[currDay]).child(temp2).child(temp).setValue(self.amountField.text)
    }
    }

}

extension InputViewController{
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        amountField.inputAccessoryView = toolbar
    }
    
    // Default actions:
    
}
