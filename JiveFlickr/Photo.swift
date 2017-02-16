//
//  Photo.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

class Photo {
    
    var farm = 0
    var id = ""
    var server = ""
    var secret = ""
    var title = ""
    
    func dump() {
        print("Photo")
        print("  farm   \(farm)")
        print("  id     \(id)")
        print("  server \(server)")
        print("  secret \(secret)")
        print("  title  \(title)")
    }
}
