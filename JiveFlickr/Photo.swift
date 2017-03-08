//
//  Photo.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

/////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                             //
// class Photo - represents the data about a photo returned by Flickr and caches the thumbnail //
//                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////

class Photo {
    
    var farm = 0
    var id = ""
    var server = ""
    var secret = ""
    var title = ""
    var taken = ""
    var thumbnail: UIImage?
    var image: UIImage?
    
    ////////////////////////////////////////////////////////
    //                                                    //
    // fetchThumbnail() - ask Server to fetch me an image //
    //                                                    //
    ////////////////////////////////////////////////////////

    func fetchThumbnail(done: @escaping()->Void) {
        if thumbnail == nil {
            Server.sharedInstance.fetchData("https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_t.jpg") {
                data in
                self.thumbnail = UIImage(data: data!)
                done()
            }
        }
        done()
    }
    
    ///////////////////////////////////////////////////
    //                                               //
    // getDetails() - get extra details about myself //
    //                                               //
    ///////////////////////////////////////////////////

    func getDetails(done: @escaping ()->Void) {
        Server.sharedInstance.fetch("https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=b3380a67070b4cb848414a17c9b58433&photo_id=\(id)&secret=\(secret)&format=json&nojsoncallback=1") {
            json in
            if let photo = json["photo"] as? [String:Any] {
                if let dates = photo["dates"] as? [String:Any] {
                    if let taken = dates["taken"] as? String {
                        self.taken = taken
                        if self.image == nil {
                            Server.sharedInstance.fetchData("https://farm\(self.farm).staticflickr.com/\(self.server)/\(self.id)_\(self.secret)_b.jpg") {
                                data in
                                self.image = UIImage(data: data!)
                                done()
                            }
                        }
                    }
                }
            }
        }
    }

    ////////////////////////////////////////////////////
    //                                                //
    // dump() - dump all the variables to the console //
    //                                                //
    ////////////////////////////////////////////////////

    func dump() {
        print("Photo")
        print("  farm      \(farm)")
        print("  id        \(id)")
        print("  server    \(server)")
        print("  secret    \(secret)")
        print("  title     \(title)")
        print("  taken     \(taken)")
    }
    
}
