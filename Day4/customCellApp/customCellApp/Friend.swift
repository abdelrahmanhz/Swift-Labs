//
//  Friend.swift
//  customCellApp
//
//  Created by abdelrahmanhz on 4/19/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation

class Friend {
    var firstName: String = "empty"
    var lastName: String = "empty"
    var img: String = "M.jpeg"
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
