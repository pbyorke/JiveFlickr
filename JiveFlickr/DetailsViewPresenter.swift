//
//  DetailsViewPresenter.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/13/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class DetailsViewPresenter: NSObject, DetailsViewPresenterProtocol {
    
    fileprivate var businessService: BusinessService!
    fileprivate var navigationHandler: NavigationHandler!
    var viewController: DetailsViewController!
    
    required init(businessService: BusinessService, navigationHandler: NavigationHandler, photo: Photo) {
        super.init()
        self.businessService = businessService
        self.navigationHandler = navigationHandler
        viewController = DetailsViewController()
        viewController.presenter = self
        viewController.setPicture(photo.image!)
        viewController.setExplanation(photo.title)
        viewController.setTaken(photo.taken)
        
    }
    
}
