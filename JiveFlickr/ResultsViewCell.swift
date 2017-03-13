//
//  ResultsViewCell.swift
//  JiveFlickr
//
//  Created by Peter Yorke on 3/13/17.
//  Copyright © 2017 Storke Brothers LLC. All rights reserved.
//

import UIKit

class ResultsViewCell: UITableViewCell {
    
    let photo: UIImageView = {
        let widget = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.contentMode = .scaleAspectFit
        return widget
    }()
    let data: UITextView = {
        let widget = UITextView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        widget.isScrollEnabled = false
        widget.isEditable = false
//        widget.backgroundColor = .yellow
        return widget
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.addSubview(photo)
        photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(data)
        data.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        data.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
        data.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 8).isActive = true
        data.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
    }
}
