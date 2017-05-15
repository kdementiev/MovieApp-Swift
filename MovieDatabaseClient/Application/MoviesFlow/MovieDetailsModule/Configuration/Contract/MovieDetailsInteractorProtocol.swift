//
//  MovieDetailsInteractorProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorOutput: class {
    
}

protocol MovieDetailsInteractorProtocol: class {
    weak var output: MovieDetailsInteractorOutput? { get set }
    
    /**
        Method offered to perform initial preparations inside interactor.
     */
    func prepare()
}
