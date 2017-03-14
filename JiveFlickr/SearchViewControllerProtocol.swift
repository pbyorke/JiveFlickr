//
//  SearchViewControllerProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/14/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

protocol SearchViewControllerProtocol {
    
    func reloadData()
    func spin(_ on: Bool)
    func setSearchText(_ text: String)
    
}
