//
//  TMDBPageEntity.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import ObjectMapper


struct TMDBPageEntity<Element: Mappable>: Mappable {

    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    
    var elements: [Element]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        page <- map["page"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
        
        elements <- map["results"]
    }
}
