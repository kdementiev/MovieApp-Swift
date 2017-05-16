//
//  TMDBMovieEntity.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import ObjectMapper


struct TMDBMovieEntity: Mappable {

    var id: Int?
    
    var posterPath: String?
    var backdropPath: String?
    
    var overview: String?
    var releaseDate: String?
    
    var originalTitle: String?
    var originalLanguage: String?
    
    var homeLink: String?
    
    var voteAverage: Float?
    var voteCount: Int?
    
    var budget: Int?

    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        
        posterPath <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
        
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        
        originalTitle <- map["original_title"]
        originalLanguage <- map["original_language"]
        
        budget <- map["budget"]
        
        homeLink <- map["home_link"]
        
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
}
