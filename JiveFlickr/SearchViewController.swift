//
//  SearchViewController.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                      //
// VIPER                                                                                                //
//                                                                                                      //
// The only thing we will ever need to talk to is our Presenter. Our Presenter, when it creates us,     //
// passes us a reference to itself, which we keep for future use                                        //
//                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////

class SearchViewController: UITableViewController {
    
    var presenter: SearchViewPresenter!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
