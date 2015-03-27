//
//  Checklist.swift
//  Checklists
//
//  Created by Josh Nagel on 2/13/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var items = [ChecklistItem]()
    var iconName: String
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("Name") as String
        self.items = aDecoder.decodeObjectForKey("ChecklistItems") as [ChecklistItem]
        self.iconName = aDecoder.decodeObjectForKey("IconName") as String
        super.init()
    }
    
    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "Name")
        aCoder.encodeObject(self.items, forKey: "ChecklistItems")
        aCoder.encodeObject(self.iconName, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items {
            if !item.checked {
                count += 1
            }
        }
        return count
    }
}
