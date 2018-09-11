//
//  RealmObjects.swift
//  NakedBBQ
//
//  Created by Joshua Silverio on 9/2/18.
//  Copyright © 2018 Joshua Silverio. All rights reserved.
//

import Foundation


class User:Object{
    let userWeek = List<Week>()
    @objc dynamic var userName : String? = nil
    @objc dynamic var userPassword : String? = nil
    override static func primaryKey() -> String?{
        return "userName"
    }
}
class Week:Object{
    @objc dynamic var weekOf : String? = nil
    @objc dynamic var brisket : BrisketData? = BrisketData()
    @objc dynamic var pork : PorkData? = PorkData()
    @objc dynamic var ribs : RibsData? = RibsData()
    @objc dynamic var turkey : TurkeyData? = TurkeyData()
    @objc dynamic var chicken : ChickenData? = ChickenData()
    @objc dynamic var beans : BeansData? = BeansData()
    override static func primaryKey() -> String?{
        return "weekOf"
    }
}
extension User{
    func writeToRealm(){
        try! uiRealm.write {
            uiRealm.add(self)
        }
    }
}
extension Week{
    func writeToRealm(){
        try! uiRealm.write {
            uiRealm.add(self, update:true)
        }
    }
}
class BrisketData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var raw = 0.00
    @objc dynamic var am = 0.00
    @objc dynamic var retherm = 0.00
    @objc dynamic var pm = 0.00
    @objc dynamic var yieldPostTrim = 0.00
    @objc dynamic var dailyUsage = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
}
class PorkData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var raw = 0.00
    @objc dynamic var am = 0.00
    @objc dynamic var retherm = 0.00
    @objc dynamic var pm = 0.00
    @objc dynamic var yieldPostTrim = 0.00
    @objc dynamic var dailyUsage = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
class RibsData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var raw = 0.00
    @objc dynamic var retherm = 0.00
    @objc dynamic var left = 0.00
    @objc dynamic var totalCatering = 0.00
    @objc dynamic var totalRestaurant = 0.00
    @objc dynamic var dailyUsage = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
class TurkeyData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var raw = 0.00
    @objc dynamic var am = 0.00
    @objc dynamic var retherm = 0.00
    @objc dynamic var pm = 0.00
    @objc dynamic var yieldPostTrim = 0.00
    @objc dynamic var dailyUsage = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
class ChickenData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var batchMade = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
class BeansData:Object{
    @objc dynamic var id : String? = nil
    @objc dynamic var batchMade = 0.00
    
    override static func primaryKey() -> String?{
        return "id"
    }
}


    

