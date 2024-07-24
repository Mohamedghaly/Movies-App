//
//  MainCoordinator+ Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit


// MARK: - Splash root
extension MainCoordinator: SplashScreenCoordinatorProtocol{
    
    func setSplashAsRoot() {
        initConfigurations()
        let vc = container.resolveSplashScreenController(coordinator: self)
        UIApplication.shared.restartTo(vc, animated: true)
    }
}

// MARK: - load Movies View
extension MainCoordinator: MoviesCoordinatorProtocol {
    func loadMainView() {
        let vc = container.resolveMoviesViewController(coordinator: self)
        navigationController = BaseNavigationController(rootViewController: vc)
        UIApplication.shared.restartTo(navigationController, animated: true)
    }
}


