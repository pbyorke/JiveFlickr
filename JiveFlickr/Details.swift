//
//  Details.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/16/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////
//                                                  //
// class Details - view controller for DetailsScene //
//                                                  //
//////////////////////////////////////////////////////

class Details: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var taken: UILabel!
    
    var photo = Photo()

    //////////////////////////////////////////////////////////////////////////////////
    //                                                                              //
    // viewDidLoad() - get some 'extra' details about this photo from Flickr        //
    //                 only getting the 'taken' timestamp just to show we can do it //
    //                                                                              //
    //////////////////////////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = photo.getImage()
        explanation.text = photo.title
        photo.getDetails() {
            DispatchQueue.main.async {
                self.taken.text = self.photo.taken
            }
        }
    }

}
