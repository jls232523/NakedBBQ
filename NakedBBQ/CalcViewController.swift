//
//  CalcViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/3/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
var desc = ["Brisket Yield Post Trim", "Brisket Daily Usage","Pork Yield Post Trim", "Pork Daily Usage","Turkey Yield Post Trim", "Turkey Daily Usage"," Ribs Daily Usage","Chicken Batch Made", "Beans Batch Made"]
var calcArray = [String]()
public class CalcViewController : UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    @IBOutlet weak var calcTable: UITableView!
    override public func viewDidLoad() {
        super.viewDidLoad()
        calcTable.delegate = self
        calcTable.dataSource = self
        calcTable.tableFooterView = UIView()
        buildCalc()
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return desc.count
    }
    
    
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calcCell", for: indexPath)
        cell.textLabel?.text=desc[indexPath.row]
        cell.detailTextLabel?.text = calcArray[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    func buildCalc(){
        
        calcArray.removeAll()
        if briskNum["Raw"] != 0.0 {
            calcArray.append(String(briskNum["AM"]! / briskNum["Raw"]!))
            ref.child("Week").child(weeks[currDay]).child("brisket").child("Yield Post Trim").setValue(String(briskNum["AM"]! / briskNum["Raw"]!))
        }
        else{
            calcArray.append("0")
        }
        
        calcArray.append(String(briskNum["AM"]! + briskNum["Retherm"]! - briskNum["PM"]!))
        ref.child("Week").child(weeks[currDay]).child("brisket").child("Daily Usage").setValue(String(briskNum["AM"]! + briskNum["Retherm"]! - briskNum["PM"]!))
        
        if porkNum["Raw"] != 0.0 {
            calcArray.append(String(porkNum["AM"]! / porkNum["Raw"]!))
            ref.child("Week").child(weeks[currDay]).child("pork").child("Yield Post Trim").setValue(String(porkNum["AM"]! / porkNum["Raw"]!))
        }
        else{
            calcArray.append("0")
        }
        
        calcArray.append(String(porkNum["AM"]! + porkNum["Retherm"]! - porkNum["PM"]!))
        ref.child("Week").child(weeks[currDay]).child("pork").child("Daily Usage").setValue(String(porkNum["AM"]! + porkNum["Retherm"]! - porkNum["PM"]!))
        
        if turkeyNum["Raw"] != 0.0{
            calcArray.append(String(turkeyNum["AM"]! / turkeyNum["Raw"]!))
            ref.child("Week").child(weeks[currDay]).child("turkey").child("Yield Post Trim").setValue(String(turkeyNum["AM"]! / turkeyNum["Raw"]!))
        }
        else{
            calcArray.append("0")
        }
        calcArray.append(String(turkeyNum["AM"]! + turkeyNum["Retherm"]! - turkeyNum["PM"]!))
        ref.child("Week").child(weeks[currDay]).child("turkey").child("Daily Usage").setValue(String(turkeyNum["AM"]! + turkeyNum["Retherm"]! - turkeyNum["PM"]!))
        
        calcArray.append(String(ribsNum["Racks Raw"]! + ribsNum["Racks Retherm"]! - ribsNum["Racks Left"]!))
        ref.child("Week").child(weeks[currDay]).child("ribs").child("Daily Usage").setValue(String(ribsNum["Racks Raw"]! + ribsNum["Racks Retherm"]! - ribsNum["Racks Left"]!))
        
        calcArray.append(String(chickenNum["Batch Made"]!))
        ref.child("Week").child(weeks[currDay]).child("chicken").child("Batch Made").setValue(String(chickenNum["Batch Made"]!))
        calcArray.append(String(beansNum["Batch Made"]!))
        ref.child("Week").child(weeks[currDay]).child("chicken").child("Batch Made").setValue(String(beansNum["Batch Made"]!))
        
        
    }
}
