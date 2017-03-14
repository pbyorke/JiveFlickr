//
//  DetailsViewControllerProtocol.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/14/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

protocol DetailsViewControllerProtocol {
    
    func setPicture(_ image: UIImage)
    func setExplanation(_ explanation: String)
    func setTaken(_ taken: String)
    
}
