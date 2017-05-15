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
    
    
    func viewReadyForInteraction() {
        
        // Forward event to interactor
        interactor?.prepare()
    }
}
