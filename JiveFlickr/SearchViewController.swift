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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flickr Search"
    }

}

extension SearchViewController: SearchViewControllerProtocol {}
