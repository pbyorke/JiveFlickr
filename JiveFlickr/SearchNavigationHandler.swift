//
//  SearchNavigationHandler.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class SearchNavigationHandler {
    
    var search: SearchViewPresenter {
        let presenter = SearchViewPresenter()
        presenter.navigationHandler = self
        return presenter}
    var results: ResultsViewPresenter {
        let presenter = ResultsViewPresenter()
        presenter.navigationHandler = self
        return presenter}
    var interactor: SearchInteractor
    
    init() {
        print("SearchNavigatorHandler.init()")
        interactor = SearchInteractor()
    }
    
}

extension SearchNavigationHandler: SearchNavigationHandlerProtocol {

    func getResults(_ search: String, nav: UINavigationController) {
        interactor.getPhotos(search) {
            photos in
            let results = self.results
            results.photos = photos
            results.search = search
            nav.pushViewController(results.controller, animated: true)
        }
    }
    
}
