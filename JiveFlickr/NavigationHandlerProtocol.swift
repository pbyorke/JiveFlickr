//
//  NavigationHandlerProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

protocol NavigationHandlerProtocol {

    func giveMeANewSearchViewPresenter() -> SearchViewPresenter
    func makeAndShowResultsViewPresenter(nav: UINavigationController, title: String, photos: [Photo])
    
}
