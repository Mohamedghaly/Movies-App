//
//  Movies +ScrollView.swift
//  MoviesApp
//
//  Created by Mohamed Ghaly on 25/07/2024.
//

import UIKit

extension MoviesViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.collectionContainerHeightConstraints.constant = 0
                self?.pageControl.isHidden = true
                self?.view.layoutIfNeeded()
            }
        } else if scrollView.contentOffset.y < lastContentOffset {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.collectionContainerHeightConstraints.constant = 224
                    self?.pageControl.isHidden = false
                    self?.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
        if lastContentOffset <= 0 {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    }
    
}
