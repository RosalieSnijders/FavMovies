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
        navigationItem.leftBarButtonItem = editButtonItem
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
    
    // Function to add Movies to the myFavorites array to call in the MovieDetailViewController
    func added(movieItem: Movie) {
        myFavorites.append(movieItem)
        let count = myFavorites.count
        let indexPath = IndexPath(row: count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    
}
