//
//  PopularMoviesInteractorProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol PopularMoviesInteractorOutput: class {
    
    func onNewContentReceived(_ movies: [MovieInfoRecord])
    
    func onNetworkConnectionLost()
    func onNetworkConnectionRestored()
}

protocol PopularMoviesInteractorProtocol: class {
    weak var output: PopularMoviesInteractorOutput? { get set }
    
    /**
        Method offered to perform initial preparations inside interactor.
     */
    func prepare()
    
    func reload()
    func requestMoreContent()
}
