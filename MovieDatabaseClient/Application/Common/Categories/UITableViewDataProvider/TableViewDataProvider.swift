//
//  TableViewDataProvider.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

protocol TableViewDataProvider: UITableViewDelegate, UITableViewDataSource {

    /**
        Offers event to prepare custom data provider.
     */
    func prepare(tableView: UITableView!)
}

extension TableViewDataProvider {
    
    /**
        Use offered method to reload UITableView content.
        Override this method to perform you own customization.
    */
    func reloadData(_ tableView: UITableView!) {
        let sections = NSIndexSet(indexesIn: NSMakeRange(0, tableView.numberOfSections))
        tableView.reloadSections(sections as IndexSet, with: .automatic)
    }
}
