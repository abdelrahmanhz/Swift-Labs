//
//  TableViewController.swift
//  Task2
//
//  Created by abdelrahmanhz on 4/17/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var movies = [Movie]()
    let dbManager = DBManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let movie1 = Movie(title: "Home Alone", image: "www.image1.com", rating: 7.7, releaseYear: 1994, genre: "family funny")
//        let movie2 = Movie(title: "Avangers", image: "www.image2.com", rating: 8.4, releaseYear: 2019, genre: "family Action")
//        let movie3 = Movie(title: "Split", image: "www.image3.com", rating: 7.7, releaseYear: 2017, genre: "family horror")
//        let movie4 = Movie(title: "Spiderman No Way Home", image: "www.image4.com", rating: 7.7, releaseYear: 2021, genre: "family funny")
//        let movie5 = Movie(title: "Batman", image: "www.image5.com", rating: 9.2, releaseYear: 2022, genre: "family Action")
//
//        movies.append(movie1)
//        movies.append(movie2)
//        movies.append(movie3)
//        movies.append(movie4)
//        movies.append(movie5)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.movies = self.dbManager.getMovies()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    @IBAction func addMovie(_ sender: Any) {
        let addMovieVC = self.storyboard?.instantiateViewController(identifier: "addMovie") as! AddMovieViewController
        addMovieVC.delegate = self
        self.navigationController?.pushViewController(addMovieVC, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        let movie = movies[self.tableView.indexPathForSelectedRow!.row]
        vc.movie = movie
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Removing Alert", message: "Remove \"\(self.movies[indexPath.row].title)\" from movies list?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.dbManager.deleteMovieByTitle(title: self.movies[indexPath.row].title)
                self.movies.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
                print("Ok")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension TableViewController: AddMovieProtocol{
    func addMovie(movie: Movie) {
        self.dbManager.insert(movie: movie)
        self.movies.removeAll()
        print(movie.title)
        self.movies = self.dbManager.getMovies()
        self.tableView.reloadData()
    }
}

