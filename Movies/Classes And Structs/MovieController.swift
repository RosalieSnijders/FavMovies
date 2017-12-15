import Foundation
import UIKit


//Create URLquery to retrieve the data from the API
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//Class to fetch items from API
class MovieController {
    static let shared = MovieController()
    
    let baseURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key")!
    
    let query: [String: String] = [
        "api_key": "b02c6c45e635bf254623673e44970db5",
        ]
    
    func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
        let movieURL = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: movieURL) {(data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let movies = try? jsonDecoder.decode(Movies.self, from: data) {
                completion(movies.results)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
