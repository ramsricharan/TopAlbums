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
    enum FontSizes: CGFloat {
        case SuperSmall = 10
        case Small = 14
        case Medium = 16
        case Large = 20
        case XLarge = 24
        case XXLarge = 32
    }
    

    private var album: Album?
    var albumName: String
    var artistName: String
    var thumbnailURL: String
    var isLaunchITunesButtonEnabled: Bool = false
    var iTunesURLString: String = ""
    
    // MARK:- Initialize
    init(Album: Album?) {
        self.album = Album
        self.albumName = Album?.name ?? "Untitled"
        self.artistName = Album?.artistName ?? "No Artist"
        self.thumbnailURL = Album?.artworkUrl100 ?? ""
        
        if let url = Album?.url {
            iTunesURLString = parseToiTunesURL(urlString: url)
            isLaunchITunesButtonEnabled = !iTunesURLString.isEmpty
        }
    }
    
    // MARK:- Public Methods
    
    // Get short Album Name
    func getAlbumNameShort() -> String {
        let maxLen = 20
        guard albumName.count > maxLen else { return albumName }
        if let bracketIndex = albumName.firstIndex(of: "(") {
            let distance = albumName.distance(from: albumName.startIndex, to: bracketIndex)
            if(distance < maxLen) { return String(albumName[..<bracketIndex]).trimmingCharacters(in: .whitespacesAndNewlines) }
        }
        let charArray = Array(albumName)
        var ptr = maxLen-5
        
        while(ptr < charArray.count && charArray[ptr].isLetter ) { ptr += 1 }
        if ptr < maxLen {
            return String(charArray[..<ptr])
        }
        ptr = maxLen-5
        while(ptr > 0 && charArray[ptr].isLetter) { ptr -= 1 }
        if ptr > 0 {
            return String(charArray[..<ptr])
        }
        
        return albumName
    }
    
    // Get Card details
    func getAlbumCardInfoAttr() -> NSAttributedString {
        let title = albumName.count > 15 ? getAlbumNameShort() : albumName
        let titleFont = UIFont.boldSystemFont(ofSize: FontSizes.XLarge.rawValue)
        let titleAttributes :[NSAttributedString.Key: Any] = [
            .font: titleFont,
            .foregroundColor: UIColor.myPrimaryColor
        ]
        let titleAttr = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        
        let artistAttr = generateSideHeadings(heading: "By", content: artistName, fontSize: FontSizes.Small.rawValue)
        
        
        titleAttr.append(artistAttr)
        
        return titleAttr
    }
    
    // Get Copyright Attributed Text
    func getCopyrightAttr() -> NSAttributedString {
        let copyrightString = album?.copyright ?? "No Copyright"
        let font = UIFont.systemFont(ofSize: FontSizes.SuperSmall.rawValue)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
        ]
        return NSAttributedString(string: copyrightString, attributes: attributes)
    }
    
    // Get Full Album Title Attributed Text
    func getAlbumTitleAttr() -> NSAttributedString {
        let albumTitle = album?.name ?? "Untitled"
        let titleFont = UIFont.boldSystemFont(ofSize: FontSizes.XXLarge.rawValue)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
            .foregroundColor: UIColor.myPrimaryColor
        ]
        return NSAttributedString(string: albumTitle, attributes: attributes)
    }
    
    // Get Genre Label Attribute text
    func getGenreAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Genre", content: getGenreString(), fontSize: FontSizes.Medium.rawValue)
    }
    
    // Get Artist Label Attribute text
    func getArtistAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Artist", content: artistName, fontSize: FontSizes.Medium.rawValue)
    }
    
    // Get Release Date Label Attribute text
    func getReleaseDateAttr() -> NSAttributedString {
        return generateSideHeadings(heading: "Release Date", content: getFormattedReleaseDate(), fontSize: FontSizes.Medium.rawValue)
    }
    

    
    //MARK:- Helper Methods
    // Parse URL and replace the existing protocol to iTunes (itms) protocol
    private func parseToiTunesURL(urlString: String) -> String {
        guard let colonIndex = urlString.firstIndex(of: ":") else {return ""}
        let result = "itms" + String(urlString[colonIndex...])  // urlString.substring(from: colonIndex)
        return result
    }
    
    // Returns all the genres of the albums seperated by ','
    private func getGenreString() -> String {
        guard let genres = album?.genres, !genres.isEmpty else {
            return "None"
        }
        let lastIndex = genres.count-1
        var genreString = ""
        
        for (index, genre) in genres.enumerated() {
            if let name = genre.name {
                genreString += index == lastIndex ? "\(name)." : "\(name), "
            }
        }
        return genreString
    }
    
    // Generate Attr String with bold heading and normal content seperated by ':'
    private func generateSideHeadings(heading: String, content: String, fontSize: CGFloat) -> NSAttributedString {
        let title = "\(heading): "
        let subheadingFont = UIFont.boldSystemFont(ofSize: fontSize)
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: subheadingFont]
        
        let contentFont = UIFont.systemFont(ofSize: fontSize)
        let genreAttributes: [NSAttributedString.Key: Any] = [.font: contentFont]
        
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
