//
//  UITableViewCell+Usability.swift
//  MovieDatabaseClient
//
//  Created by Konstantin Dementiev on 5/16/17.
//  Copyright © 2017 Konstantine Dementiev. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class func registerCell(tableView: UITableView) {
        let className = String(describing: self)
        let cellNib = UINib(nibName: className, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: className)
    }
    
    class func reusableCell(forTableView tableView: UITableView) -> Self? {
        return reusableCell(type:self, tableView: tableView)
    }
    
    private class func reusableCell<T>(type: T.Type, tableView: UITableView) -> T? {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: self)) as? T
    }
}

