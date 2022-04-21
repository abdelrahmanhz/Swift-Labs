//
//  HomeTableViewController.swift
//  movieList
//
//  Created by abdelrahmanhz on 4/21/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewController: UITableViewController {

    var movies = [Movie]()
        override func viewDidLoad() {
            super.viewDidLoad()

            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            let indicator = UIActivityIndicatorView(style: .large)
            indicator.center = self.view.center
            self.view.addSubview(indicator)
            // animator
            indicator.startAnimating()
            fetchMovies { [weak self] (result) in
            //
                for i in 0...(((result?.items.count)!) - 1){
                    let movie = Movie()
                    movie.title = result?.items[i].title
                    movie.rank = result?.items[i].rank
                    movie.image = result?.items[i].image
                    movie.weekend = result?.items[i].weekend
                    movie.weeks = result?.items[i].weeks
                    movie.gross = result?.items[i].gross
                    self?.movies.append(movie)
                }
                //self?.movies = result?.items.a
              DispatchQueue.main.async {
                    indicator.stopAnimating()
                
                    self?.tableView.reloadData()
                }
            }
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let url = URL(string: movies[indexPath.row].image ?? "https://www.femtoscientific.com/wp-content/uploads/2014/12/default_image_01.png")
            cell.textLabel?.text = movies[indexPath.row].title
//            cell.imageView?.kf.setImage(with: url){ result in
//                cell.setNeedsLayout()
//            }
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController
            let movie = movies[self.tableView.indexPathForSelectedRow!.row]
            vc.movie = movie
        }
        
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == .delete {
    //            let alert = UIAlertController(title: "Removing Alert", message: "Remove \"\(self.movies[indexPath.row].title ?? "empty")\" from movies list?", preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
    //                self.movies.remove(at: indexPath.row)
    //                tableView.deleteRows(at: [indexPath], with: .bottom)
    //                print("Ok")
    //            }))
    //            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    //            self.present(alert, animated: true, completion: nil)
    //        }
    //    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
