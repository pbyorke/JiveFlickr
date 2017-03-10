//
//  DataManager.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class DataManager {
    
    func getSearchesFromDefaults() -> [String] {
        let defaults = UserDefaults.standard
        return defaults.stringArray(forKey: "searches") ?? [String]()
    }
    
}
