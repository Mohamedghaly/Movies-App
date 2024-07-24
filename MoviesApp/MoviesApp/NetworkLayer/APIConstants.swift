//
//  APIConstants.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import Foundation


final class APIConstants {
    static var baseURL: String = APIBaseURLs.baseURL.url
    static var storageURL: String = APIBaseURLs.storageURL.url
    static var apiKey: String = "6d532b6cf07206067efcc6709b143dac"
   
}
enum APIBaseURLs {
    case baseURL
    case storageURL
    var url: String {
        switch self {
        case .baseURL: "https://api.themoviedb.org/3/"
        case .storageURL: "https://image.tmdb.org/t/p/w500"
        }
    }
}
enum APIExtraParameter {
    case credits
    var type: String {
        switch self {
        case .credits: "credits"
        }
    }
}
enum APIURLs {
    case getMovies
    case getMoviesDetails(movieId: Int)
    var path: String{
        switch self {
        case .getMovies: "movie/top_rated"
        case .getMoviesDetails(let movieId): "movie/\(movieId)"
        }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "Authorization"
    case acceptLanguage = "Accept-Language"
    case userAgent = "User-Agent"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwformurlencoded = "application/x-www-form-urlencoded"
}
// The Request Method
enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}
