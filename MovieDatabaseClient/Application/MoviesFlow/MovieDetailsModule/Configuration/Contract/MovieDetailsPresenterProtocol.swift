//
//  MovieDetailsPresenterProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterProtocol: MovieDetailsViewOutput, MovieDetailsInteractorOutput, MovieDetailsModuleInputProtocol {
    
    weak var view: MovieDetailsViewProtocol? { get set }
    
    var interactor: MovieDetailsInteractorProtocol? { get set }
    var router: MovieDetailsRouterProtocol? { get set }
    
    var moduleOutput: MovieDetailsModuleOutputProtocol? { get set }
}
