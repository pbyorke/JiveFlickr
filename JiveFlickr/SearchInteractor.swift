//
//  SearchInteractor.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class SearchInteractor {

    var dataManager: DataManager!

    init() {
        print("SearchInteractor.init()")
        self.dataManager = DataManager()
    }

}

extension SearchInteractor: SearchInteractorProtocol {

    func getSearches() -> [String] {
        return DataManager().getSearchesFromDefaults()
    }

    func getPhotos(_ string: String, done: @escaping ([Photo])->Void) {
        return dataManager.searchAll(string) {
            photos in
            done(photos)
        }
    }
    
}
