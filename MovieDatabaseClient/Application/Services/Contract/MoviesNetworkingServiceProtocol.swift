//
//  MoviesNetworkingService.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import PromiseKit
import CancellationToken


struct PageRecord<Element> {
    
    var page: Int
    var totalPages: Int
    var results: Int
    
    var elements: [Element]
}

/**
    Offers interface to interact with remote API.
 */
protocol MoviesNetworkingServiceProtocol: class {
    
    /**
     Offers simplified way to fetch popular movies list from remote server.
     - parameter cancelltaionToken: Token helps client with async task cancellation.
     - returns: A promise that describe result of request
    */
    func fetchPopularMovies(_ cancelltaionToken: CancellationToken?) -> Promise<PageRecord<MovieInfoRecord>>
    
    /**
     Offers ability to fetch detailed information for a specific movie by id.
     - parameter id: Movie identifier.
     - parameter cancelltaionToken: Token helps client with async task cancellation.
     - returns: A promise that describe result of request
    */
    func fetcMovie(forIdentifier id: Int, cancellationToken: CancellationToken?) -> Promise<MovieInfoRecord>
}
