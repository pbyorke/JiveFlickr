//
//  SearchViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class SearchViewPresenter: NSObject {

    override init(){}

}

// MARK: - SearchViewPresenterProtocol extension

extension SearchViewPresenter: SearchViewPresenterProtocol {}

// MARK: - UITableViewDataSource extension

extension SearchViewPresenter {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
}

// MARK: - UITableViewDelegate extensioni

extension SearchViewPresenterProtocol {}
