//
//  PopularMoviesInteractorProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol PopularMoviesInteractorOutput: class {
    
}

protocol PopularMoviesInteractorProtocol: class {
    weak var output: PopularMoviesInteractorOutput? { get set }
    
    /**
        Method offered to perform initial preparations inside interactor.
     */
    func prepare()
}
