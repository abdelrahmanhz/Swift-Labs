//
//  DBManager.swift
//  Task2
//
//  Created by abdelrahmanhz on 4/20/22.
//  Copyright © 2022 abdelrahmanhz. All rights reserved.
//

import Foundation
import SQLite3

class DBManager{
    
    // singleton
    static let sharedInstance = DBManager()
    
    private init() {
        print("an instance of class DBManager is created")
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    
  // open database
  func openDatabase() -> OpaquePointer?
  {
      let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
          .appendingPathComponent(dbPath)
      var db: OpaquePointer? = nil
    
      if sqlite3_open(filePath.path, &db) != SQLITE_OK
      {
          print("can't open database")
          return nil
      }
      else
      {
          print("Successfully created connection to database at \(dbPath)")
          return db
      }
  }
    
    
    // create table
    func createTable() {
      // 1
      let createTableString = """
      create table if not exists movie(
      title text primary key not null,
      image text,
      rating real,
      releaseYear integer,
      genre text)
      """
      var createTableStatement: OpaquePointer?
        
      if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) ==
          SQLITE_OK {
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
          print("\nContact table created.")
        } else {
          print("\nContact table is not created.")
        }
      } else {
        print("\nCREATE TABLE statement is not prepared.")
      }
      sqlite3_finalize(createTableStatement)
    }


    
    // insert
    func insert(movie: Movie) {
        
      let insertStatementString = "INSERT INTO movie (title, image, rating, releaseYear, genre) VALUES (?, ?, ?, ?, ?);"
      var insertStatement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) ==
          SQLITE_OK {

        sqlite3_bind_text(insertStatement, 1, (movie.title as NSString).utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 2, (movie.image as NSString).utf8String, -1, nil)
        sqlite3_bind_double(insertStatement, 3, Double(movie.rating))
        sqlite3_bind_int(insertStatement, 4, Int32(movie.releaseYear))
        sqlite3_bind_text(insertStatement, 5, (movie.genre as NSString).utf8String, -1, nil)

        if sqlite3_step(insertStatement) == SQLITE_DONE {
          print("\nSuccessfully inserted row.")
        } else {
          print("\nCould not insert row.")
        }
      } else {
        print("\nINSERT statement is not prepared.")
      }
      sqlite3_finalize(insertStatement)
    }
    
    
    // read
    func getMovies() -> [Movie] {
        
        let queryStatementString = "select * from movie;"
        var queryStatement: OpaquePointer? = nil
        var movies : [Movie] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let image = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let rating = sqlite3_column_double(queryStatement, 2)
                let releaseYear = sqlite3_column_int(queryStatement, 3)
                let genre = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                
                movies.append(Movie(title: title, image: image, rating: Float(rating), releaseYear: Int(releaseYear), genre: genre))
                
                print("Query Result:")
                print("\(title) | \(image) | \(rating)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return movies
    }


    // delete
    func deleteMovieByTitle(title:String) {
        let deleteStatementStirng = "delete from movie where title = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(deleteStatement, 1, (title as NSString).utf8String, -1, nil)
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
}
