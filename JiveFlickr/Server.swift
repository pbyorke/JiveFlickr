//
//  Server.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import Foundation

/////////////////////////////////////////////////////
//                                                 //
// class Server - communications with the internet //
//                                                 //
/////////////////////////////////////////////////////

class Server {
    
    static var sharedInstance = Server() // singleton

    ///////////////////////////////////////////////////////
    //                                                   //
    // fetch() - fetch data and return it in JSON format //
    //                                                   //
    ///////////////////////////////////////////////////////

    func fetch(_ string: String, done: @escaping ([String:Any])->Void) {
        fetchData(string) { // get the raw data
            data in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                done(json as! [String : Any])
            } catch {}
        }
    }
    
    ////////////////////////////////////////////////////
    //                                                //
    // fetchData() - fetch data and return it as Data //
    //                                                //
    ////////////////////////////////////////////////////

    func fetchData(_ string: String, done: @escaping (Data?)->Void) {
        let url = URL(string: string)
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            done(data)
        }
        task.resume()
    }
    
}
