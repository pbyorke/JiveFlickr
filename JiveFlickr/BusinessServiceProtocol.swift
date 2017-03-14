//
//  BusinessServiceProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

protocol BusinessServiceProtocol {

    func getSearchesFromDefaults() -> [String]
    func putSearchesToDefaults(_ seaches: [String])
    func clearSearchesFromDefaults()
    func searchAllPhotosFor(string: String, done: @escaping ([Photo])->Void)
    func fetchThumbnailFor(photo: Photo, done: @escaping()->Void)
    func getDetails(photo: Photo, done: @escaping (Photo)->Void)

}
