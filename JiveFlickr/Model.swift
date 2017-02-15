//
//  Model.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class Model {
    
    static var sharedInstance = Model()
    
    func getSearches() -> [String] {
        let defaults = UserDefaults.standard
        return defaults.stringArray(forKey: "searches") ?? [String]()
    }
    
    func putSearches(_ seaches: [String]) {
        let defaults = UserDefaults.standard
        defaults.set(seaches, forKey: "searches")
        defaults.synchronize()
    }
    
//    func clearSearches() {
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "searches")
//        defaults.synchronize()
//    }
    
}
