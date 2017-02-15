//
//  Search.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class Search: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var searches = [String]()
    var filteredSearches = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searches = Model.sharedInstance.getSearches()
        tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearches = searches.filter {
            word in
            return word.lowercased().containsString(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel?.text = filteredSearches[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.text = filteredSearches[indexPath.row]
    }

    @IBAction func clear(_ sender: Any) {
        Model.sharedInstance.clearSearches()
        searches = [String]()
        filteredSearches = [String]()
    }
    
}

extension Search: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

extension Search: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!
        searchBar.text = ""
        appendIfMissing(text)
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultsScene") as? Results
        controller?.search = text
        navigationController?.pushViewController(controller!, animated: true)
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

