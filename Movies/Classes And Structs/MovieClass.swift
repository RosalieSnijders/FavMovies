//
//  MovieClass.swift
//  Movies
//
//  Created by Rosalie Snijders on 06-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Movie: Codable {
    var id: Int
    var video: Bool
    var title: String
    var overview: String
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
    var posterPath: URL
    var originalLanguage: String
    var originalTitle: String
    var genreIDs: [Int]
    var backdropPath: String
    var adult: Bool
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case video
        case title
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDs = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case releaseDate = "release_date"
    }
    
//    static func loadFavs() -> [Movie]?  {
//        guard let codedFavs = try? Data(contentsOf: ArchiveURL) else {return nil}
//        let propertyListDecoder = PropertyListDecoder()
//        return try? propertyListDecoder.decode(Array<Movie>.self, from: codedFavs)
//    }
//
//    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("favorites").appendingPathExtension("plist")
//
//
//    static func saveFavs(_ favs: [Movie]) {
//        let propertyListEncoder = PropertyListEncoder()
//        let codedFavs = try? propertyListEncoder.encode(favs)
//        try? codedFavs?.write(to: ArchiveURL, options: .noFileProtection)
//    }
//
//    let moviesRef = Database.database().reference(withPath: "favorites")
//    func saveToFirebase(userID: String ) {
//        let dict = ["id": self.id,
//                    "video": self.video,
//                    "voteCount": self.voteCount,
//                    "popularity": self.popularity,
//                    "posterPath": self.posterPath,
//                    "originalLanguage": self.originalLanguage,
//                    "originalTitle": self.originalLanguage,
//                    "genreIDs": self.genreIDs,
//                    "backdropPath": self.backdropPath,
//                    "adult": self.adult,
//                    "releaseDate": self.releaseDate,
//                    "title": self.title,
//                    "voteAverage": self.voteAverage,
//                    "overview": self.overview
//            ] as [String : Any]
//
//        let thisMoviesRef = moviesRef.child(userID).child(dict["title"] as! String)
//        thisMoviesRef.setValue(dict)
//    }
//
//    func deleteFromFirebase(MovieTitle: String, userID: String) {
//        moviesRef.child(userID).child(MovieTitle).removeValue { error,refer  in
//            if error != nil {
//                print("Error: \(String(describing: error))")
//            }
//        }
//    }
}

struct Movies: Codable {
    let results: [Movie]
}

