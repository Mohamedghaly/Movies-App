//
//  AppDelegate.swift
//  Movies
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinatorProtocol!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    private func setRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator()
        appCoordinator.loadSplashScreen()
    }
    
}

