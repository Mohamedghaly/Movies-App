//  
//  SplashScreenViewController.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

protocol SplashScreenCoordinatorProtocol {
    func loadMainView()
}

class SplashScreenViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: SplashScreenCoordinatorProtocol!

    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           navigateToMainView()
    }
    
    fileprivate func navigateToMainView(){
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.coordinator.loadMainView()
        }
    }
}
