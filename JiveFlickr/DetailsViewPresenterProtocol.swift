//
//  DetailsViewPresenterProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/13/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

protocol DetailsViewPresenterProtocol: class {
    
    init(businessService: BusinessService, navigationHandler: NavigationHandler, photo: Photo)
    
}

