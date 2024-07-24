//  
//  MoviesFactory.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit

extension MainFactory {
    func resolveMoviesViewModel() -> MoviesViewModelProtocol {
        return MoviesViewModel()
    }
    func resolveMoviesViewController(coordinator: MoviesCoordinatorProtocol) -> MoviesViewController {
        let viewController = MoviesViewController()
        viewController.coordinator = coordinator
        viewController.viewModel = resolveMoviesViewModel()
        return viewController
    }
}
