//
//  SearchInteractor.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class SearchInteractor {}

extension SearchInteractor: SearchInteractorProtocol {

    func getSearches() -> [String] {
        return DataManager().getSearchesFromDefaults()
    }

}
