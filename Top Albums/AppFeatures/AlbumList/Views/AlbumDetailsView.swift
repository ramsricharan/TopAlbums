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
        stack.spacing = 0
//        stack.distribution = UIStackView.Distribution.equalCentering
        stack.alignment = UIStackView.Alignment.center
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
        label.numberOfLines = 0
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
        label.textAlignment = .center
        return label
    }()
    
    // Genre Details
    var genreLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // Release Date Details
    var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.noAutoResizing()
        label.textAlignment = .center
        return label
    }()
    
    var blankView: UIView = {
        let view = UIView()
        view.noAutoResizing()
        return view
    }()
    
    // Visit Album on iTunes button
    var launchAlbumButton: MyRoundedButtons = {
        let button = MyRoundedButtons()
        button.backgroundColor = .myPrimaryColor
        button.layer.shadowColor = UIColor.myPrimaryColor.cgColor
        return button
    }()
    
    
    
    //MARK:- Init mehtods
    init(rootView: UIView) {
        self.rootView = rootView
        setup()
    }
    
    
    //MARK:- Helper Methods
    private func setup() {
        // Add the scrollView
        rootView.addSubviewToEntireView(childView: baseScrollView)
        
        // Add StackView
        baseScrollView.addSubviewToEntireView(childView: stackView)
        stackView.widthAnchor.constraint(equalTo: baseScrollView.widthAnchor).isActive = true
        
        
        // Add all other view to the stackView
        stackView.addArrangedSubview(albumArtImageView)
        albumArtImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        albumArtImageView.heightAnchor.constraint(equalTo: albumArtImageView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(copyrightLabel)
        stackView.setCustomSpacing(40, after: copyrightLabel)
        
        addLabelToStack(titleLabel)
        stackView.setCustomSpacing(20, after: titleLabel)
        
        addLabelToStack(genreLabel)
        addLabelToStack(artistNameLabel)
        addLabelToStack(releaseDateLabel)
        stackView.setCustomSpacing(75, after: releaseDateLabel)
        
        stackView.addArrangedSubview(blankView)
        blankView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        blankView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        

        rootView.addSubview(launchAlbumButton)
        launchAlbumButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        launchAlbumButton.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        launchAlbumButton.leftAnchor.constraint(equalTo: rootView.leftAnchor, constant: 20).isActive = true
        launchAlbumButton.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: -20).isActive = true
        launchAlbumButton.widthAnchor.constraint(equalTo: rootView.widthAnchor, constant: -40).isActive = true
    }
    
    private func addLabelToStack(_ view: UIView) {
        stackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
}


