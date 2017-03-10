//
//  SearchViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class SearchViewPresenter: NSObject {
    
    var searchViewController = SearchViewController()
    var searches = [String]()
    var filteredSearches = [String]()

    override init() {
        super.init()
        searchViewController.presenter = self
        searches = SearchInteractor().getSearches()
        searchViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchViewController.tableView.delegate = self
        searchViewController.tableView.dataSource = self
    }

}

// MARK: - SearchViewPresenterProtocol extension

extension SearchViewPresenter: SearchViewPresenterProtocol {}

// MARK: - UITableViewDataSource extension

extension SearchViewPresenter {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchViewController.tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell?.textLabel?.text = searches[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }
    
}

// MARK: - UITableViewDelegate extensioni

extension SearchViewPresenterProtocol {}
