//
//  WeekViewController.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/2/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation
import UIKit
import Firebase


var i = 0;
var databaseHandle : DatabaseHandle?
let date = Date()
let calendar = Calendar.current
let year = calendar.component(.year, from: date)
let month = calendar.component(.month, from: date)
let day = calendar.component(.day, from: date)
var currDay = 0
var weekCheck = 0
var redoKey = true
var today = (String(month) + "-" + String(day) + "-" + String(year))
var weeks = [String]()
class WeekViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var weekTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        weekTable.delegate = self
        weekTable.dataSource = self
        weekTable.tableFooterView = UIView()
        weekCheck = 0
        redoKey = true
        reloadData()
        weekTable.reloadData()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if weeks != nil {
            return weeks.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weekcell = tableView.dequeueReusableCell(withIdentifier: "weekcell", for: indexPath)
        weekcell.textLabel?.text = weeks[indexPath.row]
        // Configure the cell...
        weekcell.accessoryType = .disclosureIndicator
        weekcell.textLabel?.textColor = UIColor.lightText
        return weekcell
    }
    
     func tableView(_ weekTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        currDay = indexPath.row
        performSegue(withIdentifier: "weekToMeats", sender: self)
    }

    
    @objc func tapButton(){
        print("tapped")
        Database.database().reference().observeSingleEvent(of: DataEventType.value) { (snapshot) in
            for child in snapshot.children {
                for child2 in (child as AnyObject).children{
                let snap = child2 as! DataSnapshot
                let key = snap.key
                let value = snap.value
                if key == today {
                    redoKey = false
                }
                }
            }
        }
        for word in weeks{
            if word == today{
                redoKey = false
            }
        }
        if redoKey {
        ref.child("Week").child(today)
        ref.child("Week").child(today).child("brisket").setValue(nil)
        ref.child("Week").child(today).child("brisket").child("Raw").setValue("0")
        ref.child("Week").child(today).child("brisket").child("AM").setValue("0")
        ref.child("Week").child(today).child("brisket").child("Retherm").setValue("0")
        ref.child("Week").child(today).child("brisket").child("PM").setValue("0")
        ref.child("Week").child(today).child("brisket").child("Yield Post Trim").setValue("0")
        ref.child("Week").child(today).child("brisket").child("Daily Usage").setValue("0")
        ref.child("Week").child(today).child("brisket").child("Total Catering").setValue("0")
        ref.child("Week").child(today).child("brisket").child("Total Restaurant").setValue("0")
        
        ref.child("Week").child(today).child("pork").setValue(nil)
        ref.child("Week").child(today).child("pork").child("Raw").setValue("0")
        ref.child("Week").child(today).child("pork").child("AM").setValue("0")
        ref.child("Week").child(today).child("pork").child("Retherm").setValue("0")
        ref.child("Week").child(today).child("pork").child("PM").setValue("0")
        ref.child("Week").child(today).child("pork").child("Yield Post Trim").setValue("0")
        ref.child("Week").child(today).child("pork").child("Daily Usage").setValue("0")
        ref.child("Week").child(today).child("pork").child("Total Catering").setValue("0")
        ref.child("Week").child(today).child("pork").child("Total Restaurant").setValue("0")

        ref.child("Week").child(today).child("turkey").setValue(nil)
        ref.child("Week").child(today).child("turkey").child("Raw").setValue("0")
        ref.child("Week").child(today).child("turkey").child("AM").setValue("0")
        ref.child("Week").child(today).child("turkey").child("Retherm").setValue("0")
        ref.child("Week").child(today).child("turkey").child("PM").setValue("0")
        ref.child("Week").child(today).child("turkey").child("Yield Post Trim").setValue("0")
        ref.child("Week").child(today).child("turkey").child("Daily Usage").setValue("0")
        ref.child("Week").child(today).child("turkey").child("Total Restaurant").setValue("0")
        ref.child("Week").child(today).child("turkey").child("Total Catering").setValue("0")
            
        ref.child("Week").child(today).child("ribs").setValue(nil)
        ref.child("Week").child(today).child("ribs").child("Racks Raw").setValue("0")
        ref.child("Week").child(today).child("ribs").child("Racks Retherm").setValue("0")
        ref.child("Week").child(today).child("ribs").child("Racks Left").setValue("0")
        ref.child("Week").child(today).child("ribs").child("Daily Usage").setValue("0")
        ref.child("Week").child(today).child("ribs").child("Total Catering").setValue("0")
        ref.child("Week").child(today).child("ribs").child("Total Restaurant").setValue("0")
        
        ref.child("Week").child(today).child("chicken").setValue(nil)
        ref.child("Week").child(today).child("chicken").child("Batch Made").setValue("0")
        
        ref.child("Week").child(today).child("beans").setValue(nil)
        ref.child("Week").child(today).child("beans").child("Batch Made").setValue("0")
        reloadData()
        }
        else{
            print("already keyed")
        }
        
    }
    

    func reloadData(){
        weeks.removeAll()
       Database.database().reference().observeSingleEvent(of: DataEventType.value) { (snapshot) in
            for child in snapshot.children {
                for child2 in (child as AnyObject).children{
                    let snap = child2 as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    if self.keyCheck(todayy: today) {
                        weeks.append(key)
                        self.weekTable.reloadData()
                    }
                }
            }
        }
        weekTable.reloadData()
    }
    func keyCheck(todayy : String) -> Bool{
        for item in weeks {
            if todayy == item {
                return false
            }
        }
        return true
    }
    
}
