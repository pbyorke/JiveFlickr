//
//  ResultsViewController.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/10/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var presenter: ResultsViewPresenter!
    let table: UITableView = {
        let widget = UITableView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.rowHeight = 82
        return widget
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - Fill in the UI elements
    
    private func prepareUI() {
        view.backgroundColor = .white
        
        view.addSubview(table)
        table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
    }
    
}
