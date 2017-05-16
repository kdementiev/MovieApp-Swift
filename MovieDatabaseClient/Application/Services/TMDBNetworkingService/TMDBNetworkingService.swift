//
//  TMDBNetworkingService.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import PromiseKit
import CancellationToken


class TMDBNetworkingService {

    static let sharedService = TMDBNetworkingService()
    
}

extension TMDBNetworkingService: MoviesNetworkingServiceProtocol {
    
    func fetchPopularMovies(_ cancelltaionToken: CancellationToken?) -> Promise<PageRecord<MovieInfoRecord>> {
        return Promise { fulfill, reject in
            
        }
    }
    
    func fetcMovie(forIdentifier id: Int, cancellationToken: CancellationToken?) -> Promise<MovieInfoRecord> {
        return Promise { fulfill, reject in
            
        }
    }
}
