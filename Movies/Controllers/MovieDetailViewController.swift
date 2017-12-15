//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Rosalie Snijders on 14-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import UIKit
import Firebase

class MovieDetailViewController: UIViewController {
    
    var delegate: AddToFavoritesDelegate?
    var movieItem: Movie!
    var ref: DatabaseReference! = Database.database().reference().child("favorites")
    var user = Auth.auth().currentUser!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToFavorites: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()
    }
    
    func setupDelegate() {
        if let navController = tabBarController?.viewControllers?.last as? UINavigationController,
            let myFavorites = navController.viewControllers.first as? MyFavorites {
            delegate = myFavorites
        }
    }
    
    func updateUI() {
        titleLabel.text = movieItem.title
        descriptionLabel.text = movieItem.overview
        voteLabel.text = String(format: "Grade: %.2f", movieItem.voteAverage)
        addToFavorites.layer.cornerRadius = 5.0
    }
    
    @IBAction func addButton(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
        self.addToFavorites.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        self.addToFavorites.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        delegate?.added(movieItem: movieItem)
        addMovie()
        //Movie.saveToFirebase(userID: user!)
    }
    
    func addMovie(){
        let key = ref.childByAutoId().key

        let favorites = ["id":key,
                         "email": user.email!,
                         "MovieTitle": movieItem.title,
            ]

        ref.child(key).setValue(favorites)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
