//
//  MoviesDataProvider.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

protocol MoviesDataProviderDelegate: class {
    func onMovieSelectedAction(_ index: IndexPath)
}

class MoviesDataProvider: NSObject {

    fileprivate var movies: [MovieInfoRecord]?
    weak var delegate: MoviesDataProviderDelegate?
    
    init(withMovies movies: [MovieInfoRecord], withDelegate delegate: MoviesDataProviderDelegate?) {
        self.movies = movies
        self.delegate = delegate
    }
}

extension MoviesDataProvider: TableViewDataProvider {
    
    func prepare(tableView: UITableView!) {
        
        // Perform additional preparations with table view.
    }
}

extension MoviesDataProvider: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MovieTableViewCell.reusableCell(forTableView: tableView)
        
        if let movieInfo = self.movies?[indexPath.row] {
    
            cell?.titleLabel.text = movieInfo.title
            cell?.originalTitleLabel.text = movieInfo.originalTitle
            cell?.overviewLabel.text = movieInfo.overview
            
            cell?.setRate(movieInfo.rate)
            cell?.setImageLink(movieInfo.coverLink)
        }

        return cell!
    }
}

extension MoviesDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.onMovieSelectedAction(indexPath)
    }
}
