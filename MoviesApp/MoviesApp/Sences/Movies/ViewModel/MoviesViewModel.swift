//
//  MoviesViewModel.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import Foundation
import Combine


protocol MoviesViewModelProtocol {
    var numberOfActors: Int { get }
    var numberOfMovies: Int { get }
    var shouldReloadMoviesPublisher: PassthroughSubject<Void, Never> { get }
    var shouldReloadActorsPublisher: PassthroughSubject<Void, Never> { get }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    func configureTableViewCell(cell: ActorCellProtocol, index: Int )
    func configureCollectionViewCell(cell: MoviesCellProtocol, index: Int )
    func getMovies()
    func getActors(with movieId: Int?)
    func willDisplayNewMove(with index: Int)
    func didStartSearch(with searchText: String)
}

class MoviesViewModel: BaseViewModel {
    private var searchData: [Cast] = []
    private var movies: [MoviesResult] = []
    private var actors: [Cast] = []
    var shouldReloadMoviesPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    var shouldReloadActorsPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    @Published private var isShowLoader: Bool = false
    var isLoadingPublisher: AnyPublisher<Bool, Never> { $isShowLoader.eraseToAnyPublisher() }
    
    func getMovies() {
        isShowLoader = true
        APIClient.dispatch(APIRequests.GetTopMoviesRequest(queryParams: APIParameters.getMovies()))
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    self.shouldReloadMoviesPublisher.send()
                case .failure(_):
                    self.isShowLoader = false
                }
            }
    receiveValue: { [weak self] response in
        let movies = response.results ?? []
        self?.movies = movies
        self?.getActors(with: movies.first?.id)
    }.store(in: &cancelAbles)
    }
    
    func getActors(with movieID: Int?) {
        isLoading = isLoading == true ? false : true
        guard let movieID else { return }
        APIClient.dispatch(APIRequests.GetMovieDetailsRequest(queryParams: APIParameters.GetMovieDetails(movieID: movieID)))
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion{
                case .finished:
                    self.isShowLoader = false
                    self.shouldReloadActorsPublisher.send()
                case .failure(_):
                    self.isShowLoader = false
                }
            }
    receiveValue: { [weak self] response in
        let actors = response.credits?.cast ?? []
        self?.actors = actors
        self?.searchData = actors
    }.store(in: &cancelAbles)
    }
    
}

extension MoviesViewModel: MoviesViewModelProtocol {
    
    var numberOfActors: Int {
        searchData.count
    }
    
    var numberOfMovies: Int {
        return movies.count
    }
    
    func configureCollectionViewCell(cell: MoviesCellProtocol, index: Int) {
        let data = movies[index]
        cell.configureCell(with: data)
    }
    
    func configureTableViewCell(cell: ActorCellProtocol, index: Int) {
        
        let data = searchData[index]
        cell.configureCell(with: data)
    }
    
    func willDisplayNewMove(with index: Int) {
        guard let currentMovieID = movies[index].id else { return }
        getActors(with: currentMovieID)
    }
    
    func didStartSearch(with searchText: String) {
        searchData = actors
        if searchText.isEmpty {
            searchData = actors
        } else {
            searchData = actors.filter({ $0.originalName?.range(of: searchText,options: [.anchored,.caseInsensitive]) != nil })
        }
        self.shouldReloadActorsPublisher.send()
    }
    
}
