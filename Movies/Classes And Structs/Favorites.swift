//
//  Favorites.swift
//  Movies
//
//  Created by Rosalie Snijders on 15-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import Foundation

struct Favorite {
    var id: String?
    var email: String?
    var MovieTitle: String?
    
    init(id: String?, email: String?, MovieTitle: String?){
        self.id = id
        self.email = email
        self.MovieTitle = MovieTitle
    }
}
