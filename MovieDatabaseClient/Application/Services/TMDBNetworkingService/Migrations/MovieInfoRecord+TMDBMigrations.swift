//
//  MovieInfoRecord+TMDBMigrations.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

extension MovieInfoRecord {
    
    init(movieEntity: TMDBMovieEntity) {
        
        id = movieEntity.id ?? 0
        
        title = movieEntity.originalTitle
        originalTitle = movieEntity.originalTitle
        
        coverLink = "https://image.tmdb.org/t/p/w780\(movieEntity.backdropPath ?? "")"
        posterLink = "https://image.tmdb.org/t/p/w500\(movieEntity.posterPath ?? "")"
        
        overview = movieEntity.overview
        rate = movieEntity.voteAverage ?? 0
        
        releaseData = movieEntity.releaseDate
        
        votes = 0
        budget = 0
        homeLink = ""
    }
}
