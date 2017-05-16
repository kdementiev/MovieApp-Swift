//
//  PopularMoviesPresenter.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

class PopularMoviesPresenter: PopularMoviesPresenterProtocol {
    
    weak var view: PopularMoviesViewProtocol?
    
    var interactor: PopularMoviesInteractorProtocol?
    var router: PopularMoviesRouterProtocol?
    
    var moduleOutput: PopularMoviesModuleOutputProtocol?
    
    
    // MARK: - View Layer feedback -
    
    func viewReadyForInteraction() {
        
        // Forward event to interactor
        interactor?.prepare()
    }
    
    func userWantsLatestContent() {
        
    }
    
    func userWantsDetailedInformation(withItemAtIndex index: Int) {
        
    }
    
    // MARK: - Interactor Layer feedback -
    
    func onNewContentReceived(_ movies: [MovieInfoRecord]) {
        
    }
    
    func onNetworkConnectionLost() {
        
    }
    
    func onNetworkConnectionRestored() {
        
    }
    
}
