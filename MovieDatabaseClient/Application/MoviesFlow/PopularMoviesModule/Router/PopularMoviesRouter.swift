//
//  PopularMoviesRouter.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit
import PrettySegue

class PopularMoviesRouter: PopularMoviesRouterProtocol {
    weak var viewController: UIViewController?
    
    func navigateToMovieDetails(withMovie movie: MovieInfoRecord) {
        
        let segueIdentifier = UIStoryboard.popularMoviesToMovieDetailsSegueIdentifier()
        
        viewController?.performSegue(withIdentifier: segueIdentifier, sender: nil) { (controller) -> (Void) in
            
            if let view = controller as? MovieDetailsViewProtocol {
                MovieDetailsModuleConfigurator.configurateModule(view: view, delegate: nil, movie: movie)
            }
        }
    }
}
