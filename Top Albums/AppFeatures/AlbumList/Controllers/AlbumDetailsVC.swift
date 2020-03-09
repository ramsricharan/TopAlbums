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
    var albumViewModal: AlbumListViewModal?
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
        guard let albumVM = albumViewModal else { return }
        
        // Setup Title
        self.navigationItem.title = albumVM.albumName
        
        // Add Album Details Views
        albumDetailsViews.albumArtImageView.loadImageFrom(url: albumVM.thumbnailURL)
        albumDetailsViews.copyrightLabel.attributedText = albumVM.getCopyrightAttr()
        albumDetailsViews.titleLabel.attributedText = albumVM.getAlbumTitleAttr()
        albumDetailsViews.genreLabel.attributedText = albumVM.getGenreAttr()
        albumDetailsViews.artistNameLabel.attributedText = albumVM.getArtistAttr()
        albumDetailsViews.releaseDateLabel.attributedText = albumVM.getReleaseDateAttr()
        
        albumDetailsViews.launchAlbumButton.buttonLabel = "Launch in iTunes"
        albumDetailsViews.launchAlbumButton.addTarget(self, action: #selector(onLaunchButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func onLaunchButtonTapped() {
        print("Tapped")
//        var url  = NSURL(string: "itms-apps://apps.apple.com/us/app/facebook/id284882215")
//        if UIApplication.shared.canOpenURL(url! as URL) {
//            UIApplication.shared.openURL(url! as URL)
//        }
//        
////        if let itunesURL = URL(string: "itms://music.apple.com/us/album/fine-line/1485802965?app=music") {
////
////            UIApplication.shared.open(itunesURL, options: [:], completionHandler: nil)
////        }
        
    }

}
