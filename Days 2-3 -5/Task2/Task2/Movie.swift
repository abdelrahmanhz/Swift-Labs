//
//  Movie.swift
//  Task2
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation

struct Movie {
    
    var title: String
    var image: String
    var rating: Float
    var releaseYear: Int
    var genre: String
    
    init(title: String, image: String, rating: Float, releaseYear: Int, genre: String) {
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
    }
}
