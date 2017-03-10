//
//  ResultsViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

// MARK: - ResultsViewPresenter class

class ResultsViewPresenter: NSObject {
    
    lazy var controller: ResultsViewController = ResultsViewController()
    var navigationHandler: SearchNavigationHandler!
    var search = ""
    var photos: [Photo]!
    
    override init() {
        super.init()
        print("ResultsViewPresenter.init()")
        controller.presenter = self
        controller.title = search
//        controller.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        controller.tableView.delegate = self
//        controller.tableView.dataSource = self
    }
    
}

// MARK: UITableViewDataSource extension

extension ResultsViewPresenter {}

// MARK: - UITableViewDelegate extension

extension ResultsViewPresenter {}
