//
//  Album.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    var feed: AlbumData?
}

struct AlbumData: Decodable {
    var title: String?
    var updated: String?
    var results: [Album]?
}

struct Album: Decodable {
    var artistName: String?
    var releaseDate: String?
    var name: String?
    var copyright: String?
    var url: String?
    var artworkUrl100: String?
    var genres: [Genre]?
}

struct Genre: Decodable {
    var genreId: String?
    var name: String?
    var url: String?
}
