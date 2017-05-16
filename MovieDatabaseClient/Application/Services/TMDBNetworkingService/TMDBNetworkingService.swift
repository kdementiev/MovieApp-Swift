//
//  TMDBNetworkingService.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import PromiseKit
import CancellationToken

import Alamofire
import AlamofireObjectMapper


class TMDBNetworkingService {

    /**
     Offers simplified way to build request from provided data.
    */
    enum Router: URLRequestConvertible {
        
        case popularMovies
        case movie(id: Int)
        
        var route: String {
            switch self {
            case .popularMovies:
                return "movie/popular"
                
            case .movie(let id):
                return "movie/\(id)"
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            
            let url = try TMDBNetworkingService.sharedService.credentials.endpoint.asURL()
            let request = URLRequest(url: url.appendingPathComponent(route))
            
            let params = ["api_key" : TMDBNetworkingService.sharedService.credentials.secret]
            return try URLEncoding.default.encode(request, with: params)
        }
    }
    

    static let sharedService = TMDBNetworkingService()
    
    private(set) var credentials = TMDBCredentials()
    

    fileprivate func migratePage(_ moviesPage: TMDBPageEntity<TMDBMovieEntity>) -> PageRecord<MovieInfoRecord> {
        
        var moviesList = [MovieInfoRecord]()

        if let elements = moviesPage.elements {
            for movieEntity in elements {
                let movie = MovieInfoRecord(movieEntity: movieEntity)
                moviesList.append(movie)
            }
        }
        
        return PageRecord<MovieInfoRecord>(page: 0, totalPages: 0, elements: moviesList)
    }
}

extension TMDBNetworkingService: MoviesNetworkingServiceProtocol {
    
    func fetchPopularMovies(_ cancelltaionToken: CancellationToken?) -> Promise<PageRecord<MovieInfoRecord>> {
        return Promise { fulfill, reject in
            
            let task = Alamofire.request(Router.popularMovies)
                .validate()
                .responseObject { (response: DataResponse<TMDBPageEntity<TMDBMovieEntity>>) in
                    
                    switch response.result {
                    case .success(let page):
                        fulfill( self.migratePage(page) )
                        
                    case .failure(let error):
                        reject(error)
                    }
            }
            
            cancelltaionToken?.register {
                task.cancel()
            }
        }
    }
    
    func fetcMovie(forIdentifier id: Int, cancellationToken: CancellationToken?) -> Promise<MovieInfoRecord> {
        return Promise { fulfill, reject in
            
            let task = Alamofire.request(Router.movie(id: id))
                .validate()
                .responseObject { (response: DataResponse<TMDBMovieEntity>) in
                    
                    switch response.result {
                    case .success(let movie):
                        fulfill(MovieInfoRecord(movieEntity: movie))
                        
                    case .failure(let error):
                        reject(error)
                    }
            }
            
            cancellationToken?.register {
                task.cancel()
            }
        }
    }
}





