//
//  AlbumListViewModal.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewModal {
    
    // MARK:- Properties
    var album: Album?
    var albumName: String
    var artistName: String
    var thumbnailURL: String
    
    // MARK:- Initialize
    init(Album: Album) {
        self.album = Album
        self.albumName = Album.name ?? "Untitled"
        self.artistName = Album.artistName ?? "No Artist"
        self.thumbnailURL = Album.artworkUrl100 ?? ""
    }
    
    // MARK:- Helper Methods
    
    
    
}
