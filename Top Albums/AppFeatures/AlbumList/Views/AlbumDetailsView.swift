//
//  AlbumDetailsView.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailsView {
    
    //MARK:- Properties
    private var rootView: UIView
    
    //MARK:- UI Components
    // Base Scroll View
    var baseScrollView: UIScrollView = {
        let view = UIScrollView()
        view.noAutoResizing()
        return view
    }()
    
    // Stack View
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.noAutoResizing()
        stack.axis = .vertical
        stack.alignment = UIStackView.Alignment.center
//        stack.distribution = UIStackView.Distribution.equalCentering
        return stack
    }()
    
    // ImageView for the Thumbnail
    var albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.noAutoResizing()
        return imageView
    }()
    
    // Full Title Label
    var titleLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    // Copyright label
    var copyrightLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    // Artist Details
    var artistNameLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        return label
    }()
    
    // Genre Details
    var genreLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        return label
    }()
    
    // Release Date Details
    var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        return label
    }()
    
    // Visit Album on iTunes button
    var launchAlbumButton: MyRoundedButtons = MyRoundedButtons()
    
    
    
    //MARK:- Init mehtods
    init(rootView: UIView) {
        self.rootView = rootView
        setup()
    }
    
    
    //MARK:- Helper Methods
    private func setup() {
        // Add the scrollView
        rootView.addSubview(baseScrollView)
        baseScrollView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor).isActive = true
        baseScrollView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor).isActive = true
        baseScrollView.leftAnchor.constraint(equalTo: rootView.leftAnchor).isActive = true
        baseScrollView.rightAnchor.constraint(equalTo: rootView.rightAnchor).isActive = true
//        baseScrollView.heightAnchor.constraint(equalTo: rootView.heightAnchor).isActive = true

        
        // Add StackView
        baseScrollView.addSubviewToEntireView(childView: stackView)
        stackView.widthAnchor.constraint(equalTo: baseScrollView.widthAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalTo: baseScrollView.heightAnchor).isActive = true
        
        // Add all other view to the stackView
        stackView.addArrangedSubview(albumArtImageView)
        albumArtImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        albumArtImageView.heightAnchor.constraint(equalTo: albumArtImageView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(copyrightLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(genreLabel)
        stackView.addArrangedSubview(artistNameLabel)
        stackView.addArrangedSubview(releaseDateLabel)

        
        // stackView.addArrangedSubview(launchAlbumButton)
        // launchAlbumButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.75).isActive = true
        
        rootView.addSubview(launchAlbumButton)
        launchAlbumButton.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -20).isActive = true
        launchAlbumButton.leftAnchor.constraint(equalTo: rootView.leftAnchor, constant: 20).isActive = true
        launchAlbumButton.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: -20).isActive = true
        launchAlbumButton.widthAnchor.constraint(equalTo: rootView.widthAnchor, constant: -40).isActive = true
        
    }
    
}
