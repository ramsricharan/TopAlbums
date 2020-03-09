//
//  AlbumTableViewCell.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import UIKit


class AlbumTableViewCell: UITableViewCell {
    
    // MARK:- Properties
    let baseViewHeight: CGFloat = 120
    let spacing: CGFloat = 15

    // MARK:- Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        arrangeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.albumArtImageView.image = nil
    }
    
    // MARK:- UI Components
    var baseView: UIView = {
        let view = UIView()
        view.noAutoResizing()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.myPrimaryColor.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .zero

        return view
    }()
    
    var albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.noAutoResizing()
        return imageView
    }()
    
    var albumCardInfoLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK:- Setup Views
    func arrangeViews() {
        // Cell setup
        self.selectionStyle = .none
        
        // Add Base View
        self.addSubviewToEntireView(childView: baseView, paddingTop: 5, paddingBottom: 5, paddingLeft: 5, paddingRight: 5)
        baseView.heightAnchor.constraint(equalToConstant: baseViewHeight).isActive = true
        baseView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true

        // Add other Views to BaseView
        // Album Art ImageView
        let side:CGFloat = baseViewHeight-10
        baseView.addSubview(albumArtImageView)
        albumArtImageView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 5).isActive = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: side).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: side).isActive = true
        albumArtImageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        
        // Album Card Info View
        baseView.addSubview(albumCardInfoLabel)
        albumCardInfoLabel.leftAnchor.constraint(equalTo: albumArtImageView.rightAnchor, constant: spacing).isActive = true
        albumCardInfoLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -5).isActive = true
        albumCardInfoLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 5).isActive = true
        albumCardInfoLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor,constant: -5).isActive = true
        
    }

}
