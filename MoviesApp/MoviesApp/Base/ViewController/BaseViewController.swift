//
//  BaseViewController.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit
import Combine

public class BaseViewController: UIViewController {
    
    public var reloadDataHandler: (() -> Void)?
    public var isNavBarHidden: Bool? {
        didSet {
            
            self.navigationController?.navigationItem.setHidesBackButton(isNavBarHidden ?? false, animated: false)
            self.navigationItem.setHidesBackButton(isNavBarHidden ?? false, animated: true)
        }
    }
    
    private let loader = Loader()
    
    public var cancelAbles: Set<AnyCancellable> = []
    private var baseViewModel: BaseViewModel?
    
    // MARK: - View Life Cycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        initViewModels()
    }
    
    
    func setTitle(_ title: String) {
        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        navTitleLabel.text = title
        navTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        navTitleLabel.textColor = .darkGray
        self.navigationItem.titleView = navTitleLabel
    }
    
    func initViewModels() {
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let viewModel = child.value as? BaseViewModel {
                self.baseViewModel = viewModel
                baseViewModel!.publisherIsLoading
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] value in
                        if value ?? false {
                            self?.showDefaultLoader()
                        } else {
                            self?.hideDefaultLoader()
                        }
                    }.store(in: &cancelAbles)
                
            }
        }
    }
    
    // MARK: - Show Default Loader
    public func showDefaultLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.loader.showLoader(on: self.view)
        }
    }
    
    //     MARK: - Hide Default Loader
    public func hideDefaultLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.loader.hideLoader()
        }
    }
}
