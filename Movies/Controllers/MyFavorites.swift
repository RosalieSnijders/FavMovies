//
//  MyFavorites.swift
//  Movies
//
//  Created by Rosalie Snijders on 14-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import UIKit
import Firebase

protocol AddToFavoritesDelegate {
    func added(movieItem: Movie)
}

class MyFavorites: UITableViewController, AddToFavoritesDelegate {
    
    var myFavorites = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedFavs = Movie.loadFavs() {
            myFavorites = savedFavs
        } else {
            myFavorites = []
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
        
//        let ref: DatabaseReference! = Database.database().reference().child("favorites")
//
//        ref.observe(.value, with: { (snapshot) in
//
//            if snapshot.childrenCount > 0 {
//                self.myFavorites = []
//                for favorites in snapshot.children.allObjects as! [DataSnapshot] {
//
//                    let favoriteObject = favorites.value as? [String: AnyObject]
//                    let email = favoriteObject?["email"]
//                    let id = favoriteObject?["id"]
//                    let MovieTitle = favoriteObject!["MovieTitle"]
//
//                    let movieToBeAdded = Favorite(id: id as! String, email: email as! String, MovieTitle: MovieTitle as! String)
//
//                    self.myFavorites.append(movieToBeAdded)
//                }
//                self.tableView.reloadData()
//            }
//
//        })
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFavorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let movieItem = myFavorites[indexPath.row]
        cell.textLabel?.text = movieItem.title
        cell.detailTextLabel?.text = String(format: "Grade: %.2f", movieItem.voteAverage)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myFavorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func added(movieItem: Movie) {
        myFavorites.append(movieItem)
        let count = myFavorites.count
        let indexPath = IndexPath(row: count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    
}
