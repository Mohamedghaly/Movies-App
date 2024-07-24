//
//  MainCoordinator.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit

class MainCoordinator: BaseCoordinator<MainFactory> {
    
    var navigationController: UINavigationController
    var appCoordinator: AppCoordinatorProtocol!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        initConfigurations()
        let vc = BaseNavigationController(rootViewController: UIViewController())
        UIApplication.shared.restartTo(vc, animated: true)
    }
    
    func initConfigurations() {
        self.container = MainFactory()
        appCoordinator = AppCoordinator()
    }
    
}
