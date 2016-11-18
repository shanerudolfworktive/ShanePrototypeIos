//
//  RealmModal.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/17/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskList: Object {
    dynamic var text = ""
    dynamic var id = ""
    let items = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

final class Task: Object {
    dynamic var text = ""
    dynamic var completed = false
}
