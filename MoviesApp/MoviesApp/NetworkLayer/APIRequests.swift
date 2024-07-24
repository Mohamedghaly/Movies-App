//
//  APIRouter.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import Foundation

class APIRequests {
    
    // GET Request
    struct GetTopMoviesRequest: Request {
        typealias ReturnType = Movies
        var path: String = APIURLs.getMovies.path
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.getMovies) {
            self.queryParams = queryParams.asDictionary
        }
    }
    
    struct GetMovieDetailsRequest: Request {
        typealias ReturnType = MoviesActors
        var path: String
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.GetMovieDetails) {
            let parameter = queryParams
            self.path = APIURLs.getMoviesDetails(movieId: parameter.movieID).path
            var params = queryParams.asDictionary
            params.removeValue(forKey: QueryParameterUnusedKeys.movieId.key)
            self.queryParams = params
        }
        
    }
}
