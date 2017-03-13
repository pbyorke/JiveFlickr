//
//  SearchViewPresenterProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

protocol SearchViewPresenterProtocol: class, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    init(businessService: BusinessService, navigationHandler: NavigationHandler)
    func clear()

}
