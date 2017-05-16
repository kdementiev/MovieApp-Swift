//
//  NetworkingStatusService.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import Foundation
import UIKit


class NetworkingStatusService {

    static let sharedService = NetworkingStatusService()
    
    
    init() {
        self.subscribeForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func subscribeForNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillRise(_:)),
                                               name: .UIApplicationWillEnterForeground,
                                               object: nil)
    }
    
    @objc func applicationWillRise(_ notification: Notification) {
        
    }
    
    fileprivate func notifySubscribers() {
    
    }
}

extension NetworkingStatusService: NetworkingStatusServiceProtocol {

    func subscribeForRefreshNetworkingEvent(subscriber: AnyObject, callback: @escaping NetworkingStatusServiceStatusCallback) {
        

        
    }
    
    func remove(subscriber: AnyObject) {
    
    }
}
