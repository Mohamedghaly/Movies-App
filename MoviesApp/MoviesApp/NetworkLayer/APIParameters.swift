//
//  APIParameters.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import Foundation

protocol DictionaryConvertor: Codable {}


//MARK: APIParameters for using in URLRequests
struct APIParameters{
    struct getMovies: Encodable {
        var api_key: String? = APIConstants.apiKey
    }
    struct GetMovieDetails: Encodable  {
        var api_key: String? = APIConstants.apiKey
        var append_to_response: String? = APIExtraParameter.credits.type
        var movieID: Int
    }
}
enum QueryParameterUnusedKeys{
    case movieId
    var key: String {
        switch self {
        case .movieId: "movieID"
        }
    }
}
