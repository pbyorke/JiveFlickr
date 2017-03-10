//
//  SearchInteractorProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

protocol SearchInteractorProtocol {

    func getSearches() -> [String]
    func getPhotos(_ string: String, done: @escaping ([Photo])->Void)

}
