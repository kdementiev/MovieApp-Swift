//
//  MovieDetailsInteractor.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import PromiseKit
import CancellationToken


class MovieDetailsInteractor {
    var output: MovieDetailsInteractorOutput?
    
    fileprivate var movie: MovieInfoRecord
    
    // Used services.
    var movieNetworking: MoviesNetworkingServiceProtocol!
    
    lazy var moviesTokenSource: CancellationTokenSource? = CancellationTokenSource()
    
    
    init(movie: MovieInfoRecord) {
        self.movie = movie
    }
    
    fileprivate func cancelNetworkingOperations() {
        moviesTokenSource?.cancel()
        moviesTokenSource = nil
    }
    
    deinit {
        self.cancelNetworkingOperations()
    }
}

extension MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    
    func prepare() {
        
        self.cancelNetworkingOperations()
        
        firstly {
            movieNetworking.fetcMovie(forIdentifier: self.movie.id, cancellationToken: self.moviesTokenSource?.token)
        }.then { movie -> Void in
            self.output?.onMovieDetailedDataReceived(movie: movie)
        }.catch { error in
            
        }
    }
}
