//
//  MovieTableViewController.swift
//  Movies
//
//  Created by Rosalie Snijders on 07-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import UIKit


class MovieTableViewController: UITableViewController {
    
    var movieItems = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.shared.fetchMovies{ (movieItems) in
            if let movieItems = movieItems {
                self.updateUI(with: movieItems)
            }
        }
    }
    
    func updateUI(with movieItems: [Movie]) {
        DispatchQueue.main.async {
            self.movieItems = movieItems
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let movieTitle = movieItems[indexPath.row]
        cell.textLabel?.text = movieTitle.title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetailSegue" {
            let movieItemDetailViewController = segue.destination as! MovieDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            movieItemDetailViewController.movieItem = movieItems[index]
            }
        }
    }

