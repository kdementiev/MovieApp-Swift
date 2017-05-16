//
//  NetworkingStatusServiceProtocol.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation


typealias NetworkingStatusServiceStatusCallback = (_ networkAvailable: Bool) -> Void

/**
 Offers interface to handle network refreshing events.
 */
protocol NetworkingStatusServiceProtocol: class {
    
    /**
     Allows subscriber to be notified with evenet when it need to reload data from network etc.
     If subscriber dies, 'callback' block will be removed automatically.
     - parameter subscriber: Subscriber object.
     - parameter callback: Callback that will be called when event will occure.
     */
    func subscribeForRefreshNetworkingEvent(subscriber: AnyObject, callback: @escaping NetworkingStatusServiceStatusCallback)
    
    /**
     Offers ability to unsubscribe.
     - parameter subscriber:
    */
    func remove(subscriber: AnyObject)
}
