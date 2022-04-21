//
//  ViewController.swift
//  Task2
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var imageL: UILabel!
    @IBOutlet weak var ratingL: UILabel!
    @IBOutlet weak var releaseYearL: UILabel!
    @IBOutlet weak var genreL: UILabel!
    @IBOutlet weak var imageIV: UIImageView!
    
    var movie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleL.text = movie.title
        imageL.text = movie.image
        ratingL.text = String(describing: movie.rating)
        releaseYearL.text = String(describing: movie.releaseYear)
        genreL.text = movie.genre
        imageIV.image = UIImage(named: movie.image)
        
    }


}

