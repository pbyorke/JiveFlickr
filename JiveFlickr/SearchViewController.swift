//
//  SearchViewController.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    var presenter: SearchViewPresenter!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SearchViewController.viewDidLoad()")
        title = "Flickr Search"
        prepareUI()
    }
    
    // MARK: - Fill in the UI elements
    
    private func prepareUI() {
        searchController.searchResultsUpdater = presenter
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
//        searches = Model.sharedInstance.getSearches()
//        tableView.reloadData()
    }

}

extension SearchViewController: SearchViewControllerProtocol {}
