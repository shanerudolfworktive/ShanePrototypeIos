//
//  GroceryItem.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/15/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct GroceryItem{
    let key: String
    let name: String
    let addedByUser: String
    let ref: FIRDatabaseReference?
    var completed: Bool
    
    init(name: String, addedByUser: String, completed: Bool, key: String = "") {
        self.key = key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        addedByUser = snapshotValue["addedByUser"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed
        ]
    }
}
