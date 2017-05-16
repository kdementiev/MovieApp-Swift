//
//  MovieDetailsPresenter.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    
    weak var view: MovieDetailsViewProtocol?
    
    var interactor: MovieDetailsInteractorProtocol?
    var router: MovieDetailsRouterProtocol?
    
    var moduleOutput: MovieDetailsModuleOutputProtocol?
    
    
    // MARK: - View Layer feedback -
    
    func viewReadyForInteraction() {
        
        // Forward event to interactor
        interactor?.prepare()
    }
    
    // MARK: - Interactor Layer feedback -
    
    func onMovieDetailedDataReceived(movie: MovieInfoRecord) {
        view?.present(movie: movie)
    }
    
}
