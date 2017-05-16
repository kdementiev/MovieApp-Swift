//
//  MovieDetailsInteractor.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    var output: MovieDetailsInteractorOutput?
    
    private var movie: MovieInfoRecord
    
    init(movie: MovieInfoRecord) {
        self.movie = movie
    }
    
    func prepare() {
        
    }
}
