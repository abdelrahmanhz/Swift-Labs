//
//  ViewController.swift
//  task1
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var salaryL: UILabel!
    @IBOutlet weak var salaryTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ShowEmpSalary(_ sender: Any) {
        let salary = Employee(salary: Int(self.salaryTF.text ?? "0") ?? 0).getSalary()
        self.salaryL.text = "Salary: \(salary)"
    }
    
    @IBAction func showManaSalary(_ sender: Any) {
        let salary = Manager(salary: Int(self.salaryTF.text ?? "0") ?? 0).getSalary()
        self.salaryL.text = "Salary: \(salary)"
    }
}

