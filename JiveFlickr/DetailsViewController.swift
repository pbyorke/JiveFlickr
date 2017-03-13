//
//  DetailsViewController.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/13/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var presenter: DetailsViewPresenter!
    
    // MARK: - Widgets
    
    let picture: UIImageView = {
        let widget = UIImageView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.contentMode = .scaleAspectFit
        return widget
    }()
    let explanation: UILabel = {
        let widget = UILabel()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.numberOfLines = 0
        widget.adjustsFontSizeToFitWidth = true
        widget.minimumScaleFactor = 9 / widget.font.pointSize
        return widget
    }()
    let takenLabel: UILabel = {
        let widget = UILabel()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.text = "Taken:"
        return widget
    }()
    let taken: UILabel = {
        let widget = UILabel()
        widget.translatesAutoresizingMaskIntoConstraints = false
        return widget
    }()
    @IBOutlet weak var spinner: UIView!
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - Fill in the UI elements
    
    private func prepareUI() {
        view.backgroundColor = .white
        
        view.addSubview(picture)
        picture.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        picture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        picture.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        picture.heightAnchor.constraint(equalTo: picture.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(explanation)
        explanation.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 8).isActive = true
        explanation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        explanation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        explanation.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        view.addSubview(takenLabel)
        takenLabel.topAnchor.constraint(equalTo: explanation.bottomAnchor, constant: 8).isActive = true
        takenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        takenLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        takenLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        view.addSubview(taken)
        taken.topAnchor.constraint(equalTo: explanation.bottomAnchor, constant: 8).isActive = true
        taken.leadingAnchor.constraint(equalTo: takenLabel.trailingAnchor, constant: 8).isActive = true
        taken.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        taken.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
}

extension DetailsViewController: DetailsViewControllerProtocol {}