//
//  Photo.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class Photo {
    
    var farm = 0
    var id = ""
    var server = ""
    var secret = ""
    var title = ""
    var thumbnail: String {return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_t.jpg"}
    var image: String {return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_b.jpg"}
    
    
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
