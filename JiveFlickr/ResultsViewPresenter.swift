//
//  ResultsViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

// MARK: - ResultsViewPresenter class

class ResultsViewPresenter: NSObject {
    
    var businessService: BusinessService!
    var navigationHandler: NavigationHandler!
    var viewController: ResultsViewController!
    var photos: [Photo]!
    
    required init(businessService: BusinessService, navigationHandler: NavigationHandler) {
        super.init()
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        viewController = ResultsViewController()
        viewController.presenter = self
        viewController.table.register(ResultsViewCell.self, forCellReuseIdentifier: "ResultsCell")
        viewController.table.delegate = self
        viewController.table.dataSource = self
    }
    
}

// MARK: - SearchViewPresenterProtocol extension

extension ResultsViewPresenter: ResultsViewPresenterProtocol {}

// MARK: UITableViewDataSource extension

extension ResultsViewPresenter {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewController.table.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsViewCell!
        let photo = photos[indexPath.row]
        businessService.fetchThumbnail(photo: photo) {
            DispatchQueue.main.async {
                if let cell = cell {
                    cell.data.text = photo.title
                    cell.photo.image = photo.thumbnail
                }
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
}

// MARK: - UITableViewDelegate extension

extension ResultsViewPresenter {}
