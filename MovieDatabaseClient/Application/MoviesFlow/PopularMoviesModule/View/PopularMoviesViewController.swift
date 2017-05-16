//
//  PopularMoviesViewController.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

class PopularMoviesViewController: UITableViewController {

    var output: PopularMoviesViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Notify presenter layer with ready state.
        self.output?.viewReadyForInteraction()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onRefreshAction(_ sender: Any) {
        self.output?.userWantsLatestContent()
    }
}

extension PopularMoviesViewController: PopularMoviesViewProtocol {
    
    func presentContent(withMovies movies: [MovieInfoRecord]) {
        
        // Apply content to table view.
        self.tableView.contentProvider = MoviesDataProvider(withMovies: movies, withDelegate: self)
        
        // Disable refreshing
        self.refreshControl?.endRefreshing()
    }
    
    func showOfflineState(offline: Bool) {

    }
}

extension PopularMoviesViewController: MoviesDataProviderDelegate {
    
    func onMovieSelectedAction(_ movie: MovieInfoRecord) {
        self.output?.userWantsDetailedInformation(forMovie: movie)
    }
}
