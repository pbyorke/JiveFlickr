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

class SearchViewController: UIViewController {
    
    var presenter: SearchViewPresenter!
    
    // MARK: - Widgets
    
    let searchController = UISearchController(searchResultsController: nil)
    let table: UITableView = {
        let widget = UITableView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        return widget
    }()
    let spinner: UIView = {
        let widget = UIView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        widget.isHidden = true
        return widget
    }()
    private let activity: UIActivityIndicatorView = {
        let widget = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.startAnimating()
        return widget
    }()
    let clearButton: UIBarButtonItem = {
        let widget = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearSearches))
        return widget
    }()
    
    // MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flickr Search"
        prepareUI()
    }
    
    // MARK: - Targets
    
    func clearSearches() {
        presenter.clear()
    }
    
    // MARK: - Fill in the UI elements
    
    private func prepareUI() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearSearches))
        
        searchController.searchResultsUpdater = presenter
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        definesPresentationContext = true
        
        view.addSubview(table)
        table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        table.tableHeaderView = searchController.searchBar
        
        view.addSubview(spinner)
        spinner.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        spinner.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        spinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        spinner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        spinner.addSubview(activity)
        activity.centerXAnchor.constraint(equalTo: spinner.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: spinner.centerYAnchor).isActive = true
    }
    
}

extension SearchViewController: SearchViewControllerProtocol {}
