//
//  PopularMoviesRouterProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol PopularMoviesRouterProtocol: class {
    
    func navigateToMovieDetails(withMovie movie: MovieInfoRecord)
    
}
