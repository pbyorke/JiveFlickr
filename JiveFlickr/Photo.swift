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
    var thumbnail: UIImage?
    var image: String {return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_b.jpg"}

    /////////////////////////////////////////////////////////////////////////
    //                                                                     //
    // getThumbnail() - if no cache, get one. then return the cached image //
    //                                                                     //
    /////////////////////////////////////////////////////////////////////////

    func getThumbnail() -> UIImage? {
        if thumbnail == nil {
            do {
                let url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_t.jpg")
                let data = try Data(contentsOf: url!)
                thumbnail = UIImage(data: data)
            } catch {}
        }
        return thumbnail
    }
    
    /////////////////////////////////////////////////
    //                                             //
    // getImage() - get the full image from Flickr //
    //                                             //
    /////////////////////////////////////////////////

    func getImage() -> UIImage? {
        do {
            let url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_b.jpg")
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)
        } catch {}
        return nil
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
        print("  thumbnail \(thumbnail)")
        print("  image     \(image)")
    }
}
