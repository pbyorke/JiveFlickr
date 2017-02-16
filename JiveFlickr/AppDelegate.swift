//
//  AppDelegate.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//
// https://code.tutsplus.com/tutorials/the-ultimate-guide-to-decoding-the-flickr-api--net-5981
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        _ = Model() // instantiate singleton
        _ = Server() // instantiate singleton
        return true
    }

}

