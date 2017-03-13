//
//  NavigationHandler.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                      //
// VIPER                                                                                                //
//                                                                                                      //
// The NavigationHandler handles all navigation from screen to screen. Its methods are called by the    //
// various Presenters. If data needs to be provided to the new ViewController, the NavigationHandler    //
// will obtain the data from the BusinessService and pass it to the new Presenter                       //
//                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////

class NavigationHandler {
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                                  //
    // VIPER                                                                                            //
    //                                                                                                  //
    // We are going to keep a reference to the Singleton BusinessService object that we can pass, with  //
    // a pointer to ourself, to new Presenters                                                          //
    //                                                                                                  //
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    var businessService: BusinessService
    
    init(businessService: BusinessService) {
        self.businessService = businessService
    }
    
}

extension NavigationHandler: NavigationHandlerProtocol {

    func giveMeANewSearchViewPresenter() -> SearchViewPresenter {
        return SearchViewPresenter(businessService: businessService, navigationHandler: self)
    }

    func makeAndShowResultsViewPresenter(nav: UINavigationController, title: String, photos: [Photo]) {
        let viewPresenter = ResultsViewPresenter(photos: photos, businessService: businessService, navigationHandler: self)
        if let viewController = viewPresenter.viewController {
            viewController.title = title
            nav.pushViewController(viewController, animated: true)
        }
    }

    func makeAndShowDetailsViewPresenter(nav: UINavigationController, title: String, photo: Photo) {
        let viewPresenter = DetailsViewPresenter(businessService: self.businessService, navigationHandler: self, photo: photo)
        if let viewController = viewPresenter.viewController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    
}
