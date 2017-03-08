//
//  Search.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                              //
// class Search - initial scene of the JiveFlickr app, gathers a search string and asks Flickr for photos that correspond to it //
//                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Search: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var searches = [String]()
    var filteredSearches = [String]()
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                                           //
    // viewDidLoad() - set up the SearchController, which is a manual process at this time. then reload the data //
    //                                                                                                           //
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                                              //
    // filterContentsForSearch() - create the filteredSearches array based on searches filtred by the search string //
    //                                                                                                              //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredSearches = searches.filter {
            word in
            return word.lowercased().containsString(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    ///////////////////////////////////////////
    //                                       //
    // numberOfSections() - always 1 section //
    //                                       //
    ///////////////////////////////////////////

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    ///////////////////////////////////////////////////////////////////////////////
    //                                                                           //
    // numberOfRowsInSection() - return the count of entries in filteredSearches //
    //                                                                           //
    ///////////////////////////////////////////////////////////////////////////////

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearches.count
    }

    ///////////////////////////////////////////////
    //                                           //
    // cellForRowAt() - format the indicated row //
    //                                           //
    ///////////////////////////////////////////////

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel?.text = filteredSearches[indexPath.row]
        return cell
    }
    
    //////////////////////////////////////////////////////////////////////////////////
    //                                                                              //
    // didSelectRowAt() - user selected a row, put its contents into the search bar //
    //                                                                              //
    //////////////////////////////////////////////////////////////////////////////////

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.text = filteredSearches[indexPath.row]
    }

    ///////////////////////////////////////////////////////
    //                                                   //
    // clear() - user clicked the SearchBar clear button //
    //                                                   //
    ///////////////////////////////////////////////////////

    @IBAction func clear(_ sender: Any) {
        Model.sharedInstance.clearSearches()
        searches = [String]()
        filteredSearches = [String]()
    }
    
}

///////////////////////////////////////
//                                   //
// extension UISearchResultsUpdating //
//                                   //
///////////////////////////////////////

extension Search: UISearchResultsUpdating {
    
    ////////////////////////////////////////////////////////////////////////////////
    //                                                                            //
    // updateSearchResults() - the user has changed the contents of the SearchBar //
    //                                                                            //
    ////////////////////////////////////////////////////////////////////////////////

    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
}

///////////////////////////////////
//                               //
// extension UISearchBarDelegate //
//                               //
///////////////////////////////////

extension Search: UISearchBarDelegate {
    
    //////////////////////////////////////////////////////////////////////////////////
    //                                                                              //
    // searchBarSearchButtonClicked() - user clicked the Search key on the keyboard //
    //                                                                              //
    //////////////////////////////////////////////////////////////////////////////////

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!
        searchBar.text = ""
        appendIfMissing(text)
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultsScene") as? Results
        controller?.search = text
        navigationController?.pushViewController(controller!, animated: true)
    }
    
    ///////////////////////////////////////////////////////////////////////////////
    //                                                                           //
    // appendIfMissing() - append a string to searches if it's not already there //
    //                                                                           //
    ///////////////////////////////////////////////////////////////////////////////

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

