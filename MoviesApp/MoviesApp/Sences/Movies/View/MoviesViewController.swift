//
//  MoviesViewController.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import UIKit

protocol MoviesCoordinatorProtocol {
    
}

class MoviesViewController: BaseViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var collectionContainerHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: MoviesViewModelProtocol!
    var coordinator: MoviesCoordinatorProtocol!

    var lastContentOffset: CGFloat = 0 {
        didSet {
            if lastContentOffset <= 0 {
                self.navigationController?.setNavigationBarHidden(false, animated: false)
            }
        }
    }
    var currentIndex: Int = 0
    
    // MARK: - View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovies()
        setupUI()
        bindUI()
    }
    
    // MARK: - setupUI
    private func setupUI() {
        setTitle("Movies")
        configureTableView()
        configureCollectionView()
        searchBar.delegate = self
    }
    // MARK: - bindUI
    private func bindUI() {
        viewModel.shouldReloadMoviesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.collectionView.reloadData()
                self.configurePageControl()
            }.store(in: &cancelAbles)
        
        viewModel.shouldReloadActorsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.tableView.reloadData()
            }.store(in: &cancelAbles)
        
        viewModel.isLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { isLoading in
                isLoading ?
                self.showDefaultLoader() : self.hideDefaultLoader()
            }.store(in: &cancelAbles)
    }
    
    fileprivate func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(cellClass: MoviesCell.self)
    }
    
    fileprivate func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(cellClass: ActorCell.self)
    }
    
    fileprivate func configurePageControl(){
        pageControl.numberOfPages = viewModel.numberOfMovies
    }
}

//MARK:- TableView delegate and datasource
extension MoviesViewController: TableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfActors
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ActorCell
        viewModel.configureTableViewCell(cell: cell, index: indexPath.row)
        return cell
    }
}

//MARK:- Search Bar Delegate
extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let characterNumber = SearchTextConfigurations.minimumSearchCharacter.number
        if searchText.count > characterNumber {
            viewModel.didStartSearch(with: searchText)
        } else if searchText.isEmpty {
            viewModel.didStartSearch(with: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
