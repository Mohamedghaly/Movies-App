//
//  Configurations.swift
//  MoviesApp
//
//  Created by Mohamed Ghaly on 25/07/2024.
//

import Foundation


enum SearchTextConfigurations{
    case minimumSearchCharacter
    var number: Int {
        switch self {
            case .minimumSearchCharacter: 3
        }
    }
}
