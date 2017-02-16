//
//  Model.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

////////////////////////////////////////////////////////////////
//                                                            //
// class Model - handle all of the data-related functionality //
//                                                            //
////////////////////////////////////////////////////////////////

class Model {
    
    static var sharedInstance = Model() // singleton
    let server = Server.sharedInstance
    
    //////////////////////////////////////////////////////////////////////////////////
    //                                                                              //
    // getSearches() - get the array of used search strings from persistent storage //
    //                                                                              //
    //////////////////////////////////////////////////////////////////////////////////

    func getSearches() -> [String] {
        let defaults = UserDefaults.standard
        return defaults.stringArray(forKey: "searches") ?? [String]()
    }
    
    //////////////////////////////////////////////////////////////////////////////////
    //                                                                              //
    // putSearches() - put the array of used search strings into persistent storage //
    //                                                                              //
    //////////////////////////////////////////////////////////////////////////////////

    func putSearches(_ seaches: [String]) {
        let defaults = UserDefaults.standard
        defaults.set(seaches, forKey: "searches")
        defaults.synchronize()
    }
    
    //////////////////////////////////////////////////////////////////////
    //                                                                  //
    // clearSearches() - clear persisten storage of used search strings //
    //                                                                  //
    //////////////////////////////////////////////////////////////////////

    func clearSearches() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "searches")
        defaults.synchronize()
    }
    
    ///////////////////////////////////////////////////////////////////
    //                                                               //
    // searchAll() - search for all the flickr entries for a keyword //
    //                                                               //
    ///////////////////////////////////////////////////////////////////

    func searchAll(_ string: String, done: @escaping ([Photo])->Void) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b3380a67070b4cb848414a17c9b58433&tags=\(string)&per_page=100&format=json&nojsoncallback=1"
        server.fetch(urlString) {
            data in
            var photoArray = [Photo]()
            if let object = data["photos"] as? [String:Any] {
                if let photos = object["photo"] as? [[String:Any]] {
                    for photo in photos {
                        let newPhoto = Photo()
                        newPhoto.farm = photo["farm"] as? Int ?? 0
                        newPhoto.id = photo["id"] as? String ?? ""
                        newPhoto.server = photo["server"] as? String ?? ""
                        newPhoto.secret = photo["secret"] as? String ?? ""
                        newPhoto.title = photo["title"] as? String ?? ""
                        photoArray.append(newPhoto)
                    }
                    done(photoArray)
                }
            }
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////
    //                                                                       //
    // getPhoto() - go out to Flickr to retrieve a thumbnail, or, if we have //
    //              cached one, return it                                    //
    //                                                                       //
    ///////////////////////////////////////////////////////////////////////////

//    func getThumbnail(photo: Photo, done: @escaping (UIImage)->Void) {
//        if let thumbnail = photo.image {
//            done(thumbnail)
//        }
//        let urlString = "farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_s.jpg"
////        print("\(urlString)")
//    }
    
}
