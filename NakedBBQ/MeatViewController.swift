//
//  MeatViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/2/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation
import UIKit

var optionsOne = ["Raw","AM","Retherm","PM"]
var optionsTwo = ["Racks Raw","Racks Retherm","Racks Left","Total Catering"]
var optionsThree = ["Batch Made"]
var whichArray = "0"
var posArray = 0
class MeatViewController : UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    @IBOutlet weak var meatLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var optionsTable: UITableView!
    
    @IBAction func calculate(_ sender: Any) {
        performSegue(withIdentifier: "meatToCalc", sender: self)
    }
    override func viewDidLoad(){
    super.viewDidLoad()
    meatLabel.text = meats[myIndex]
    print(meats[myIndex])
    optionsTable.delegate = self
    optionsTable.dataSource = self
    optionsTable.tableFooterView = UIView()
    self.dismissKeyboard()
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if meatLabel.text == "Brisket" || meatLabel.text == "Pork" || meatLabel.text == "Turkey"{
            whichArray = "1"
            return optionsOne.count
        }
        if meatLabel.text == "Ribs" {
            whichArray = "2"
            return optionsTwo.count
        }
        if meatLabel.text == "Chicken" || meatLabel.text == "Beans" {
            whichArray = "3"
            return optionsThree.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optioncell", for: indexPath)
        if meatLabel.text == "Brisket" || meatLabel.text == "Pork" || meatLabel.text == "Turkey"{
            cell.textLabel?.text=optionsOne[indexPath.row]
        }
        if meatLabel.text == "Ribs" {
            cell.textLabel?.text=optionsTwo[indexPath.row]
        }
        if meatLabel.text == "Chicken" || meatLabel.text == "Beans" {
            cell.textLabel?.text=optionsThree[indexPath.row]
        }
        // Configure the cell...
        
        return cell
    }
    func tableView(_ weekTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        posArray = indexPath.row
        performSegue(withIdentifier: "optionToInput", sender: self)
    }
}
