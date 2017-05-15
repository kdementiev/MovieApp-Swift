//
//  PopularMoviesModuleConfigurator.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

class PopularMoviesModuleConfigurator {
    
    static func configurateModule(view: PopularMoviesViewProtocol?, delegate: PopularMoviesModuleOutputProtocol?)
        -> (view: UIViewController?, module: PopularMoviesModuleInputProtocol?) {
        
        assert(view != nil, "Please, provide view instance.")
        
        let interactor = PopularMoviesInteractor()
        let presenter = PopularMoviesPresenter()
        let router = PopularMoviesRouter()
        
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

