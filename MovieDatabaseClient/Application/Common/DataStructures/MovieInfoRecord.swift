//
//  MovieInfoRecord.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

struct MovieInfoRecord {
    
    var id: Int
    
    var title: String?
    var originalTitle: String?
    
    var overview: String?
    var releaseData: String?
    
    var rate: Float
    
    var votes: Int
    var budget: Int
    
    var homeLink: String?
    
    var posterLink: String?
    var coverLink: String?
}
