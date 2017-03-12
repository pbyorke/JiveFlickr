//
//  SearchViewPresenter.swift
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
// The Presenter does all the heavy lifting for the ViewController, making the ViewController pretty    //
// dumb. This heavy lifting includes being a Delegate when needed. The Presenter obtains information    //
// from fields in the ViewController as needed, as well as sending information back to it. The          //
// Presenter has access to both the BusinessService and the NavigationHandler so that it can instigate  //
// transfers to other screens and send needed data with it                                              //
//                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// MARK: - SearchViewPresenter class

class SearchViewPresenter: NSObject {
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                                  //
    // VIPER                                                                                            //
    //                                                                                                  //
    // We are passed a reference to the Singleton BusinessService and the Singleton NavigationHandler   //
    // and will keep them around for future use. We can also create a SearchViewController because      //
    // we have a 1:1 relationship with it                                                               //
    //                                                                                                  //
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    var businessService: BusinessService!
    var navigationHandler: NavigationHandler!
    var viewController: SearchViewController!
    
    var searches = [String]()
    var filteredSearches = [String]()

    required init(businessService: BusinessService, navigationHandler: NavigationHandler) {
        super.init()
        
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        
        viewController = SearchViewController()
        viewController.presenter = self
        viewController.table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewController.table.delegate = self
        viewController.table.dataSource = self
        
        searches = businessService.getSearchesFromDefaults()
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
        let cell = viewController.table.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell?.textLabel?.text = filteredSearches[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearches.count
    }
    
    fileprivate func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearches = searches.filter {
            word in
            return word.lowercased().containsString(searchText.lowercased())
        }
        viewController.table.reloadData()
    }
    
}

// MARK: - UITableViewDelegate extension

extension SearchViewPresenter {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.searchController.searchBar.text = filteredSearches[indexPath.row]
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
        self.viewController.spinner.isHidden = false
        businessService.searchAll(text) {
            photos in
            if let nav = self.viewController.navigationController {
                self.viewController.spinner.isHidden = true
                self.navigationHandler.makeAndShowResultsViewPresenter(nav: nav, title: text, photos: photos)
            }
        }
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
