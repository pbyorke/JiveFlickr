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
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        //                                                                                                      //
        // VIPER                                                                                                //
        //                                                                                                      //
        // We are going to instantiate a Singleton BusinessService object and then hand it off to a Singleton   //
        // NavigationHandler, which will in turn pass it off to each Presenter                                  //
        //                                                                                                      //
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let businessService = BusinessService()
        let navigationHandler = NavigationHandler(businessService: businessService)

        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        //                                                                                                      //
        // VIPER                                                                                                //
        //                                                                                                      //
        // We can now ask the new NavigationHandler to instantiate and return a SearchViewPresenter, which will //
        // be the first screen that gets displayed. We get a UIViewController from the SearchViewPresenter and  //
        // assign it as the rootViewController of the main UIWindow                                             //
        //                                                                                                      //
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let searchViewPresenter = navigationHandler.giveMeANewSearchViewPresenter()
        let viewController = searchViewPresenter.viewController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: viewController!)
        window?.makeKeyAndVisible()

        return true
    }

}

