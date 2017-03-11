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
    
    var businessService: BusinessService!
    var navigationHandler: NavigationHandler!
    var viewController: ResultsViewController!
    var search = ""
    var photos: [Photo]!
    
    init(businessService: BusinessService, navigationHandler: NavigationHandler) {
        super.init()
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        viewController = ResultsViewController()
        viewController.presenter = self
    }
    
}

// MARK: UITableViewDataSource extension

extension ResultsViewPresenter {}

// MARK: - UITableViewDelegate extension

extension ResultsViewPresenter {}
