//
//  AlbumsAPIClient.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation

struct AlbumAPIs {
    let topAlbums = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/non-explicit.json"
    let newReleases = "https://rss.itunes.apple.com/api/v1/us/apple-music/new-releases/all/100/non-explicit.json"
}


class AlbumsAPIClient {
    
    public func fetchTopAlbums() {
        let successHandler: (Feed) -> Void = {feed in
            print(feed)
        }
        
        let errorHandler: (String) -> Void = { errorMessage in
            print(errorMessage)
        }
        
        let url = AlbumAPIs().topAlbums
        NetworkManager.sharedInstance.getData(fromURL: url, successHandler: successHandler, errorHandler: errorHandler)
    }
}
