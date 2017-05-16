//
//  NetworkingStatusService.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation

class NetworkingStatusService {

    static let sharedService = NetworkingStatusService()
}

extension NetworkingStatusService: NetworkingStatusServiceProtocol {

    func subscribeForRefreshNetworkingEvent(subscriber: AnyObject, callback: @escaping NetworkingStatusServiceStatusCallback) {
        
    }
    
    func remove(subscriber: AnyObject) {
        
    }
}
