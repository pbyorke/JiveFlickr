//
//  Details.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/16/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class Details: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var explanation: UILabel!
    
    var photo = Photo()

    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = photo.getImage()
        explanation.text = photo.title
    }

}
