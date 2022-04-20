//
//  Manager.swift
//  task1
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation

class Manager : Person{
    
    override func getSalary() -> Int {
        return super.salary * 2
    }
}
