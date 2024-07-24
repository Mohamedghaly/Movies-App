//
//  AppCoordinator.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import Foundation

protocol AppCoordinatorProtocol: AnyObject {
    func loadSplashScreen()
}

class AppCoordinator: NSObject {
    private var mainCoordinator: MainCoordinator = MainCoordinator(navigationController: BaseNavigationController())
}

extension AppCoordinator: AppCoordinatorProtocol {
    // MARK: - load Splash
    func loadSplashScreen() {
        mainCoordinator.setSplashAsRoot()
    }
}
