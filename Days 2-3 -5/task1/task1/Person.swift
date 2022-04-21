//
//  Person.swift
//  task1
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation

class Person{
    
    var salary: Int
    
    init(salary: Int) {
        self.salary = salary
    }
    
    func getSalary()-> Int{
        return salary
    }
}
