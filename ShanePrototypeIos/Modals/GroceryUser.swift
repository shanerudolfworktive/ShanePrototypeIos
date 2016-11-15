//
//  GroceryUser.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/15/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import Foundation
import FirebaseAuth

struct GroceryUser{
    let uid: String
    let email: String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
