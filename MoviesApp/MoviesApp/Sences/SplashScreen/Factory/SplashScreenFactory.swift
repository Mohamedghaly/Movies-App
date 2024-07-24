//  
//  SplashScreenFactory.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

extension MainFactory {
    
    func resolveSplashScreenController(coordinator: SplashScreenCoordinatorProtocol) -> SplashScreenViewController {
        let viewController = SplashScreenViewController()
        viewController.coordinator = coordinator
        return viewController
    }
}
