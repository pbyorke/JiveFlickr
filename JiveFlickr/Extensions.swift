//
//  Extensions.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

///////////////////////////////////////
//                                   //
// extension String - add a function //
//                                   //
///////////////////////////////////////

extension String {
    func containsString(_ string: String) -> Bool {
        return self.range(of: string) != nil
    }
}
