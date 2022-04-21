//
//  Model.swift
//  movieList
//
//  Created by abdelrahmanhz on 4/21/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation

class Movie : Decodable{
    var id : String?
    var rank : String?
    var title : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
}

class Result : Decodable {
    var items : [Movie]
    var errorMessage : String?
}

func fetchMovies(complitionHandler: @escaping (Result?) -> Void ){
    
   let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_ugb4n4sh")
    
   guard let newURL = url else{
       print("Error while unwrapping URL")
       return
   }
    
   let request = URLRequest(url: newURL)
   let session = URLSession(configuration: .default)
    
   let task = session.dataTask(with: request) { (data, response, error) in
       
       guard let data = data else{
           return
       }
    
       do{
            let result = try JSONDecoder().decode(Result.self, from: data)
            complitionHandler(result)
       }catch let error{
        print("inside exception")
            print(error.localizedDescription)
            complitionHandler(nil)
       }
   }
   task.resume()
}
