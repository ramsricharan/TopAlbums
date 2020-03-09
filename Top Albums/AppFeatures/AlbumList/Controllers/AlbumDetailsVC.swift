//
//  AlbumDetailsVC.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import UIKit

class AlbumDetailsVC: UIViewController {

    // MARK:- Properties
    var albumViewModal: AlbumListViewModal = AlbumListViewModal(Album: nil)
    lazy var albumDetailsViews: AlbumDetailsView = AlbumDetailsView(rootView: self.view)

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup View
        setupViews()
        
    }
    
    
    
    // MARK:- Helper Methods
    func setupViews() {
        self.view.backgroundColor = .white
        // Setup Title
        self.navigationItem.title = albumViewModal.getAlbumNameShort()
        
        // Add Album Details Views
        albumDetailsViews.albumArtImageView.loadImageFrom(url: albumViewModal.thumbnailURL)
        albumDetailsViews.copyrightLabel.attributedText = albumViewModal.getCopyrightAttr()
        albumDetailsViews.titleLabel.attributedText = albumViewModal.getAlbumTitleAttr()
        albumDetailsViews.genreLabel.attributedText = albumViewModal.getGenreAttr()
        albumDetailsViews.artistNameLabel.attributedText = albumViewModal.getArtistAttr()
        albumDetailsViews.releaseDateLabel.attributedText = albumViewModal.getReleaseDateAttr()
        
        albumDetailsViews.launchAlbumButton.buttonLabel = "Launch in iTunes"
        albumDetailsViews.launchAlbumButton.isEnabled = albumViewModal.isLaunchITunesButtonEnabled
        albumDetailsViews.launchAlbumButton.addTarget(self, action: #selector(onLaunchButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func onLaunchButtonTapped() {
        if let iTunesURL = URL(string: albumViewModal.iTunesURLString),
            UIApplication.shared.canOpenURL(iTunesURL) {
             UIApplication.shared.open(iTunesURL, options: [:], completionHandler: nil)
        } else {
            let title = "Error"
            let message = "Sorry, couldn't launch the album '\(albumViewModal.albumName)' in iTunes App"
            self.showAlert(AlertTitle: title, Message: message)
        }
    }

}
