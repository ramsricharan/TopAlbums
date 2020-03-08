//
//  ViewController.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import UIKit

class AlbumListVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .yellow
        
        let apiClient = AlbumsAPIClient()
        apiClient.fetchTopAlbums()
    }


}

