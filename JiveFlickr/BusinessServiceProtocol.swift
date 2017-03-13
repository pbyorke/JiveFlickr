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
    func searchAll(_ string: String, done: @escaping ([Photo])->Void)
    func fetchThumbnail(photo: Photo, done: @escaping()->Void)

}
