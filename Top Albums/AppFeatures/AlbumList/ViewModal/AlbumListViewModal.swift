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
    
    // MARK:- Public Methods
    // Get Copyright Attributed Text
    func getCopyrightAttr() -> NSAttributedString {
        let copyrightString = album?.copyright ?? "No Copyright"
        let font = UIFont.systemFont(ofSize: 10)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
        ]
        
        return NSAttributedString(string: copyrightString, attributes: attributes)
    }
    
    // Get Full Album Title Attributed Text
    func getAlbumTitleAttr() -> NSAttributedString {
        let albumTitle = album?.name ?? "Untitled"
        let font = UIFont.boldSystemFont(ofSize: 32)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
        ]
        return NSAttributedString(string: albumTitle, attributes: attributes)
    }
    
    // Get Genre Label Attribute text
    func getGenreAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Genre", content: getGenreString())
    }
    
    // Get Artist Label Attribute text
    func getArtistAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Artist", content: artistName)
    }
    
    // Get Release Date Label Attribute text
    func getReleaseDateAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Release Date", content: getFormattedReleaseDate())
    }
    

    
    //MARK:- Helper Methods
    // Returns all the genres of the albums seperated by ','
    private func getGenreString() -> String {
        guard let genres = album?.genres, !genres.isEmpty else {
            return "None"
        }
        let lastIndex = genres.count-1
        var genreString = ""
        
        for (index, genre) in genres.enumerated() {
            if let name = genre.name {
                genreString += index == lastIndex ? "\(name)" : "\(name), "
            }
        }
        return genreString
    }
    
    // Generate Attr String with bold heading and normal content seperated by ':'
    private func generateSideHeadings(heading: String, content: String) -> NSAttributedString {
        let title = "\(heading): "
        let boldFont = UIFont.boldSystemFont(ofSize: 14)
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        
        let normalFont = UIFont.systemFont(ofSize: 14)
        let genreAttributes: [NSAttributedString.Key: Any] = [.font: normalFont]
        
        let titleAttr = NSMutableAttributedString(string: title, attributes: titleAttributes)
        let genreAttr = NSAttributedString(string: content, attributes: genreAttributes)
        
        titleAttr.append(genreAttr)
        
        return titleAttr
    }
    
    // Returns formatted release date
    private func getFormattedReleaseDate() -> String {
        guard let releaseDate = album?.releaseDate else { return "No release date"}
        
        let inputFormat = DateFormatter()
        inputFormat.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormat.date(from: releaseDate) {
            let outputFormat = DateFormatter()
            outputFormat.dateFormat = "MMM dd, yyyy"
            return outputFormat.string(from: date)
        }
        return "No release date"
    }
    
}
