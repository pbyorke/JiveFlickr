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
    
}
