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

    // MARK: - Widgets
    
    let table: UITableView = {
        let widget = UITableView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.rowHeight = 82
        return widget
    }()
    let spinner: UIView = {
        let widget = UIView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        widget.isHidden = true
        return widget
    }()
    private let activity: UIActivityIndicatorView = {
        let widget = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.startAnimating()
        return widget
    }()

    // MARK: - UIViewController lifecycle
    
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
        
        view.addSubview(spinner)
        spinner.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        spinner.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        spinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        spinner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        spinner.addSubview(activity)
        activity.centerXAnchor.constraint(equalTo: spinner.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: spinner.centerYAnchor).isActive = true
    }
    
}

extension ResultsViewController: ResultsViewControllerProtocol {}
