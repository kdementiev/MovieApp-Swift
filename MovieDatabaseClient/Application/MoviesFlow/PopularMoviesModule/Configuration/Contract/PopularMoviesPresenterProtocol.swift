//
//  PopularMoviesPresenterProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol PopularMoviesPresenterProtocol: PopularMoviesViewOutput, PopularMoviesInteractorOutput, PopularMoviesModuleInputProtocol {
    
    weak var view: PopularMoviesViewProtocol? { get set }
    
    var interactor: PopularMoviesInteractorProtocol? { get set }
    var router: PopularMoviesRouterProtocol? { get set }
    
    var moduleOutput: PopularMoviesModuleOutputProtocol? { get set }
}
