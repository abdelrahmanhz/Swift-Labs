//
//  ViewController.swift
//  movieList
//
//  Created by abdelrahmanhz on 4/21/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
        @IBOutlet weak var rankL: UILabel!
        @IBOutlet weak var posterIV: UIImageView!
        @IBOutlet weak var detailsL: UILabel!
        var movie = Movie()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            titleL.text = movie.title
            rankL.text = "#\(movie.rank ?? "0")"
            detailsL.text = "weekend: \(movie.weekend ?? "0") | gross: \(movie.gross ?? "0") | weeks: \(movie.weeks ?? "0")"
            let url = URL(string: movie.image ?? "https://www.femtoscientific.com/wp-content/uploads/2014/12/default_image_01.png")
            let processor = DownsamplingImageProcessor(size: posterIV.bounds.size)
            posterIV.kf.setImage(with: url,
                                  placeholder: UIImage(named: "placeholderImage"),
                                  options: [
                                      .processor(processor),
                                      .scaleFactor(UIScreen.main.scale),
                                      .transition(.fade(1)),
                                      .cacheOriginalImage
                                  ])
        }


}

