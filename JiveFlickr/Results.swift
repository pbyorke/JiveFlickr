//
//  Results.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 2/15/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class Results: UITableViewController {
    
    var search = ""
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = search
        Model.sharedInstance.searchAll(search) {
            photoArray in
            self.photos = photoArray
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = photos[indexPath.row].title
        return cell
    }

}
