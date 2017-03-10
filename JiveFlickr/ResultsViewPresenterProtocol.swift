//
//  ResultsViewPresenterProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

protocol ResultsViewPresenterProtocol: class, UITableViewDataSource, UITableViewDelegate {

    var search: String { get set }
    var photos: [Photo] { get set }
    
}