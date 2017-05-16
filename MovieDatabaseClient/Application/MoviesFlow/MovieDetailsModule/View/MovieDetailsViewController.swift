//
//  MovieDetailsViewController.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/15/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var output: MovieDetailsViewOutput?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Notify presenter layer with ready state.
        self.output?.viewReadyForInteraction()
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func applyContent(fromMovie movie: MovieInfoRecord) {
        
        self.navigationItem.title = movie.title
        
        titleLabel.text = movie.originalTitle
        releaseDateLabel.text = movie.releaseData
        
        overviewLabel.text = movie.overview
        
        if let link = movie.posterLink {
            backgroundImageView.sd_setImage(with: URL(string: link) )
        }
    }
}

extension MovieDetailsViewController: MovieDetailsViewProtocol {
    
    func present(movie: MovieInfoRecord) {
        self.applyContent(fromMovie: movie)
    }
}
