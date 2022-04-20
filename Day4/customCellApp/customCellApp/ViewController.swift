//
//  ViewController.swift
//  customCellApp
//
//  Created by abdelrahmanhz on 4/19/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTable: UITableView!
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTable.delegate = self
        self.myTable.dataSource = self
        // Do any additional setup after loading the view.
        friends.append(Friend(firstName: "Ahmed", lastName: "Ali"))
        friends.append(Friend(firstName: "Samir", lastName: "Sabry"))
        friends.append(Friend(firstName: "Samir", lastName: "Ghanim"))
        friends.append(Friend(firstName: "Adel", lastName: "Imam"))
        friends.append(Friend(firstName: "Tamer", lastName: "Hosney"))
        friends.append(Friend(firstName: "Amr", lastName: "Diab"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.leftLabel.text = friends[indexPath.row].firstName
        cell.rightLabel.text = friends[indexPath.row].lastName
        cell.myImg.image = UIImage(named: friends[indexPath.row].img)
        return cell  
    }
}

