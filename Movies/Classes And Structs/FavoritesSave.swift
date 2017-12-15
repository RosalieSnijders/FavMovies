////
////  FavoritesSave.swift
////  Movies
////
////  Created by Rosalie Snijders on 15-12-17.
////  Copyright © 2017 Rosalie Snijders. All rights reserved.
////
//
//import Foundation
//
//struct Saved: Codable {
//    var id: Int
//    var video: Bool
//    var title: String
//    var overview: String
//    var voteAverage: Double
//    var voteCount: Int
//    var popularity: Double
//    var posterPath: URL
//    var originalLanguage: String
//    var originalTitle: String
//    var genreIDs: [Int]
//    var backdropPath: String
//    var adult: Bool
//    var releaseDate: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case video
//        case title
//        case overview
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case popularity
//        case posterPath = "poster_path"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case genreIDs = "genre_ids"
//        case backdropPath = "backdrop_path"
//        case adult
//        case releaseDate = "release_date"
//    }
//    
//    static func loadFavs() -> [Saved]?  {
//        guard let codedFavs = try? Data(contentsOf: ArchiveURL) else {return nil}
//        let propertyListDecoder = PropertyListDecoder()
//        return try? propertyListDecoder.decode(Array<Saved>.self, from: codedFavs)
//    }
//    
//    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("favorites").appendingPathExtension("plist")
//    
//    
//    static func saveFavs(_ favs: [Saved]) {
//        let propertyListEncoder = PropertyListEncoder()
//        let codedFavs = try? propertyListEncoder.encode(favs)
//        try? codedFavs?.write(to: ArchiveURL, options: .noFileProtection)
//    }
//}

