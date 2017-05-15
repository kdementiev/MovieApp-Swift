//
//  MovieDetailsViewProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol MovieDetailsViewOutput: class {
    
    /**
        Called when view loaded and ready for data.
    */
    func viewReadyForInteraction()
}

protocol MovieDetailsViewProtocol: class {
    var output: MovieDetailsViewOutput? { get set }
    
}
