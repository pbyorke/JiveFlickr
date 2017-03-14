//
//  DetailsViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/13/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class DetailsViewPresenter: NSObject {
    
    fileprivate var businessService: BusinessService!
    fileprivate var navigationHandler: NavigationHandler!
    var viewController: DetailsViewController!
    
    required init(businessService: BusinessService, navigationHandler: NavigationHandler, photo: Photo) {
        super.init()
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        viewController = DetailsViewController()
        viewController.presenter = self
        viewController.picture.image = photo.image
        viewController.explanation.text = photo.title
        viewController.taken.text = photo.taken
    }
    
}

// MARK: - DetailsViewPresenterProtocol extension

extension DetailsViewPresenter: DetailsViewPresenterProtocol {}

