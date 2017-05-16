//
//  TMDBCredentials.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation


class TMDBCredentials {

    var endpoint: String
    var secret: String
    
    private struct InfoPlist {
        
        static let SetingsKey = "TheMovieDatabaseAuthSettings"
        
        static let Endpoint = "APIDomain"
        static let Secret = "APIKey"
    }
    
    init() {
        let plist = Bundle.main.object(forInfoDictionaryKey: InfoPlist.SetingsKey) as? [String : String]
        
        assert(plist != nil, "Please provide TMDB API Credentials in your Info.plist. Se more: https://developers.themoviedb.org/3/getting-started")
        
        endpoint = plist?[InfoPlist.Endpoint] ?? ""
        secret = plist?[InfoPlist.Secret] ?? ""
    }
}
