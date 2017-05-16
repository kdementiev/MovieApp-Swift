//
//  PopularMoviesInteractor.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import PromiseKit
import CancellationToken


class PopularMoviesInteractor {

    var output: PopularMoviesInteractorOutput?
    
    // Used services
    var moviesNetworking: MoviesNetworkingServiceProtocol!
    var networkStatusService: NetworkingStatusServiceProtocol!
    
    lazy var moviesTokenSource: CancellationTokenSource? = CancellationTokenSource()
    
    
    fileprivate func cancelNetworkingOperation() {
        moviesTokenSource?.cancel()
        moviesTokenSource = nil
    }
}

extension PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    
    func prepare() {
        
        // Try to load default content.
        self.reload()
        
        // 
        networkStatusService.subscribeForRefreshNetworkingEvent(subscriber: self) { [weak self] (available: Bool) in
            
            if !available {
                self?.output?.onNetworkConnectionLost()
                return
            }
            
            self?.reload()
            self?.output?.onNetworkConnectionRestored()
        }
    }
    
    func reload() {
        
        self.cancelNetworkingOperation()
        
        firstly {
            moviesNetworking.fetchPopularMovies(moviesTokenSource?.token)
        }.then { page -> Void in
            self.output?.onNewContentReceived(page.elements)
        }.catch { error in
        }
    }
    
    func requestMoreContent() {
        // fetch for page..
    }
    
}
