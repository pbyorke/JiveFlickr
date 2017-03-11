//
//  ResultsViewController.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var presenter: ResultsViewPresenter!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - Fill in the UI elements
    
    private func prepareUI() {
    }
    
}
