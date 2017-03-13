//
//  BusinessService.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/9/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                      //
// VIPER                                                                                                //
//                                                                                                      //
// The BusinessService will handle all data that is external to the application. This includes API      //
// calls to web services and internal persistences such as CoreData/Realm or even UserDefaults. This    //
// data can flow to and from either a Presenter or from the NavigationHandler                           //
//                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////

import Foundation

class BusinessService {
    
    fileprivate func parameterize(_ string: String) -> String {
        var searchString = ""
        let array = string.components(separatedBy: " ")
        for word in array {
            if !searchString.isEmpty {
                searchString += ","
            }
            searchString += word
        }
        return searchString
    }
    
    fileprivate func fetch(_ string: String, done: @escaping ([String:Any])->Void) {
        fetchData(string) { // get the raw data
            data in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                done(json as! [String : Any])
            } catch {}
        }
    }
    
    fileprivate func fetchData(_ string: String, done: @escaping (Data?)->Void) {
        let url = URL(string: string)
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            done(data)
        }
        task.resume()
    }
    
}

extension BusinessService: BusinessServiceProtocol {
    
    func getSearchesFromDefaults() -> [String] {
        let defaults = UserDefaults.standard
        
        
        
//        return defaults.stringArray(forKey: "searches") ?? [String]()
        return ["bridge","dog"]
        
        
        
        
    }
    
    func searchAll(_ string: String, done: @escaping ([Photo])->Void) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b3380a67070b4cb848414a17c9b58433&tags=\(parameterize(string))&per_page=100&format=json&nojsoncallback=1"
        fetch(urlString) {
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
    
    func fetchThumbnail(photo: Photo, done: @escaping()->Void) {
        if photo.thumbnail == nil {
            fetchData("https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_t.jpg") {
                data in
                photo.thumbnail = UIImage(data: data!)
                done()
            }
        }
        done()
    }
    
}
