//
//  Results.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
// class Results - get the keyword(s) from Search, do a Flickr search, then display the results //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////

class Results: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var spinner: UIView!
    
    var search = ""
    var photos = [Photo]()
    var model = Model.sharedInstance
    
    /////////////////////////////////////////////////////////////////
    //                                                             //
    // viewDidLoad() - set up delegates and do a search for photos //
    //                                                             //
    /////////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = search
        spinner.isHidden = false
        table.estimatedRowHeight = 66
        model.searchAll(search) {
            photoArray in
            DispatchQueue.main.async {
                self.spinner.isHidden = true
                self.photos = photoArray
                self.table.reloadData()
            }
        }
    }
    
    ///////////////////////////////////
    //                               //
    // numberOfSections() - always 1 //
    //                               //
    ///////////////////////////////////

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //////////////////////////////////////////////////////////////////////
    //                                                                  //
    // numberOfRowsInSection() - return the number of entries in photos //
    //                                                                  //
    //////////////////////////////////////////////////////////////////////

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    //////////////////////////////////////////////////////
    //                                                  //
    // cellForRowAt() - format the cell for a given row //
    //                                                  //
    //////////////////////////////////////////////////////

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PhotoCell
        let photo = photos[indexPath.row]
        cell?.data.text = photo.title
        cell?.photo.image = photo.getThumbnail()
        cell?.sizeToFit()
        return cell!
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                                                                                        //
    // heightForRowAt() - send back the constant that tells the system to vary the row height //
    //                                                                                        //
    ////////////////////////////////////////////////////////////////////////////////////////////

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
        return 66
    }

}
