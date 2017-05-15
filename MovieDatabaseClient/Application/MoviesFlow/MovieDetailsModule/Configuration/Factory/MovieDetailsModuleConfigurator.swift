//
//  MovieDetailsModuleConfigurator.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

class MovieDetailsModuleConfigurator {
    
    static func configurateModule(view: MovieDetailsViewProtocol?, delegate: MovieDetailsModuleOutputProtocol?)
        -> (view: UIViewController?, module: MovieDetailsModuleInputProtocol?) {
        
        assert(view != nil, "Please, provide view instance.")
        
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        
        view?.output = presenter
        
        interactor.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        presenter.moduleOutput = delegate
        
        router.viewController = view as? UIViewController
        
        return (router.viewController, presenter)
    }
}

