//
//  UINavigationController+ Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit

extension UINavigationController {
    
    public func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

    public func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({ $0.isKind(of: ofClass) }).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    public func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
    
}
