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
        cell?.textLabel?.text = filteredSearches[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearches.count
    }
    
    internal func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearches = searches.filter {
            word in
            return word.lowercased().containsString(searchText.lowercased())
        }
        searchViewController.tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate extension

extension SearchViewPresenter {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchViewController.searchController.searchBar.text = filteredSearches[indexPath.row]
    }
    
}

// MARK: - UISearchResultsUpdating extension

extension SearchViewPresenter {
    
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
}

// MARK: - UISearchBarDelegate extension

extension SearchViewPresenter {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!
        searchBar.text = ""
        appendIfMissing(text)
//        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultsScene") as? Results
//        controller?.search = text
//        navigationController?.pushViewController(controller!, animated: true)
    }
    
    private func appendIfMissing(_ text: String) {
        for word in searches {
            if word.lowercased() == text.lowercased() {
                return
            }
        }
        searches.append(text.lowercased())
        searches.sort()
        Model.sharedInstance.putSearches(searches)
    }
    
}
