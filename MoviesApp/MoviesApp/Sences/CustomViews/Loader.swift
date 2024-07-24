//
//  Loader.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

class Loader: UIView {
    
    private var loaderView: UIView!
    private var activityIndicator: UIActivityIndicatorView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoader()
    }
    
    private func setupLoader() {
        // Set up the loader view
        loaderView = UIView()
        loaderView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        loaderView.layer.cornerRadius = 10
        loaderView.clipsToBounds = true
        
        // Set up the activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        
        // Add subviews and set constraints
        loaderView.addSubview(activityIndicator)
        self.addSubview(loaderView)
        
        // Constraints for loaderView
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loaderView.widthAnchor.constraint(equalToConstant: 100),
            loaderView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Constraints for activityIndicator
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor)
        ])
    }
    
    func showLoader(on view: UIView) {
        UIView.animate(withDuration: 0.3){
            self.frame = view.bounds
            self.backgroundColor = UIColor(white: 0, alpha: 0.5)
            view.addSubview(self)
        }
    }
    
    func hideLoader() {
        UIView.animate(withDuration: 0.3){
            self.removeFromSuperview()
        }
    }
}
