//
//  MoviesActors.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import Foundation

// MARK: - MoviesDetails
struct MoviesActors: Codable {
    let credits: Credits?
    
    enum CodingKeys: String, CodingKey {
        case credits
    }
}

// MARK: - Credits
struct Credits: Codable {
    let cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

