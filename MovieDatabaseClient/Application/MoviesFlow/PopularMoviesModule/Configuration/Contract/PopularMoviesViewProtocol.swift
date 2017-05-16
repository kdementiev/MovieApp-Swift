//
//  PopularMoviesViewProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol PopularMoviesViewOutput: class {
    
    /**
        Called when view loaded and ready for data.
    */
    func viewReadyForInteraction()
    
    func userWantsLatestContent()
    func userWantsDetailedInformation(withItemAtIndex index: Int)
}

protocol PopularMoviesViewProtocol: class {
    
    var output: PopularMoviesViewOutput? { get set }
    
    func presentContent(withMovies movies: [MovieInfoRecord])
    func showOfflineState(offline: Bool)
}
