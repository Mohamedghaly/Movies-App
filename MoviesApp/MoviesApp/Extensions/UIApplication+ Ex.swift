//
//  UIApplication+ Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit


extension UIApplication {
    var window: UIWindow? {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    }
    
    func restartTo(_ viewController: UIViewController, animated: Bool = true) {
        
        guard let window = self.window else {
            window?.rootViewController = viewController
            return
        }
        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                window.rootViewController = viewController
            }, completion: nil)
        }
    }
}
