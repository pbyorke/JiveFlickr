//
//  ResultsViewPresenterProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

protocol ResultsViewPresenterProtocol: class {

    init(businessService: BusinessService, navigationHandler: NavigationHandler, photos: [Photo])

}
