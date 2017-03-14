//
//  ResultsViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

// MARK: - ResultsViewPresenter class

class ResultsViewPresenter: NSObject, ResultsViewPresenterProtocol {
    
    fileprivate var businessService: BusinessService!
    fileprivate var navigationHandler: NavigationHandler!
    var viewController: ResultsViewController!
    fileprivate var photos: [Photo]!
    
    required init(businessService: BusinessService, navigationHandler: NavigationHandler, photos: [Photo]) {
        super.init()
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        viewController = ResultsViewController()
        viewController.presenter = self
        self.photos = photos
    }
    
}

// MARK: UITableViewDataSource extension

extension ResultsViewPresenter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsViewCell!
        let photo = photos[indexPath.row]
        businessService.fetchThumbnailFor(photo: photo) {
            DispatchQueue.main.async {
                if let cell = cell {
                    cell.data.text = photo.title
                    cell.photo.image = photo.thumbnail
                }
            }
        }
        return cell!
    }
    
}

// MARK: - UITableViewDelegate extension

extension ResultsViewPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.spin(true)
        businessService.getDetails(photo: photos[indexPath.row]) {
            photo in
            DispatchQueue.main.async {
                if let nav = self.viewController.navigationController {
                    self.viewController.spin(false)
                    self.navigationHandler.makeAndShowDetailsViewPresenter(nav: nav, title: self.viewController.title!, photo: photo)
                }
            }
        }
    }

}
